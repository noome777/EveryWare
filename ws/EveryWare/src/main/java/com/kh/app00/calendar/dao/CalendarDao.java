package com.kh.app00.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.calendar.vo.CalendarVo;

public interface CalendarDao {

	//개인일정 조회
	List<CalendarVo> getPerCalendar(SqlSessionTemplate sst, String empCode);
	//부서일정 조회
	List<CalendarVo> getDepartCalendar(SqlSessionTemplate sst, String deptCode);
	//일정 작성
	int insertOne(SqlSessionTemplate sst, CalendarVo vo);
	//일정 삭제
	int deleteOne(SqlSessionTemplate sst, String no);

}
