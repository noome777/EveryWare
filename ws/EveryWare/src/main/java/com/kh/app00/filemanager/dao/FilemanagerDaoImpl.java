package com.kh.app00.filemanager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.filemanager.vo.FilemanagerVo;

@Repository
public class FilemanagerDaoImpl implements FilemanagerDao {
	
	//모든 파일 조회
	@Override
	public List<FilemanagerVo> selectAll(SqlSessionTemplate sst, String empCode) {
		return sst.selectList("filemanagerMapper.selectAll", empCode);
	}

	//최근등록된 파일 조회
	@Override
	public List<FilemanagerVo> selectRecent(SqlSessionTemplate sst, String empCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectRecent", empCode);
	}
	
	//즐겨찾기된 파일 조회
	@Override
	public List<FilemanagerVo> selectStar(SqlSessionTemplate sst, String empCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectStar", empCode);
	}
	
	//삭제된 파일 조회
	@Override
	public List<FilemanagerVo> selectDel(SqlSessionTemplate sst, String empCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectDel", empCode);
	}
	
	//공유된 파일 조회
	@Override
	public List<FilemanagerVo> selectCloud(SqlSessionTemplate sst, String deptCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectCloud", deptCode);
	}
	
	//즐겨찾기 추가
	@Override
	public int addStar(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.addStar", fileCode);
	}
	
	//복원하기 추가
	@Override
	public int restore(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.restore", fileCode);
	}
	
	//삭제하기 추가
	@Override
	public int addDel(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.addDel", fileCode);
	}

	//작성하기 추가
	@Override
	public int addFile(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("filemanagerMapper.addFile", vo);
	}
	
	//선택조회
	@Override
	public FilemanagerVo selectOne(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.selectOne("filemanagerMapper.selectOneByCode", fileCode);
	}

	//복사하기 추가
	@Override
	public int addCopy(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("filemanagerMapper.addCopy", vo);
	}

	//수정하기 추가
	@Override
	public int edit(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.edit", vo);
	}

	//공유하기 추가
	@Override
	public int addCloud(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("filemanagerMapper.addCloud", vo);
	}

	

}
