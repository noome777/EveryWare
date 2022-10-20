package com.kh.app00.dayoff.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.dao.DayoffDao;
import com.kh.app00.dayoff.vo.DayoffVo;

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

}
