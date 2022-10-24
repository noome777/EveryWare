package com.kh.app00.filemanager.service;

import java.util.List;

import com.kh.app00.filemanager.vo.FilemanagerVo;

public interface FilemanagerService {
	
	//모든파일 조회
	List<FilemanagerVo> selectAll();

	List<FilemanagerVo> selectRecent();

	List<FilemanagerVo> selectStar();

	List<FilemanagerVo> selectDel();
	
	
	//즐겨찾기 추가
	int addStar(String fileCode);

}
