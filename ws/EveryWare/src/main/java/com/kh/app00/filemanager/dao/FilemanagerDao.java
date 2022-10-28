package com.kh.app00.filemanager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.filemanager.vo.FilemanagerVo;

public interface FilemanagerDao {

	
	//모든 파일 조회
	List<FilemanagerVo> selectAll(SqlSessionTemplate sst);

	List<FilemanagerVo> selectRecent(SqlSessionTemplate sst);

	List<FilemanagerVo> selectStar(SqlSessionTemplate sst);

	List<FilemanagerVo> selectDel(SqlSessionTemplate sst);
	
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

}
