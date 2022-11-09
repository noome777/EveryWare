package com.kh.app00.alarm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.alarm.vo.AlarmVo;

public interface AlarmDao {

	List<AlarmVo> selectAll(SqlSessionTemplate sst, String empCode);

}
