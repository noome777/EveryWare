package com.kh.app00.mail.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.mail.service.MailService;
import com.kh.app00.mail.vo.MailVo;

@Controller
@RequestMapping("mail")
public class MailController {
	
	private final MailService ms;
	
	@Autowired
	public MailController(MailService ms) {
		this.ms = ms;
	}

	@GetMapping("mailMain")
	public String mailMain(Model model) {
		
		List<MailVo> mList = ms.selectList();
		
		model.addAttribute("mList", mList);
		
		
		return "mail/mailMain";
	}
	
	@GetMapping("write")
	public String mailWrite() {
		return "mail/mailWrite";
	}
	
	@PostMapping("write")
	public String write(MailVo mvo, Model model, HttpSession session, EmpVo evo, HttpServletRequest req ) {
		
		EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
		String no = loginMember.getEmpCode();

		mvo.setEmpCode(no);
		
		int result = ms.write(mvo);
		
		
		MultipartFile[] fArr = mvo.getF();

		if (!fArr[0].isEmpty()) { // 클라이언트 로부터 전달받은 파일 있음

			for (int i = 0; i < fArr.length; ++i) {
				MultipartFile f = fArr[i];

				// 원본파일명
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf("."));

				// 변경된 파일명
				long now = System.currentTimeMillis();
				int randomNum = (int) (Math.random() * 90000 + 10000);
				String changeFileName = now + "_" + randomNum;

				// 2. 저장할 경로파일 객체 생성
				String rootPath = req.getServletContext().getRealPath("/resources/upload/");
				File targetFile = new File(rootPath + changeFileName + ext);

				// 3. 저장
				try {
					f.transferTo(targetFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if (result == 1) {
			session.setAttribute("alertMsg", "메일 작성 성공!");
			return "redirect:/mail/mailMain";
		} else {
			model.addAttribute("msg", "메일 작성 실패...");
			return "error/errorPage";
		}
		
		
		
	}
	
	@PostMapping("mailDelete/{mailCode}")
	public String mailDelete(@PathVariable String mailCode, HttpServletRequest req,HttpSession session, Model model) {
		
		String [] ajaxMsg = req.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		
		for(int i = 0; i<size; i++) {
			ms.delete(ajaxMsg[i]);
		}
		
		return "redirect:/mail/mailMain";
		
	}	
	
	@GetMapping("reply")
	public String mailReply() {
		return "mail/mailReply";
	}
	
	
	@GetMapping("receive")
	public String mailReceive() {
		return "mail/mailReceive";
	}
	
	@GetMapping("send")
	public String mailSend() {
		return "mail/mailSend";
	}
	
	@GetMapping("self")
	public String mailSelf() {
		return "mail/mailSelf";
	}
	
	@GetMapping("trash")
	public String mailTrash() {
		return "mail/mailTrash";
	}
	
	@GetMapping("detail")
	public String mailDetail() {
		return "mail/mailDetail";
	}
	
	}
