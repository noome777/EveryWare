package com.kh.app00.commute.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;

@Repository
public class CommuteDaoImpl implements CommuteDao {

    //출퇴근 체크
    @Override
    public int insertCommute(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.insert("commuteMapper.insertCommute", vo);
    }

    //시간 외 근무 신청
    @Override
    public int insertOver(SqlSessionTemplate sst, OverworkVo vo) {
        return sst.insert("commuteMapper.insertOverwork", vo);
    }

    //시간 외 근무 리스트
    @Override
    public List<OverworkVo> overworkList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv) {
        
        int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectOverworkList", vo, rb);
    }

    //리스트 전체 신청글 수 조회
    @Override
    public int selectTotalCnt(SqlSessionTemplate sst, OverworkVo vo) {
        return sst.selectOne("commuteMapper.selectTotalCnt", vo);
    }

    //기간 선택 글 수 조회
    @Override
    public int selectDateCnt(SqlSessionTemplate sst, OverworkVo vo) {
        return sst.selectOne("commuteMapper.selectDateCnt", vo);
    }

    //기간 선택 시 리스트 조회
    @Override
    public List<OverworkVo> selectDateList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv2) {
        
        int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectDateList", vo, rb);
    }

    //로그인 유저의 권한코드 조회
    @Override
    public EmpVo selectRightVo(SqlSessionTemplate sst, OverworkVo vo) {
        return sst.selectOne("commuteMapper.selectRightVo", vo);
    }

    //사원의 부서 정보 조회
    @Override
    public DayoffVo getDeptVo(SqlSessionTemplate sst, OverworkVo vo) {
        return sst.selectOne("commuteMapper.selectDeptVo", vo);
    }

    //관리자 기간 선택시 게시글 수 조회
    @Override
    public int selectAdDateCnt(SqlSessionTemplate sst, OverworkVo vo) {
        return sst.selectOne("commuteMapper.selectAdDateCnt", vo);
    }

    //관리자 기간 선택시 게시글 리스트 조회
    @Override
    public List<OverworkVo> selectAdDateList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv2) {
        
        int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectAdDateList", vo, rb);
    }

    //관리자 결재 리스트를 위한 사원 신청 글 수 조회
    @Override
    public int selectAdminTotalCnt(SqlSessionTemplate sst) {
        return sst.selectOne("commuteMapper.selectAdminTotalCnt");
    }

    //관리자 결재 리스트 조회
    @Override
    public List<OverworkVo> selectAdminOverworkList(SqlSessionTemplate sst, PageVo pv) {
        
        int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectAdminOverworkList", null, rb);
    }

    //관리자 결재 정보 업데이트
    @Override
    public int updateApproval(SqlSessionTemplate sst, OverworkVo vo) {
        return sst.update("commuteMapper.updateApproval", vo);
    }

    //정상출근 카운트
    @Override
    public int selectNormalCnt(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectNormalCnt", vo);
    }

    //조기퇴근 카운트
    @Override
    public int selectEarlyCnt(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectEarlyCnt", vo);
    }

    //지각 카운트
    @Override
    public int selectLateCnt(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectLateCnt", vo);
    }

    //결근 카운트
    @Override
    public int selectAbsentCnt(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectAbsentCnt", vo);
    }

    //사원의 근태 목록 수 카운트
    @Override
    public int selectCommuteTotalCnt(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectCommuteTotalCnt", vo);
    }

    //사원의 근태 리스트 조회
    @Override
    public List<CommuteVo> selectCommuteList(SqlSessionTemplate sst, CommuteVo vo, PageVo pv) {
        
        int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectCommuteList", vo, rb);
    }

    //사원의 기간 선택시 근태 목록 수 카운트
    @Override
    public int selectCommuteDateCnt(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectCommuteDateCnt", vo);
    }

    //사원의 기간 선택시 근태 목록 수 카운트
    @Override
    public List<CommuteVo> selectCommuteDateList(SqlSessionTemplate sst, CommuteVo vo, PageVo pv2) {
        
        int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectCommuteDateList", vo, rb);
    }

    //해당 월 근무 일수
    @Override
    public int selectWorkDays(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectWorkDays", vo);
    }

    //해당 월 총 근무시간
    @Override
    public int seletWorkTimeAll(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.seletWorkTimeAll", vo);
    }

    //해당 월 평균 근무시간
    @Override
    public double selectWorkTimeAvg(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectWorkTimeAvg", vo);
    }

    //금일 근무시간
    @Override
    public int selectWorkToday(SqlSessionTemplate sst, CommuteVo vo) {
        return sst.selectOne("commuteMapper.selectWorkToday", vo);
    }

    //사원의 프로필 사진 업데이트 반영
    @Override
    public EmpVo selectEmpProfile(SqlSessionTemplate sst, EmpVo empVo) {
        return sst.selectOne("commuteMapper.selectEmpProfileName", empVo);
    }

    //메인페이지 근태 위젯 출퇴근 조회
    @Override
    public CommuteVo selectCommute(SqlSessionTemplate sst, EmpVo empVo) {
        return sst.selectOne("commuteMapper.selectCommute", empVo);
    }

    //관리자 출퇴근 기록 조회 (job, 사원이름 검색 실행)
    @Override
    public List<CommuteVo> selectCommuteAdminList(SqlSessionTemplate sst, EmpVo empVo, PageVo pv2) {
        
        int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectCommuteAdminList", empVo, rb);
    }

    //위의 리스트 카운트
    @Override
    public int selectCommuteSearchCnt(SqlSessionTemplate sst, EmpVo empVo) {
        return sst.selectOne("commuteMapper.selectCommuteSearchCnt", empVo);
    }

    //관리자 출퇴근 전체 리스트 조회
    @Override
    public List<CommuteVo> selectAdminList(SqlSessionTemplate sst, PageVo pv) {

        int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
        
        return sst.selectList("commuteMapper.selectAdminList", null, rb);
    }

    //위의 리스트 카운트
    @Override
    public int selectAdminCommuteCnt(SqlSessionTemplate sst) {
        return sst.selectOne("commuteMapper.selectAdminCommuteCnt", sst);
    }

    //월별 근태 현황 조회
    @Override
    public Map<String, Integer> selectByMonth(SqlSessionTemplate sst, Map<String, String> vo) {
        return sst.selectOne("commuteMapper.selectByMonth", vo);
    }

    



}
