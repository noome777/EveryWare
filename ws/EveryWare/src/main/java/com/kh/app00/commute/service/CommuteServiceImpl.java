package com.kh.app00.commute.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    
   

    
}
