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

	//복원하기 추가
	int restore(String fileCode);
	
	//삭제하기 추가
	int addDel(String fileCode);
	
	//작성하기 추가
	int addFile(FilemanagerVo vo);
	
	//선택조회
	FilemanagerVo selectOne(String fileCode);
	
	//복사하기 추가
	int addCopy(FilemanagerVo vo);


}
