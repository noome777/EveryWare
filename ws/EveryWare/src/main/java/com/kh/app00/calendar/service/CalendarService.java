package com.kh.app00.calendar.service;

import java.util.List;

import com.kh.app00.calendar.vo.CalendarVo;

public interface CalendarService {

	List<CalendarVo> getCalendar();

	int insertOne(CalendarVo vo);

}
