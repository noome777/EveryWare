package com.kh.app00.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.calendar.vo.CalendarVo;
import com.kh.app00.emp.vo.EmpVo;

@Repository
public class CalendarDaoImpl implements CalendarDao{


	//개인일정 조회
	@Override
	public List<CalendarVo> getPerCalendar(SqlSessionTemplate sst, String empCode) {
		return sst.selectList("calendarMapper.selectPerAll", empCode);
	}
	
	//부서일정 조회
	@Override
	public List<CalendarVo> getDepartCalendar(SqlSessionTemplate sst, String deptCode) {
		return sst.selectList("calendarMapper.selectDepartAll", deptCode);
	}

	//모든일정 조회
	@Override
	public List<CalendarVo> selectAll(SqlSessionTemplate sst, EmpVo loginMember) {
		// TODO Auto-generated method stub
		return sst.selectList("calendarMapper.selectAll", loginMember);
	}

	
	//일정 작성
	@Override
	public int insertOne(SqlSessionTemplate sst, CalendarVo vo) {
		return sst.insert("calendarMapper.insertOne", vo);
	}
	
	//일정 삭제
	@Override
	public int deleteOne(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.update("calendarMapper.deleteOne", no);
	}

	
}
