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

}
