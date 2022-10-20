package com.kh.app00.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.calendar.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao{


	//개인일정 조회
	@Override
	public List<CalendarVo> getPerCalendar(SqlSessionTemplate sst) {
		return sst.selectList("calendarMapper.selectPerAll");
	}
	
	//부서일정 조회
		@Override
		public List<CalendarVo> getDepartCalendar(SqlSessionTemplate sst) {
			return sst.selectList("calendarMapper.selectDepartAll");
		}
	
	@Override
	public int insertOne(SqlSessionTemplate sst, CalendarVo vo) {
		return sst.insert("calendarMapper.insertOne", vo);
	}

}
