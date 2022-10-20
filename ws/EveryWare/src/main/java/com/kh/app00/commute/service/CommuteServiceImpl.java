package com.kh.app00.commute.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.dao.CommuteDao;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;

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

    //사원의 근태 리스트 조회
//    @Override
//    public List<CommuteVo> commuteList() {
//        return dao.commuteList(sst);
//    }

    
   

    
}
