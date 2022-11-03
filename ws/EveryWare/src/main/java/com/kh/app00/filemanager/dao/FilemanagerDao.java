package com.kh.app00.filemanager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.filemanager.vo.FilemanagerVo;

public interface FilemanagerDao {

	
	//모든 파일 조회
	List<FilemanagerVo> selectAll(SqlSessionTemplate sst, String empCode);
	//최근등록된 파일 조회
	List<FilemanagerVo> selectRecent(SqlSessionTemplate sst, String empCode);
	//즐겨찾기된 파일 조회
	List<FilemanagerVo> selectStar(SqlSessionTemplate sst, String empCode);
	//삭제된 파일 조회
	List<FilemanagerVo> selectDel(SqlSessionTemplate sst, String empCode);
	
	//즐겨찾기 추가
	int addStar(SqlSessionTemplate sst, String fileCode);
	
	//복원하기 추가
	int restore(SqlSessionTemplate sst, String fileCode);
	
	//삭제하기 추가
	int addDel(SqlSessionTemplate sst, String fileCode);
	
	//작성하기 추가
	int addFile(SqlSessionTemplate sst, FilemanagerVo vo);
	
	//선택조회
	FilemanagerVo selectOne(SqlSessionTemplate sst, String fileCode);
	
	//복사하기 추가
	int addCopy(SqlSessionTemplate sst, FilemanagerVo vo);
	
	//수정하기 추가
	int edit(SqlSessionTemplate sst, FilemanagerVo vo);
	
	//공유하기 추가
	int addCloud(SqlSessionTemplate sst, FilemanagerVo vo);

}
