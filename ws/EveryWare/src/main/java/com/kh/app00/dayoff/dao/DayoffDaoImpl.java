package com.kh.app00.dayoff.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.dayoff.vo.DayoffVo;

@Repository
public class DayoffDaoImpl implements DayoffDao {

    //휴가 신청
    @Override
    public int insertOff(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.insert("dayoffMapper.insertOff", vo);
    }

    //휴가 목록 조회
    @Override
    public List<DayoffVo> dayoffList(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectList("dayoffMapper.selectDayoffList", vo);
    }

}
