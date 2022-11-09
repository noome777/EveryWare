package com.kh.app00.alarm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.alarm.vo.AlarmVo;

@Repository
public class AlarmDaoImpl implements AlarmDao{

	@Override
	public List<AlarmVo> selectAll(SqlSessionTemplate sst, String empCode) {
		// TODO Auto-generated method stub
		return sst.selectList("alarmMapper.selectAll", empCode);
	}

}
