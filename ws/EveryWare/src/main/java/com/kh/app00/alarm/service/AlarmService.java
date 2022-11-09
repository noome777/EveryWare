package com.kh.app00.alarm.service;

import java.util.List;

import com.kh.app00.alarm.vo.AlarmVo;

public interface AlarmService {

	List<AlarmVo> selectAll(String empCode);

}
