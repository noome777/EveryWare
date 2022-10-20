package com.kh.app00.commute.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;

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

    //사원의 근태 리스트 조회
//    @Override
//    public List<CommuteVo> commuteList(SqlSessionTemplate sst) {
//        return sst.selectList("commuteMapper.selectCommuteList");
//    }

}
