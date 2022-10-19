package com.kh.app00.commute.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
