package com.kh.app00.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.calendar.vo.CalendarVo;

public interface CalendarDao {

	
	List<CalendarVo> getCalendar(SqlSessionTemplate sst);

}
