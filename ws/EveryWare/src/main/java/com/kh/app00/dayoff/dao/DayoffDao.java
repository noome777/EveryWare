package com.kh.app00.dayoff.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.dayoff.vo.DayoffVo;

public interface DayoffDao {

    //휴가 신청
    int insertOff(SqlSessionTemplate sst, DayoffVo vo);

}
