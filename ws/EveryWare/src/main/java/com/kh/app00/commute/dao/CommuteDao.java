package com.kh.app00.commute.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.commute.vo.CommuteVo;

public interface CommuteDao  {

    //출퇴근 체크
    int insertCommute(SqlSessionTemplate sst, CommuteVo vo);

}
