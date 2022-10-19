package com.kh.app00.calendar.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.calendar.dao.CalendarDao;
import com.kh.app00.calendar.vo.CalendarVo;

@Service
public class CalendarServiceImpl implements CalendarService{

	final private CalendarDao dao;
	private final SqlSessionTemplate sst;
	@Autowired
	public CalendarServiceImpl(CalendarDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}


	@Override
	public List<CalendarVo> getCalendar() {
		return dao.getCalendar(sst);
	}

	@Override
	public int insertOne(CalendarVo vo) {
		
		// 일정에 끝나는 시간을 안적으면 종일로 바꾸기
		if(vo.getEndTime().length() == 0) {
			vo.setCalAllday("true");
		}
		
		if(vo.getCalAllday() == null) {
			vo.setCalAllday("false");
		}else if(vo.getCalAllday().equals("on")) {
			vo.setCalAllday("true");
		}

		if(vo.getStartTime() != null) {
			vo.setCalStart(vo.getCalStart() + vo.getStartTime().substring(0, 4));
		}
		
		vo.getEndTime();
		
		//
		vo.setCalStart(vo.getCalStart() + " "+ vo.getStartTime());
		
		
		System.out.println(vo);
		return 0;
	}

}
