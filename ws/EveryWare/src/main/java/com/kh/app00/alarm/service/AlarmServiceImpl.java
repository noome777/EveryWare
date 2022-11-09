package com.kh.app00.alarm.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.alarm.dao.AlarmDao;
import com.kh.app00.alarm.vo.AlarmVo;

@Service
public class AlarmServiceImpl implements AlarmService{
	private final AlarmDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public AlarmServiceImpl(AlarmDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	@Override
	public List<AlarmVo> selectAll(String empCode) {
		// TODO Auto-generated method stub
		return dao.selectAll(sst, empCode);
	}
	
	
}
