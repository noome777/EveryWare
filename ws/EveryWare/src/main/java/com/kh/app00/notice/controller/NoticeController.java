package com.kh.app00.notice.controller;

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
import com.kh.app00.notice.service.NoticeService;
import com.kh.app00.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private final NoticeService ns;

	@Autowired
	public NoticeController(NoticeService ns) {
		this.ns = ns;
	}

	// 사내공지 목록 조회
	@GetMapping("noticeMain")
	public String noticeMain(Model model) {

		// Pagevo pv = Pagination.getPagevo(totalCount, pno, 5, 10);

		List<NoticeVo> nList = ns.selectList();
		

		model.addAttribute("nList", nList);
		

		return "notice/noticeMain";

	}

	// 게시글 작성 (관리자 계정만)
	@GetMapping("write")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}

	@PostMapping("write")
	public String write(NoticeVo vo, Model model, HttpSession session, EmpVo evo,HttpServletRequest req) {
		
			
			EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
			String no = loginMember.getEmpCode();
			
			evo.setDeptCode(no);
			
			int result = ns.write(vo);
			
			MultipartFile[] fArr = vo.getF();
			
			if(!fArr[0].isEmpty()) {			// 클라이언트 로부터 전달받은 파일 있음
				
				for(int i= 0; i < fArr.length; ++i) {
					MultipartFile f =  fArr[i];
					
					// 원본파일명
					String originName = f.getOriginalFilename();
					String ext = originName.substring(originName.lastIndexOf("."));
					
					//변경된 파일명
					long now = System.currentTimeMillis();
					int randomNum = (int)(Math.random() * 90000 + 10000);
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
				session.setAttribute("alertMsg", "사내공지 작성 성공!");
				return "redirect:/notice/noticeMain";
			} else {
				model.addAttribute("msg", "사내공지 작성 실패...");
				return "error/errorPage";
			}

		}
		
		

	// 상세 조회
	@GetMapping("detail/{noticeCode}")
	public String noticeDetail(@PathVariable String noticeCode, Model model) {

		NoticeVo nvo = ns.selectOne(noticeCode);

		model.addAttribute("nvo", nvo);
		return "notice/noticeDetail";

	}
}
