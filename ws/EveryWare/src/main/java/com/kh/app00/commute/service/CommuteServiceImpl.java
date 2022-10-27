package com.kh.app00.commute.service;

import java.util.List;

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


    
   

    
}
