package com.kh.app00.dayoff.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

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

    //사원의 부서 정보 조회
    @Override
    public DayoffVo getDeptVo(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectOne("dayoffMapper.selectDeptVo", vo);
    }

    //관리자 기간 선택시 게시글 수 조회
    @Override
    public int selectAdDateCnt(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectOne("dayoffMapper.selectAdDateCnt", vo);
    }

    //관리자 기산 선택시 게시글 리스트 조회
    @Override
    public List<DayoffVo> selectAdDateList(SqlSessionTemplate sst, DayoffVo vo, PageVo pv2) {
        
        int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
        return sst.selectList("dayoffMapper.selectAdDateList", vo, rb);
    }

    //관리자의 결재 정보 업데이트
    @Override
    public int updateApproval(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.update("dayoffMapper.updateApproval", vo);
    }

    //휴가 현황 조회
    @Override
    public List<DayoffVo> getCalendar(SqlSessionTemplate sst, DayoffVo vo) {
        return sst.selectList("dayoffMapper.selectDayoffCal", vo);
    }

    //관리자의 휴가 현황 조회(모든 부서의 모든 사원)
    @Override
    public List<DayoffVo> getAdminCalendar(SqlSessionTemplate sst) {
        return sst.selectList("dayoffMapper.selectAdminDayoffCal");
    }

    

}
