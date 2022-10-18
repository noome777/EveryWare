package com.kh.app00.filemanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

	//파일함 조회
	@GetMapping("select")
	public String select(Model model) {

		List<FilemanagerVo> flist = service.selectAll();
		
		model.addAttribute("flist", flist);
		
		System.out.println(flist);
		return "filemanager/fileManager";
	}
	
	//최근 업로드 파일함
	@GetMapping("recent")
	public String recent() {
		
		return "filemanager/recent-fileManager";
	}
	
	//즐겨찾기 파일함
	@GetMapping("star")
	public String star() {

		return "filemanager/star-fileManager";
	}
	
	//공유 파일함
	@GetMapping("cloud")
	public String cloud() {

		return "filemanager/cloud-fileManager";
	}
	
	//공유 파일함
	@GetMapping("trash")
	public String trash() {

		return "filemanager/trash-fileManager";
	}
		
	//공유 파일함
	@GetMapping("insert")
	public String insert() {

		return "filemanager/insert-fileManager";
	}
}
