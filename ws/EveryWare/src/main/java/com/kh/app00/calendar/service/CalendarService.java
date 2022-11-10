package com.kh.app00.calendar.service;

import java.util.List;

import com.kh.app00.calendar.vo.CalendarVo;
import com.kh.app00.emp.vo.EmpVo;

public interface CalendarService {
	
	//개인일정 조회
	List<CalendarVo> getPerCalendar(String empCode);
	//부서일정 조회
	List<CalendarVo> getDepartCalendar(String deptCode);
	//모든일정 조회
	List<CalendarVo> getAllCalendar(EmpVo loginMember);
	
	//일정 작성
	int insertOne(CalendarVo vo);
	//일정 삭제
	int deleteOne(String no);

}
