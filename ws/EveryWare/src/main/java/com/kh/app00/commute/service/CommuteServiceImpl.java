package com.kh.app00.commute.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.dao.CommuteDao;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;

@Service
public class CommuteServiceImpl implements CommuteService {

    private final CommuteDao dao;
    private final SqlSessionTemplate sst;
    
    @Autowired
    public CommuteServiceImpl(CommuteDao dao, SqlSessionTemplate sst) {
        this.dao = dao;
        this.sst = sst;
    }

    //출퇴근 체크
    @Override
    public int insertCommute(CommuteVo vo) {
        return dao.insertCommute(sst, vo);
    }

    //시간 외 근무 신청
    @Override
    public int insertOver(OverworkVo vo) {
        return dao.insertOver(sst, vo);
    }

    //시간 외 근무 리스트
    @Override
    public List<OverworkVo> overworkList(OverworkVo vo, PageVo pv) {
        return dao.overworkList(sst, vo, pv);
    }

    //리스트 전체 신청글 수 조회
    @Override
    public int selectTotalCnt(OverworkVo vo) {
        return dao.selectTotalCnt(sst,vo);
    }

    //기간 선택 글 수 조회
    @Override
    public int selectDateCnt(OverworkVo vo) {
        return dao.selectDateCnt(sst, vo);
    }

    //기간 선택 시 리스트 조회
    @Override
    public List<OverworkVo> selectDateList(OverworkVo vo, PageVo pv2) {
        return dao.selectDateList(sst, vo, pv2);
    }

    //로그인 유저의 권한코드 조회
    @Override
    public EmpVo selectRightVo(OverworkVo vo) {
        return dao.selectRightVo(sst, vo);
    }

    //사원의 부서 정보 조회
    @Override
    public DayoffVo getDeptVo(OverworkVo vo) {
        return dao.getDeptVo(sst, vo);
    }

    //관리자 기간 선택시 게시글 수 조회
    @Override
    public int selectAdDateCnt(OverworkVo vo) {
        return dao.selectAdDateCnt(sst, vo);
    }

    //관리자 기간 선택시 게시글 리스트 조회
    @Override
    public List<OverworkVo> selectAdDateList(OverworkVo vo, PageVo pv2) {
        return dao.selectAdDateList(sst, vo, pv2);
    }

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    @Override
    public int selectAdminTotalCnt() {
        return dao.selectAdminTotalCnt(sst);
    }

    //관리자 결재 리스트 조회
    @Override
    public List<OverworkVo> adminOverworkList(PageVo pv) {
        return dao.selectAdminOverworkList(sst, pv);
    }

    //관리자 결재 정보 업데이트
    @Override
    public int updateApproval(OverworkVo vo) {
        return dao.updateApproval(sst, vo);
    }

    //정상출근 카운트
    @Override
    public int selectNormalCnt(CommuteVo vo) {
        return dao.selectNormalCnt(sst, vo);
    }

    //조기퇴근 카운트
    @Override
    public int selectEarlyCnt(CommuteVo vo) {
        return dao.selectEarlyCnt(sst, vo);
    }

    //지각 카운트
    @Override
    public int selectLateCnt(CommuteVo vo) {
        return dao.selectLateCnt(sst, vo);
    }

    //결근카운트
    @Override
    public int selectAbsentCnt(CommuteVo vo) {
        return dao.selectAbsentCnt(sst, vo);
    }

    //사원의 근태 목록 수 카운트
    @Override
    public int selectCommuteTotalCnt(CommuteVo vo) {
        return dao.selectCommuteTotalCnt(sst, vo);
    }

    //사원의 근태 리스트 조회
    @Override
    public List<CommuteVo> selectCommuteList(PageVo pv, CommuteVo vo) {
        return dao.selectCommuteList(sst, vo, pv);
    }

    //사원의 기간 선택시 근태 목록 수 카운트
    @Override
    public int selectCommuteDateCnt(CommuteVo vo) {
        return dao.selectCommuteDateCnt(sst, vo);
    }

    //사원의 기간 선택시 근태 목록 수 카운트
    @Override
    public List<CommuteVo> selectCommuteDateList(PageVo pv2, CommuteVo vo) {
        return dao.selectCommuteDateList(sst, vo, pv2);
    }

    //해당 월 근무 일수
    @Override
    public int selectWorkDays(CommuteVo vo) {
        return dao.selectWorkDays(sst, vo);
    }

    //해당 월 총 근무시간
    @Override
    public int seletWorkTimeAll(CommuteVo vo) {
        return dao.seletWorkTimeAll(sst, vo);
    }

    //해당 월 평균 근무시간
    @Override
    public double selectWorkTimeAvg(CommuteVo vo) {
        return dao.selectWorkTimeAvg(sst, vo);
    }

    //금일 근무시간
    @Override
    public int selectWorkToday(CommuteVo vo) {
        return dao.selectWorkToday(sst, vo);
    }

    //사원의 프로필 사진 업데이트 반영
    @Override
    public EmpVo selectEmpProfile(EmpVo empVo) {
        return dao.selectEmpProfile(sst, empVo);
    }

    //메인페이지 근태 위젯 출퇴근 조회
    @Override
    public CommuteVo selectCommute(EmpVo empVo) {
        return dao.selectCommute(sst, empVo);
    }

    //관리자 출퇴근 기록 조회 (job, 사원이름 검색 실행)
    @Override
    public List<CommuteVo> selectCommuteAdminList(EmpVo empVo, PageVo pv2) {
        return dao.selectCommuteAdminList(sst, empVo, pv2);
    }

    //위의 리스트 카운트
    @Override
    public int selectCommuteSearchCnt(EmpVo empVo) {
        return dao.selectCommuteSearchCnt(sst, empVo);
    }

    //관리자 출퇴근 전체 리스트 조회
    @Override
    public List<CommuteVo> selectAdminList(PageVo pv) {
        return dao.selectAdminList(sst, pv);
    }
   
    //위의 리스트 카운트
    @Override
    public int selectAdminCommuteCnt() {
        return dao.selectAdminCommuteCnt(sst);
    }

    //월별 근태 현황 조회
    @Override
    public Map<String, Integer> selectByMonth(Map<String, String> vo) {
        return dao.selectByMonth(sst, vo);
    }

   




   


    
   

    
}
