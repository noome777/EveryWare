package com.kh.app00.commute.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;

public interface CommuteDao   {

    //출퇴근 체크
    int insertCommute(SqlSessionTemplate sst, CommuteVo vo);

    //시간 외 근무 신청
    int insertOver(SqlSessionTemplate sst, OverworkVo vo);

    //시간 외 근무 리스트
    List<OverworkVo> overworkList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv);

    //리스트 전체 신청글 수 조회
    int selectTotalCnt(SqlSessionTemplate sst, OverworkVo vo);

    //기간 선택 글 수 조회
    int selectDateCnt(SqlSessionTemplate sst, OverworkVo vo);

    //기간 선택 시 리스트 조회
    List<OverworkVo> selectDateList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv2);

    //로그인 유저의 권한코드 조회
    EmpVo selectRightVo(SqlSessionTemplate sst, OverworkVo vo);

    //사원의 부서 정보 조회
    DayoffVo getDeptVo(SqlSessionTemplate sst, OverworkVo vo);

    //관리자 기간 선택시 게시글 수 조회
    int selectAdDateCnt(SqlSessionTemplate sst, OverworkVo vo);

    //관리자 기간 선택시 게시글 리스트 조회
    List<OverworkVo> selectAdDateList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv2);

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    int selectAdminTotalCnt(SqlSessionTemplate sst);

    //관리자 결재 리스트 조회
    List<OverworkVo> selectAdminOverworkList(SqlSessionTemplate sst, PageVo pv);

    //관리자 결재 정보 업데이트
    int updateApproval(SqlSessionTemplate sst, OverworkVo vo);

    //정상출근 카운트
    int selectNormalCnt(SqlSessionTemplate sst, CommuteVo vo);

    //조기퇴근 카운트
    int selectEarlyCnt(SqlSessionTemplate sst, CommuteVo vo);

    //지각 카운트
    int selectLateCnt(SqlSessionTemplate sst, CommuteVo vo);

    //결근 카운트
    int selectAbsentCnt(SqlSessionTemplate sst, CommuteVo vo);

    //사원의 근태 목록 수 카운트
    int selectCommuteTotalCnt(SqlSessionTemplate sst, CommuteVo vo);

    //사원의 근태 리스트 조회
    List<CommuteVo> selectCommuteList(SqlSessionTemplate sst, CommuteVo vo, PageVo pv);

    //사원의 기간 선택시 근태 목록 수 카운트
    int selectCommuteDateCnt(SqlSessionTemplate sst, CommuteVo vo);

    //사원의 기간 선택시 근태 목록 수 카운트
    List<CommuteVo> selectCommuteDateList(SqlSessionTemplate sst, CommuteVo vo, PageVo pv2);

    //해당 월 근무 일수
    int selectWorkDays(SqlSessionTemplate sst, CommuteVo vo);

    //해당 월 총 근무시간
    int seletWorkTimeAll(SqlSessionTemplate sst, CommuteVo vo);

    //해당 월 평균 근무시간
    double selectWorkTimeAvg(SqlSessionTemplate sst, CommuteVo vo);

    //금일 근무시간
    int selectWorkToday(SqlSessionTemplate sst, CommuteVo vo);



}
