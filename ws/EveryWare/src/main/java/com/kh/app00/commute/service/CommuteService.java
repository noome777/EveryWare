package com.kh.app00.commute.service;

import java.util.List;
import java.util.Map;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;

public interface CommuteService {

    //출퇴근 체크
    int insertCommute(CommuteVo vo);

    //시간 외 근무 신청 
    int insertOver(OverworkVo vo);

    //시간 외 근무 리스트
    List<OverworkVo> overworkList(OverworkVo vo, PageVo pv);

    //리스트 전체 신청글 수 조회
    int selectTotalCnt(OverworkVo vo);

    //기간 선택 글 수 조회
    int selectDateCnt(OverworkVo vo);

    //기간 선택시 리스트 조회
    List<OverworkVo> selectDateList(OverworkVo vo, PageVo pv2);

    //로그인 유저의 권한코드 조회
    EmpVo selectRightVo(OverworkVo vo);

    //사원의 부서 정보 조회
    DayoffVo getDeptVo(OverworkVo vo);

    //관리자 기간 선택시 게시글 수 조회
    int selectAdDateCnt(OverworkVo vo);

    //관리자 기산 선택시 게시글 리스트 조회
    List<OverworkVo> selectAdDateList(OverworkVo vo, PageVo pv2);

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    int selectAdminTotalCnt();

    //관리자 결재 리스트 조회
    List<OverworkVo> adminOverworkList(PageVo pv);

    //관리자 결재 정보 업데이트
    int updateApproval(OverworkVo vo);

    //정상출근 카운트
    int selectNormalCnt(CommuteVo vo);

    //조기퇴근 카운트
    int selectEarlyCnt(CommuteVo vo);

    //지각 카운트
    int selectLateCnt(CommuteVo vo);

    //결근 카운트
    int selectAbsentCnt(CommuteVo vo);

    //사원의 근태 목록 수 카운트
    int selectCommuteTotalCnt(CommuteVo vo);

    //사원의 근태 리스트 조회
    List<CommuteVo> selectCommuteList(PageVo pv, CommuteVo vo);

    //사원의 기간 선택시 근태 목록 수 카운트
    int selectCommuteDateCnt(CommuteVo vo);

    //사원의 기간 선택시 근태 목록 조회
    List<CommuteVo> selectCommuteDateList(PageVo pv2, CommuteVo vo);

    //해당 월 근무 일수
    int selectWorkDays(CommuteVo vo);

    //해당 월 총 근무시간
    int seletWorkTimeAll(CommuteVo vo);

    //해당 월 평균 근무시간
    double selectWorkTimeAvg(CommuteVo vo);

    //금일 근무시간
    int selectWorkToday(CommuteVo vo);

    //사원의 프로필 사진 업데이트 반영
    EmpVo selectEmpProfile(EmpVo empVo);

    //메인페이지 근태 위젯 출퇴근 조회
    CommuteVo selectCommute(EmpVo empVo);

    //관리자 출퇴근 기록 조회 (job, 사원이름 검색 실행)
    List<CommuteVo> selectCommuteAdminList(EmpVo empVo);

    //관리자 출퇴근 전체 조회
//    List<CommuteVo> selectAdminTotalList();


}
