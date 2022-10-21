package com.kh.app00.dayoff.service;

import java.util.List;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.vo.DayoffVo;

public interface DayoffService {

    //휴가 신청
    int insertOff(DayoffVo vo);

    //휴가 목록 조회
    List<DayoffVo> dayoffList(DayoffVo vo, PageVo pv1);

    //전체 신청 글 수 조회
    int selectTotalCnt(DayoffVo vo);

    //기간 선택 목록 조회
    List<DayoffVo> selectDateList(DayoffVo vo, PageVo pv2);

    //기간 선택한 글 수 조회
    int selectDateCnt(DayoffVo vo);

    //사원별 전체 휴가 갯수 조회
    int offTotalCnt(DayoffVo vo);

    //사원의 사용한 휴가 갯수 조회
    int offUsedCnt(DayoffVo vo);

}
