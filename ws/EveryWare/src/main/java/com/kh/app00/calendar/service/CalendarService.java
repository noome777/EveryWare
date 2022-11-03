package com.kh.app00.calendar.service;

import java.util.List;

import com.kh.app00.calendar.vo.CalendarVo;

public interface CalendarService {

	List<CalendarVo> getPerCalendar(String empCode);

	List<CalendarVo> getDepartCalendar(String empCode);
	
	int insertOne(CalendarVo vo);

	int deleteOne(String no);

}
