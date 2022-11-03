package com.kh.app00.calendar.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.calendar.dao.CalendarDao;
import com.kh.app00.calendar.vo.CalendarVo;

@Service
public class CalendarServiceImpl implements CalendarService {

	final private CalendarDao dao;
	private final SqlSessionTemplate sst;

	@Autowired
	public CalendarServiceImpl(CalendarDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	@Override
	public List<CalendarVo> getPerCalendar(String empCode) {
		return dao.getPerCalendar(sst, empCode);
	}

	@Override
	public List<CalendarVo> getDepartCalendar(String empCode) {
		return dao.getDepartCalendar(sst, empCode);
	}

	@Override
	public int insertOne(CalendarVo vo) {

		int result = 0;

		if (vo.getCalTitle().length() == 0) {
			result = -2; // 알람 보내기
		}

		// 일정에 끝나는 시간을 안적으면 종일로 바꾸기
		if ((vo.getEndTime().length() == 0) || (vo.getStartTime().length() == 0)) {
			vo.setCalAllday("TRUE");
			vo.setStartTime(null);
			vo.setEndTime(null);

		}

		if (vo.getStartTime() != null) {
			vo.setCalStart(vo.getCalStart() + " " + vo.getStartTime().substring(0, 5));
		} else {
			vo.setCalAllday("TRUE");
		}

		if (vo.getEndTime() != null) {
			vo.setCalEnd(vo.getCalEnd() + " " + vo.getEndTime().substring(0, 5));
			vo.setCalAllday("FALSE");
		} else {
			vo.setCalAllday("TRUE");
		}

		if (vo.getCalAllday() == null) {
			vo.setCalAllday("FALSE");
		} else if (vo.getCalAllday().equals("on")) {
			vo.setCalAllday("TRUE");
		}

		System.out.println(vo);

		result = dao.insertOne(sst, vo);
		return result;
	}

	@Override
	public int deleteOne(String no) {
		// TODO Auto-generated method stub
		return dao.deleteOne(sst, no);
	}

}
