package com.kh.app00.dayoff.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.dao.DayoffDao;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

@Service
public class DayoffServiceImpl implements DayoffService {
    
    private final DayoffDao dao;
    private final SqlSessionTemplate sst;
    
    @Autowired
    public DayoffServiceImpl(DayoffDao dao, SqlSessionTemplate sst) {
        this.dao = dao;
        this.sst = sst;
    }

    //휴가 신청
    @Override
    public int insertOff(DayoffVo vo) {
        return dao.insertOff(sst, vo);
    }

    //휴가 목록 조회
    @Override
    public List<DayoffVo> dayoffList(DayoffVo vo, PageVo pv1) {
        return dao.dayoffList(sst, vo, pv1);
    }

    //전체 신청 글 수 조회
    @Override
    public int selectTotalCnt(DayoffVo vo) {
        return dao.selectTotalCnt(sst, vo);
    }

    //기간 선택 목록 조회
    @Override
    public List<DayoffVo> selectDateList(DayoffVo vo, PageVo pv2) {
        return dao.selectDateList(sst, vo, pv2);
    }

    //기간 선택한 글 수 조회
    @Override
    public int selectDateCnt(DayoffVo vo) {
        return dao.selectDateCnt(sst, vo);
    }

    //사원별 전체 휴가 갯수 조회
    @Override
    public int offTotalCnt(DayoffVo vo) {
        return dao.offTotalCnt(sst, vo);
    }

    //사원의 사용한 휴가 갯수 조회
    @Override
    public int offUsedCnt(DayoffVo vo) {
        return dao.offUsedCnt(sst, vo);
    }

    //로그인 유저의 권한 코드 조회
    @Override
    public EmpVo selectRightVo(DayoffVo vo) {
        return dao.selectRightVo(sst, vo);
    }

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    @Override
    public int selectAdminTotalCnt() {
        return dao.selectAdminTotalCnt(sst);
    }

    //관리자 결재 리스트 조회
    @Override
    public List<DayoffVo> adminDayoffList(PageVo pv) {
        return dao.selectAdminDayoffList(sst, pv);
    }

    //사원의 부서 정보 조회
    @Override
    public DayoffVo getDeptVo(DayoffVo vo) {
        return dao.getDeptVo(sst, vo);
    }

    //관리자 기간 선택시 게시글 수 조회
    @Override
    public int selectAdDateCnt(DayoffVo vo) {
        return dao.selectAdDateCnt(sst, vo);
    }

    //관리자 기산 선택시 게시글 리스트 조회
    @Override
    public List<DayoffVo> selectAdDateList(DayoffVo vo, PageVo pv2) {
        return dao.selectAdDateList(sst, vo, pv2);
    }

}
