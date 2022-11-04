package com.kh.app00.filemanager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.filemanager.vo.FilemanagerVo;

@Repository
public class FilemanagerDaoImpl implements FilemanagerDao {

	@Override
	public List<FilemanagerVo> selectAll(SqlSessionTemplate sst, String empCode) {
		return sst.selectList("filemanagerMapper.selectAll", empCode);
	}

	@Override
	public List<FilemanagerVo> selectRecent(SqlSessionTemplate sst, String empCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectRecent", empCode);
	}

	@Override
	public List<FilemanagerVo> selectStar(SqlSessionTemplate sst, String empCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectStar", empCode);
	}

	@Override
	public List<FilemanagerVo> selectDel(SqlSessionTemplate sst, String empCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectDel", empCode);
	}

	@Override
	public int addStar(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.addStar", fileCode);
	}

	@Override
	public int restore(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.restore", fileCode);
	}

	@Override
	public int addDel(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.addDel", fileCode);
	}

	@Override
	public int addFile(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("filemanagerMapper.addFile", vo);
	}

	@Override
	public FilemanagerVo selectOne(SqlSessionTemplate sst, String fileCode) {
		// TODO Auto-generated method stub
		return sst.selectOne("filemanagerMapper.selectOneByCode", fileCode);
	}

	@Override
	public int addCopy(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("filemanagerMapper.addCopy", vo);
	}

	@Override
	public int edit(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.update("filemanagerMapper.edit", vo);
	}

	@Override
	public int addCloud(SqlSessionTemplate sst, FilemanagerVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("filemanagerMapper.addCloud", vo);
	}

	@Override
	public List<FilemanagerVo> selectCloud(SqlSessionTemplate sst, String deptCode) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectCloud", deptCode);
	}

}
