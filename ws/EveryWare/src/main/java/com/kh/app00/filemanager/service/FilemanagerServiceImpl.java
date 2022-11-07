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
	
	//최근등록된 파일 조회
	@Override
	public List<FilemanagerVo> selectRecent(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectRecent(sst, empCode);
	}
	
	//즐겨찾기된 파일 조회
	@Override
	public List<FilemanagerVo> selectStar(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectStar(sst, empCode);
	}
	
	//삭제된 파일 조회
	@Override
	public List<FilemanagerVo> selectDel(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectDel(sst, empCode);
	}
	
	//공유된 파일 조회
	@Override
	public List<FilemanagerVo> selectCloud(String deptCode) {
		// TODO Auto-generated method stub
		return dao.selectCloud(sst, deptCode);
	}
	
	//즐겨찾기 추가
	@Override
	public int addStar(String fileCode) {
		// TODO Auto-generated method stub
		return dao.addStar(sst, fileCode);
	}

	//복원하기 추가
	@Override
	public int restore(String fileCode) {
		// TODO Auto-generated method stub
		return dao.restore(sst, fileCode);
	}

	//삭제하기 추가
	@Override
	public int addDel(String fileCode) {
		// TODO Auto-generated method stub
		return dao.addDel(sst, fileCode);
	}

	//작성하기 추가
	@Override
	public int addFile(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.addFile(sst, vo);
	}
	
	//선택조회
	@Override
	public FilemanagerVo selectOne(String fileCode) {
		// TODO Auto-generated method stub
		return dao.selectOne(sst, fileCode);
	}

	//복사하기 추가
	@Override
	public int addCopy(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.addCopy(sst, vo);
	}
	
	//수정하기 추가
	@Override
	public int edit(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.edit(sst, vo);
	}

	//공유하기 추가
	@Override
	public int addCloud(FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return dao.addCloud(sst, vo);
	}

	
	


}
