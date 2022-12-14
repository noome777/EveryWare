package com.kh.app00.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.mail.vo.MailFileVo;
import com.kh.app00.notice.service.NoticeService;
import com.kh.app00.notice.vo.NoticeFileVo;
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
	@GetMapping("noticeMain/{pno}")
	public String noticeMain(Model model, @PathVariable int pno) {

		int totalCount = ns.selectTotalCnt();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		

		List<NoticeVo> nList = ns.selectList(pv);

		model.addAttribute("nList", nList);
		model.addAttribute("pv", pv);
		
		
		return "notice/noticeMain";

	}

	// 게시글 작성 (관리자 계정만)
	@GetMapping("write")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}

	@PostMapping("write")
	public String write(NoticeVo vo, Model model, HttpSession session, EmpVo evo, HttpServletRequest req, NoticeFileVo nfvo) {

		EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
		String no = loginMember.getEmpCode();

		evo.setEmpCode(no);

		int result = ns.write(vo);

		MultipartFile[] fArr = nfvo.getF();

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
				
				String noticeFilename = originName;

				// 2. 저장할 경로파일 객체 생성
				String rootPath = req.getServletContext().getRealPath("/resources/upload/notice/");
				String fileRoot = rootPath + noticeFilename;
				File targetFile = new File(rootPath + originName );
				
				nfvo.setNoticeChangename(changeFileName);
				nfvo.setNoticeOriginname(originName);
				nfvo.setNoticeFileroot(fileRoot);
				// 3. 저장
				try {
					f.transferTo(targetFile);
					int result2 = ns.fileWrite(nfvo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
				
		if (result == 1) {
			session.setAttribute("alertMsg", "사내공지 작성 성공!");
			return "redirect:/notice/noticeMain/1";
		} else {
			model.addAttribute("msg", "사내공지 작성 실패...");
			return "error/errorPage";
		}

	}

	// 상세 조회
	@GetMapping("noticeDetail/{noticeCode}")
	public String noticeDetail(@PathVariable String noticeCode, Model model) {

		NoticeVo nvo = ns.selectOne(noticeCode);
		List<NoticeFileVo> noticeFileList = ns.selectNoticeFileList(noticeCode);

		model.addAttribute("nvo", nvo);
		model.addAttribute("noticeFileList",noticeFileList);
		return "notice/noticeDetail";

	}
	
	@GetMapping("download/{noticeCode}/{noticeFilecode}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable String noticeCode, @PathVariable String noticeFilecode, HttpServletRequest req) throws IOException {
		
		List<NoticeFileVo> fileVo = ns.selectFile(noticeFilecode);
		
		
		//파일 객체 준비
		String rootPath = req.getServletContext().getRealPath("/resources/upload/notice/");
		String name = fileVo.get(0).getNoticeOriginname();
		
		File target = new File(rootPath + name);
		
		
		//파일 -> 바이트 -> 리소스
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource res = new ByteArrayResource(data);
		
		
		
		return ResponseEntity
				.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + name)
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header(HttpHeaders.CONTENT_LENGTH, target.length() + "")
				.body(res);
	}
	
	
	//수정하기
	@GetMapping("noticeEdit/{noticeCode}")
	public String edit(@PathVariable String noticeCode , Model model) {
		NoticeVo nvo = ns.selectOne(noticeCode);
		model.addAttribute("nvo" , nvo);
		return "notice/noticeEdit";
	}
	
	//게시글 수정
	@PostMapping("noticeEdit/{noticeCode}")
	public String edit(@PathVariable String noticeCode , NoticeVo nvo, HttpSession session, NoticeFileVo nfvo,HttpServletRequest req) {
		
		nvo.setNoticeCode(noticeCode);
		
		
		//디비 다녀오기
		int result = ns.edit(nvo);
		MultipartFile[] fArr = nfvo.getF();

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
				
				String noticeFilename = originName;

				// 2. 저장할 경로파일 객체 생성
				String rootPath = req.getServletContext().getRealPath("/resources/upload/notice/");
				String fileRoot = rootPath + noticeFilename;
				File targetFile = new File(rootPath + originName );
				
				nfvo.setNoticeChangename(changeFileName);
				nfvo.setNoticeOriginname(originName);
				nfvo.setNoticeFileroot(fileRoot);
				// 3. 저장
				try {
					f.transferTo(targetFile);
					int result2 = ns.fileWrite(nfvo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if(result == 1) {
			//성공 화면 
			session.setAttribute("alertMsg", "게시글 수정 성공!!!");
			return "redirect:/notice/noticeDetail/" + noticeCode;
		}else {
			//실패
			session.setAttribute("alertMsg", "게시글 수정 실패...");
			return "redirect:/";
		}
		
	}
	
	// 삭제하기
	@GetMapping("noticeDelete/{noticeCode}")
	public String delete(@PathVariable String noticeCode, HttpSession session, Model model) {

		int result = ns.delete(noticeCode);

		if (result == 1) {
			// 삭제성공 => 알람 , 리스트
			session.setAttribute("alertMsg", "게시글 삭제 성공!");
			return "redirect:/notice/noticeMain/1";
		} else {
			// 삭제실패 => 메세지 , 에러페이지
			model.addAttribute("msg", "게시글 삭제 실패 ...");
			return "error/errorPage";
		}

	}
}
