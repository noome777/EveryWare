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
	public List<FilemanagerVo> selectAll(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectAll(sst, empCode);
	}

	@Override
	public List<FilemanagerVo> selectRecent(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectRecent(sst, empCode);
	}

	@Override
	public List<FilemanagerVo> selectStar(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectStar(sst, empCode);
	}

	@Override
	public List<FilemanagerVo> selectDel(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectDel(sst, empCode);
	}

	@Override
	public int addStar(String fileCode) {
		// TODO Auto-generated method stub
		return dao.addStar(sst, fileCode);
	}

	@Override
	public int restore(String fileCode) {
		// TODO Auto-generated method stub
		return dao.restore(sst, fileCode);
	}

	@Override
	public int addDel(String fileCode) {
		// TODO Auto-generated method stub
		return dao.addDel(sst, fileCode);
	}

	@Override
	public int addFile(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.addFile(sst, vo);
	}

	@Override
	public FilemanagerVo selectOne(String fileCode) {
		// TODO Auto-generated method stub
		return dao.selectOne(sst, fileCode);
	}

	@Override
	public int addCopy(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.addCopy(sst, vo);
	}

	@Override
	public int edit(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.edit(sst, vo);
	}

	@Override
	public int addCloud(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.addCloud(sst, vo);
	}

	
	


}
