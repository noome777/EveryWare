package com.kh.app00.dayoff.service;

import java.util.List;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

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

    //로그인 유저의 권한코드 조회
    EmpVo selectRightVo(DayoffVo vo);

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    int selectAdminTotalCnt();

    //관리자 결재 리스트 조회
    List<DayoffVo> adminDayoffList(PageVo pv);

    //사원의 부서 정보 조회
    DayoffVo getDeptVo(DayoffVo vo);

    //관리자 기간 선택시 게시글 수 조회
    int selectAdDateCnt(DayoffVo vo);

    //관리자 기산 선택시 게시글 리스트 조회
    List<DayoffVo> selectAdDateList(DayoffVo vo, PageVo pv2);

}
