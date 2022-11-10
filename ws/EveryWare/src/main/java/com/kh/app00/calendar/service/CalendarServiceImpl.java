package com.kh.app00.calendar.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.calendar.dao.CalendarDao;
import com.kh.app00.calendar.vo.CalendarVo;
import com.kh.app00.emp.vo.EmpVo;

@Service
public class CalendarServiceImpl implements CalendarService {

	final private CalendarDao dao;
	private final SqlSessionTemplate sst;

	@Autowired
	public CalendarServiceImpl(CalendarDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//개인일정 조회
	@Override
	public List<CalendarVo> getPerCalendar(String empCode) {
		return dao.getPerCalendar(sst, empCode);
	}
	
	//부서일정 조회
	@Override
	public List<CalendarVo> getDepartCalendar(String deptCode) {
		return dao.getDepartCalendar(sst, deptCode);
	}
	
	//일정 작성
	@Override
	public int insertOne(CalendarVo vo) {

		int result = 0;

		if (vo.getCalTitle().length() == 0) {
			result = -2; // 알람 보내기
		}

		if (vo.getCalAllday() == null) {
			vo.setCalAllday("FALSE");
		} else if (vo.getCalAllday().equals("on")) {
			vo.setCalAllday("TRUE ");
		}

		System.out.println(vo);

		result = dao.insertOne(sst, vo);
		return result;
	}
	
	//일정 삭제
	@Override
	public int deleteOne(String no) {
		// TODO Auto-generated method stub
		return dao.deleteOne(sst, no);
	}

	@Override
	public List<CalendarVo> getAllCalendar(EmpVo loginMember) {
		// TODO Auto-generated method stub
		return dao.selectAll(sst, loginMember);
	}

}
