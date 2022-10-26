package com.kh.app00.dayoff.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

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

    //사원별 전체 휴가 갯수 조회
    int offTotalCnt(SqlSessionTemplate sst, DayoffVo vo);

    //사원의 사용한 휴가 갯수 조회
    int offUsedCnt(SqlSessionTemplate sst, DayoffVo vo);

    //로그인 유저의 권한 코드 조회
    EmpVo selectRightVo(SqlSessionTemplate sst, DayoffVo vo);

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    int selectAdminTotalCnt(SqlSessionTemplate sst);

    //관리자 결재 리스트 조회
    List<DayoffVo> selectAdminDayoffList(SqlSessionTemplate sst, PageVo pv);

    //사원의 부서 정보 조회
    DayoffVo getDeptVo(SqlSessionTemplate sst, DayoffVo vo);

    //관리자 기간 선택시 게시글 수 조회
    int selectAdDateCnt(SqlSessionTemplate sst, DayoffVo vo);

    //관리자 기산 선택시 게시글 리스트 조회
    List<DayoffVo> selectAdDateList(SqlSessionTemplate sst, DayoffVo vo, PageVo pv2);

    //관리자의 결재 정보 업데이트
    int updateApproval(SqlSessionTemplate sst, DayoffVo vo);

    //휴가 현황 조회
    List<DayoffVo> getCalendar(SqlSessionTemplate sst, DayoffVo vo);

}
