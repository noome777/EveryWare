package com.kh.app00.filemanager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.filemanager.vo.FilemanagerVo;

public interface FilemanagerDao {

	
	//모든 파일 조회
	List<FilemanagerVo> selectAll(SqlSessionTemplate sst);

}
