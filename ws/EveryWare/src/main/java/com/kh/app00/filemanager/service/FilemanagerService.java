package com.kh.app00.filemanager.service;

import java.util.List;

import com.kh.app00.filemanager.vo.FilemanagerVo;

public interface FilemanagerService {
	
	//모든파일 조회
	List<FilemanagerVo> selectAll(String empCode);
	//최근등록된 파일 조회
	List<FilemanagerVo> selectRecent(String empCode);
	//즐겨찾기된 파일 조회
	List<FilemanagerVo> selectStar(String empCode);
	//삭제된 파일 조회
	List<FilemanagerVo> selectDel(String empCode);
	//공유된 파일 조회
	List<FilemanagerVo> selectCloud(String deptCode);
	
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
	
	//수정하기 추가
	int edit(FilemanagerVo vo);
	
	//공유하기 추가
	int addCloud(FilemanagerVo vo);



}
