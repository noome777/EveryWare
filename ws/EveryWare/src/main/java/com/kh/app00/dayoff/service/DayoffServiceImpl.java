package com.kh.app00.dayoff.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
