package com.kh.app00.filemanager.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.filemanager.dao.FilemanagerDao;
import com.kh.app00.filemanager.vo.FilemanagerVo;

@Service
public class FilemanagerServiceImpl implements FilemanagerService {

	private final FilemanagerDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public FilemanagerServiceImpl(FilemanagerDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//모든 파일 조회
	@Override
	public List<FilemanagerVo> selectAll() {
		return dao.selectAll(sst);
	}

}
