package com.kh.app00.commute.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;

public interface CommuteDao  {

    //출퇴근 체크
    int insertCommute(SqlSessionTemplate sst, CommuteVo vo);

    //시간 외 근무 신청
    int insertOver(SqlSessionTemplate sst, OverworkVo vo);

    //시간 외 근무 리스트
    List<OverworkVo> overworkList(SqlSessionTemplate sst, OverworkVo vo);

    //사원의 근태 리스트 조회
//    List<CommuteVo> commuteList(SqlSessionTemplate sst);

}
