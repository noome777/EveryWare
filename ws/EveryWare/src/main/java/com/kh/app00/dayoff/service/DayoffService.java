package com.kh.app00.dayoff.service;

import java.util.List;

import com.kh.app00.dayoff.vo.DayoffVo;

public interface DayoffService {

    //휴가 신청
    int insertOff(DayoffVo vo);

    //휴가 목록 조회
    List<DayoffVo> dayoffList(DayoffVo vo);

}
