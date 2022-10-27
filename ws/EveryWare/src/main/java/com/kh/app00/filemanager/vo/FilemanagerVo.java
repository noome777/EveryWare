package com.kh.app00.filemanager.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FilemanagerVo {

	
	
	private String fileCode;
	private String empCode;
	private String fileTitle;
	private String fileContent;
	private String fileName;
	private MultipartFile fileOriginname;
	private String fileUrl;
	private String fileEnrolldate;
	private String fileCnt;
	private String fileBookmark;
	private String fileDeldate;
	private String fileRange;
}
