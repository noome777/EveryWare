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

}
