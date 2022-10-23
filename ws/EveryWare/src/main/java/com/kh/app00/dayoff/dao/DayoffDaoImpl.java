package com.kh.app00.dayoff.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;

@Repository
public class DayoffDaoImpl implements DayoffDao {

    //휴가 신청
    @Override
    public int insertOff(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.insert("dayoffMapper.insertOff", vo);
    }

    //휴가 목록 조회
    @Override
    public List<DayoffVo> dayoffList(SqlSessionTemplate sst, DayoffVo vo, PageVo pv1) {
        
        int offset = (pv1.getCurrentPage()-1) * pv1.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv1.getBoardLimit());
        
        return sst.selectList("dayoffMapper.selectDayoffList", vo, rb);
    }

    //전체 신청 글 수 조회
    @Override
    public int selectTotalCnt(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectOne("dayoffMapper.selectTotalCnt", vo);
    }

    //기간 선택 목록 조회
    @Override
    public List<DayoffVo> selectDateList(SqlSessionTemplate sst, DayoffVo vo, PageVo pv2) {
        int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
        return sst.selectList("dayoffMapper.selectDateList", vo, rb);
    }

    //기간 선택한 글 수 조회
    @Override
    public int selectDateCnt(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectOne("dayoffMapper.selectDateCnt", vo);
    }

    //사원별 전체 휴가 갯수 조회
    @Override
    public int offTotalCnt(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectOne("dayoffMapper.offTotalCnt", vo);
    }

    //사원의 사용한 휴가 갯수 조회
    @Override
    public int offUsedCnt(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectOne("dayoffMapper.offUsedCnt", vo);
    }

    //로그인 유저의 권한 코드 조회
    @Override
    public EmpVo selectRightVo(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectOne("dayoffMapper.selectRightVo", vo);
    }

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    @Override
    public int selectAdminTotalCnt(SqlSessionTemplate sst) {
        return sst.selectOne("dayoffMapper.selectAdminTotalCnt");
    }

    //관리자 결재 리스트 조회
    @Override
    public List<DayoffVo> selectAdminDayoffList(SqlSessionTemplate sst, PageVo pv) {
        
        int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
        
        return sst.selectList("dayoffMapper.selectAdminDayoffList", null, rb);
    }
    

}
