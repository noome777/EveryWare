package com.kh.app00.dayoff.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.dayoff.vo.DayoffVo;

public interface DayoffDao {

    //휴가 신청
    int insertOff(SqlSessionTemplate sst, DayoffVo vo);

    //휴가 목록 조회
    List<DayoffVo> dayoffList(SqlSessionTemplate sst, DayoffVo vo);

}
