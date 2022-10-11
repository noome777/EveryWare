package com.kh.app00.filemanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("filemanager")
public class FilemanagerController {
	@GetMapping("select")
	public String select() {
		
		return "filemanager/fileManager";
	}
}
