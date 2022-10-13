package com.kh.app00.filemanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("filemanager")
public class FilemanagerController {
	
	//파일함 조회
	@GetMapping("select")
	public String select() {

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
