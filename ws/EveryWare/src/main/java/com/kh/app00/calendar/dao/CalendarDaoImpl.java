package com.kh.app00.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.calendar.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao{



	@Override
	public List<CalendarVo> getCalendar(SqlSessionTemplate sst) {
		return sst.selectList("calendarMapper.selectAll");
	}

}
