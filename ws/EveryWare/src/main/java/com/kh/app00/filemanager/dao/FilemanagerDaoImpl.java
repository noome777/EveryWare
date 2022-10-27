package com.kh.app00.filemanager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.filemanager.vo.FilemanagerVo;

@Repository
public class FilemanagerDaoImpl implements FilemanagerDao {

	@Override
	public List<FilemanagerVo> selectAll(SqlSessionTemplate sst) {
		return sst.selectList("filemanagerMapper.selectAll");
	}

	@Override
	public List<FilemanagerVo> selectRecent(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectRecent");
	}

	@Override
	public List<FilemanagerVo> selectStar(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectStar");
	}

	@Override
	public List<FilemanagerVo> selectDel(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("filemanagerMapper.selectDel");
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

}
