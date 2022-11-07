package com.kh.app00.filemanager.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app00.common.FileUploader;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.filemanager.service.FilemanagerService;
import com.kh.app00.filemanager.vo.FilemanagerVo;

@Controller
@RequestMapping("filemanager")
public class FilemanagerController {
	
	private final FilemanagerService service;
	
	@Autowired
	public FilemanagerController(FilemanagerService service) {
		this.service = service;
	}

	/**
	 * 메인 파일함 조회(화면)
	 * @param model
	 * @param session
	 * @return filemanager/fileManager.jsp
	 */
	@GetMapping("select")
	public String select(Model model, HttpSession session) {

		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }
		
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
		List<FilemanagerVo> flist = service.selectAll(loginMember.getEmpCode());
		List<FilemanagerVo> flistRecent = service.selectRecent(loginMember.getEmpCode());
		
		model.addAttribute("flist", flist);
		model.addAttribute("flistRecent", flistRecent);
		
		return "filemanager/fileManager";
	}
	
	
	/**
	 * 최근 업로드 파일함(화면)
	 * @param model
	 * @param session
	 * @return filemanager/recent-fileManager.jsp
	 */
	@GetMapping("recent")
	public String recent(Model model, HttpSession session) {
		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }
		
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
		
		
		List<FilemanagerVo> flist = service.selectRecent(loginMember.getEmpCode());
		model.addAttribute("flist", flist);
		
		return "filemanager/recent-fileManager";
	}
	
	/**
	 * 즐겨찾기 파일함(화면)
	 * @param model
	 * @param session
	 * @return filemanager/star-fileManager.jsp
	 */
	@GetMapping("star")
	public String star(Model model, HttpSession session) {
		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }
		
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
		
		
		List<FilemanagerVo> flist = service.selectStar(loginMember.getEmpCode());
		model.addAttribute("flist", flist);
		return "filemanager/star-fileManager";
	}
	
	/**
	 * 공유 파일함(화면)
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("cloud")
	public String cloud(Model model, HttpSession session) {
		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }
        
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
		
		
		List<FilemanagerVo> flist = service.selectCloud(loginMember.getDeptCode());
		model.addAttribute("flist", flist);
        
		return "filemanager/cloud-fileManager";
	}
	
	/**
	 * 휴지통(화면)
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("trash")
	public String trash(Model model, HttpSession session) {
		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }
		
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
		
		List<FilemanagerVo> flist = service.selectDel(loginMember.getEmpCode());
		model.addAttribute("flist", flist);
		
		return "filemanager/trash-fileManager";
	}
		
	/**
	 * 파일 추가(화면)
	 * @param session
	 * @return
	 */
	@GetMapping("insert")
	public String insert(HttpSession session) {
		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }
        
		return "filemanager/insert-fileManager";
	}
	
	
	/**
	 * 파일추가(기능)
	 * @param vo
	 * @param session
	 * @param req
	 * @return
	 */
	@PostMapping("addfile")
	public String addFile(FilemanagerVo vo,HttpSession session, HttpServletRequest req) {
		
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
		
		if (vo.getFileOriginname() != null && !vo.getFileOriginname().isEmpty()) {
			//파일있음
			//파일업로드후 저장된 파일명 얻기
			String savePath = req.getServletContext().getRealPath("/resources/upload/filemanager/");
			String changeName = FileUploader.fileUpload(vo.getFileOriginname(), savePath);
			vo.setFileOriginname(vo.getFileOriginname());
			vo.setFileName(changeName);
			
			String ext = changeName.substring(changeName.lastIndexOf(".")+ 1);
			vo.setFileType(ext);
			vo.setFileUrl(savePath);
			
			File file = new File(savePath+changeName);
			long bytes = file.length();
			long kilobyte = bytes / 1024;
			String size = "";
			if(kilobyte<1024) {
				size = Long.toString(kilobyte);
				size = size + "KB";
			}else {
				long megabyte = kilobyte / 1024;
				size = Long.toString(megabyte);
				size = size + "MB";
			}
			vo.setFileSize(size);
		}
		vo.setEmpCode(loginMember.getEmpCode());
		
		int result = service.addFile(vo);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "파일이 추가 되었습니다.");
		}else {
            session.setAttribute("alertMsg", "파일등록 실패하셨습니다.");
        }
		
		return "redirect:/filemanager/select";
	}
	
	/**
	 * 즐겨찾기 기능 추가
	 * @param fileCode
	 * @param session
	 * @return
	 */
	@GetMapping("addStar/{fileCode}")
	public String addStar(@PathVariable String fileCode,HttpSession session) {
		
		int result = service.addStar(fileCode);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "즐겨찾기 추가되었습니다.");
        } else {
            session.setAttribute("alertMsg", "즐겨찾기 실패하셨습니다.");
        }
		
		return "redirect:/filemanager/select"; 
	}
	
	/**
	 * 삭제 기능 추가
	 * @param fileCode
	 * @param session
	 * @return
	 */
	@GetMapping("addDel/{fileCode}")
	public String addDel(@PathVariable String fileCode,HttpSession session) {
			
		int result = service.addDel(fileCode);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "해당파일이 삭제 되었습니다.");
			System.out.println("1");
		}else {
			System.out.println("2");
		}
		
		return "redirect:/filemanager/select"; 
	}
	
	/**
	 * 휴지통 복원기능 추가
	 * @param fileCode
	 * @param session
	 * @return
	 */
	@GetMapping("restore/{fileCode}")
	public String restore(@PathVariable String fileCode,HttpSession session) {
			
		int result = service.restore(fileCode);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "해당 파일이 복원 되었습니다.");
			System.out.println("1");
		}else {
			System.out.println("2");
		}
		
		return "redirect:/filemanager/select"; 
	}
	
	/**
	 * 파일 다운로드 구현
	 * @param fileCode
	 * @param req
	 * @return
	 * @throws IOException
	 */
	//스프링에서 권장하는 다운로드 방식()
	//ResponseEntity : 응답정보들이 모여있는 객체
	@GetMapping("download/{fileCode}")
	public ResponseEntity download(@PathVariable String fileCode, HttpServletRequest req) throws IOException {
		
		FilemanagerVo vo = service.selectOne(fileCode);
		
		//파일 객체 준비
		String rootPath = req.getServletContext().getRealPath("/resources/upload/filemanager/");
		
		File target = new File(rootPath + vo.getFileName());
		System.out.println(target);
		
		//파일 -> 바이트 -> ???
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
			.ok()
			.contentType(MediaType.APPLICATION_OCTET_STREAM)
			.header(HttpHeaders.CONTENT_DISPOSITION, "attachement; filename="+ vo.getFileName() )
			.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
			.header(HttpHeaders.CONTENT_LENGTH, target.length() + "")
			.body(res);
	}
	
	/**
	 * 파일정보 조회
	 * @param num
	 * @param model
	 * @return
	 */
	@PostMapping("detail")
	@ResponseBody
	public FilemanagerVo detail(@RequestParam String num, Model model) {
		FilemanagerVo voinfo = service.selectOne(num);
		
		model.addAttribute("voinfo", voinfo);
		
		return voinfo; 
	}
	
	/**
	 * 복사기능
	 * @param fileCode
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@GetMapping("addCopy/{fileCode}")
	public String addCopy(@PathVariable String fileCode,HttpSession session) throws IOException {
			
		FilemanagerVo vo = service.selectOne(fileCode);

		//원본 File 준비
		File file = new File(vo.getFileUrl()+vo.getFileName());
		
		//복사를 위해 제목 타이틀 변경
		vo.setFileTitle(vo.getFileTitle()+" 복사본");
		
		//복사하기 위해 vo에 저장된 파일명 가져오기
		String fileName = vo.getFileName();
		int pos = fileName.lastIndexOf(".");
		String name = fileName.substring(0, pos);
		
		//_copy 붙이고 확장자 붙이기
		name = name+ "_copy" + "." + vo.getFileType();
		
		vo.setFileName(name);
		
		
        //복사할 File 준비
        File newFile = new File(vo.getFileUrl()+name);
 
        // 2. 복사
        Files.copy(file.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
 
        
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
        vo.setEmpCode(loginMember.getEmpCode());
        // DB 전달하기
		int result = service.addCopy(vo);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "해당 파일이 복사 되었습니다.");
		}else {
			session.setAttribute("alertMsg", "해당 파일 복사 실패.");
		}
		
		return "redirect:/filemanager/select"; 
	}
	
	/**
	 * 수정화면
	 * @param fileCode
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("edit/{fileCode}")
	public String edit(@PathVariable String fileCode, HttpSession session,Model model){
		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
        // empCode를 비교하기 위해 vo 불러오기
        FilemanagerVo vo = service.selectOne(fileCode);
		
        if(!vo.getEmpCode().equals(loginMember.getEmpCode())) {
        	session.setAttribute("alertMsg", "파일 권한이 없습니다.");
        	return "redirect:/filemanager/select";
        }

		model.addAttribute("vo", vo);
		
		return "filemanager/edit-fileManager"; 
	}
	
	/**
	 * 수정기능
	 * @param fileCode
	 * @param vo
	 * @param model
	 * @param session
	 * @return
	 */
	@PostMapping("edit/{fileCode}")
	public String edit(@PathVariable String fileCode, FilemanagerVo vo, Model model, HttpSession session){

		// DB 전달하기
		int result = service.edit(vo);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "해당 파일이 수정되었습니다.");
		}else {
			session.setAttribute("alertMsg", "해당 파일 수정 실패.");
		}
			
		return "redirect:/filemanager/select"; 
	}
	
	
	/**
	 * 공유하기 기능
	 * @param fileCode
	 * @param session
	 * @return
	 */
	@GetMapping("addCloud/{fileCode}")
	public String addCloud(@PathVariable String fileCode,HttpSession session) {
			
		FilemanagerVo vo = service.selectOne(fileCode);
		
		int result = service.addCloud(vo);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "해당 파일이 공유 되었습니다.");
		}else {
			session.setAttribute("alertMsg", "해당 파일 공유 실패.");
		}
		
		return "redirect:/filemanager/select"; 
	}
}
