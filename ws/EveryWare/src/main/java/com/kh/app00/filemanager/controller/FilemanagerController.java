package com.kh.app00.filemanager.controller;

import java.io.File;
import java.io.IOException;
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

	//메인 파일함 조회(화면)
	@GetMapping("select")
	public String select(Model model) {

		List<FilemanagerVo> flist = service.selectAll();
		List<FilemanagerVo> flistRecent = service.selectRecent();
		
		model.addAttribute("flist", flist);
		model.addAttribute("flistRecent", flistRecent);
		
		return "filemanager/fileManager";
	}
	
	//최근 업로드 파일함(화면)
	@GetMapping("recent")
	public String recent(Model model) {
		List<FilemanagerVo> flist = service.selectRecent();
		model.addAttribute("flist", flist);
		
		return "filemanager/recent-fileManager";
	}
	
	//즐겨찾기 파일함(화면)
	@GetMapping("star")
	public String star(Model model) {
		List<FilemanagerVo> flist = service.selectStar();
		model.addAttribute("flist", flist);
		return "filemanager/star-fileManager";
	}
	
	//공유 파일함(화면)
	@GetMapping("cloud")
	public String cloud() {

		return "filemanager/cloud-fileManager";
	}
	
	//휴지통(화면)
	@GetMapping("trash")
	public String trash(Model model) {
		List<FilemanagerVo> flist = service.selectDel();
		model.addAttribute("flist", flist);
		
		return "filemanager/trash-fileManager";
	}
		
	//파일 추가(화면)
	@GetMapping("insert")
	public String insert() {

		return "filemanager/insert-fileManager";
	}
	
	
	//파일추가(기능)
	@PostMapping("addfile")
	public String addFile(FilemanagerVo vo,HttpSession session, HttpServletRequest req) {
		
		System.out.println("vo ::: " + vo);
		
		if (vo.getFileOriginname() != null && !vo.getFileOriginname().isEmpty()) {
			//파일있음
			//파일업로드후 저장된 파일명 얻기
			String savePath = req.getServletContext().getRealPath("/resources/upload/filemanager/");
			System.out.println("savePath ::: " + savePath);
			String changeName = FileUploader.fileUpload(vo.getFileOriginname(), savePath);
			System.out.println("getFileOriginname ::: " + vo.getFileOriginname());
			System.out.println("FileName ::: " + vo.getFileName());
			vo.setFileName(changeName);
			System.out.println("FileName 이후 ::: " + vo.getFileName());
			
			String ext = changeName.substring(changeName.lastIndexOf(".")+ 1);
			vo.setFileType(ext);
			vo.setFileUrl(savePath);
			System.out.println("changeName ::: " + changeName);
			
			File file = new File(savePath+changeName);
			long bytes = file.length();
			long kilobyte = bytes / 1024;
			String size = "";
			if(kilobyte<1024) {
				size = Long.toString(kilobyte);
				size = size + "KB";
			}else {
				size = Long.toString(kilobyte);
				size = size + "MB";
			}
			vo.setFileSize(size);
		}
		
		
		
		
		int result = service.addFile(vo);
		
		
		
		
		if (result == 1) {
			session.setAttribute("alertMsg", "파일이 추가 되었습니다.");
			System.out.println("1");
			return "redirect:/filemanager/select";
		}else {
			System.out.println("2");
			return "";
		}
		
	}
	
	
	//즐겨찾기 기능 추가
	@GetMapping("addStar/{fileCode}")
	public String addStar(@PathVariable String fileCode,HttpSession session) {
		
		int result = service.addStar(fileCode);
		
		if (result == 1) {
			session.setAttribute("alertMsg", "즐겨찾기 추가 되었습니다.");
			System.out.println("1");
		}else {
			System.out.println("2");
		}
		
		return "redirect:/filemanager/select"; 
	}
	
	//삭제 기능 추가
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
	
	//휴지통 복원기능 추가
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
	
	@PostMapping("detail")
	@ResponseBody
	public FilemanagerVo detail(@RequestParam String num, Model model) {
		FilemanagerVo voinfo = service.selectOne(num);
		
		System.out.println(voinfo);
		
		model.addAttribute("voinfo", voinfo);
		
		
		return voinfo; 
	}
	
}
