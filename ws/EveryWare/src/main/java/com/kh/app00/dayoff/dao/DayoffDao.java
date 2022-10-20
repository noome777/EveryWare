package com.kh.app00.dayoff.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.vo.DayoffVo;

public interface DayoffDao {

    //휴가 신청
    int insertOff(SqlSessionTemplate sst, DayoffVo vo);

    //휴가 목록 조회
    List<DayoffVo> dayoffList(SqlSessionTemplate sst, DayoffVo vo, PageVo pv1);


    //전체 신청 글 수 조회
    int selectTotalCnt(SqlSessionTemplate sst, DayoffVo vo);

    //기간 선택 목록 조회
    List<DayoffVo> selectDateList(SqlSessionTemplate sst, DayoffVo vo, PageVo pv2);

    //기간 선택한 글 수 조회
    int selectDateCnt(SqlSessionTemplate sst, DayoffVo vo);

}
