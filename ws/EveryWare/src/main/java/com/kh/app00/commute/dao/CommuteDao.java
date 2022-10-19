package com.kh.app00.commute.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;

public interface CommuteDao  {

    //출퇴근 체크
    int insertCommute(SqlSessionTemplate sst, CommuteVo vo);

    //시간 외 근무 신청
    int insertOver(SqlSessionTemplate sst, OverworkVo vo);

}
