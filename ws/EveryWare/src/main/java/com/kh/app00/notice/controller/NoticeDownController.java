package com.kh.app00.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeDownController {
	
	@GetMapping("download")
	public ResponseEntity<ByteArrayResource> download(HttpServletRequest req) throws IOException {
		
		//파일 객체 준비
		String rootPath = req.getServletContext().getRealPath("/resources/upload/");
		File target = new File(rootPath +"/img01.png");
		
		//파일 -> 바이트 -> 리소스
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource res = new ByteArrayResource(data);
		
		
		
		return ResponseEntity
			.ok()
			.contentType(MediaType.APPLICATION_OCTET_STREAM)
			.contentLength(54997L)
			.header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=abc.png")
			.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
			.body(res);
	}
}