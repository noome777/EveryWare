package com.kh.app00.commute.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;

public interface CommuteDao   {

    //출퇴근 체크
    int insertCommute(SqlSessionTemplate sst, CommuteVo vo);

    //시간 외 근무 신청
    int insertOver(SqlSessionTemplate sst, OverworkVo vo);

    //시간 외 근무 리스트
    List<OverworkVo> overworkList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv);

    //리스트 전체 신청글 수 조회
    int selectTotalCnt(SqlSessionTemplate sst, OverworkVo vo);

    //기간 선택 글 수 조회
    int selectDateCnt(SqlSessionTemplate sst, OverworkVo vo);

    //기간 선택 시 리스트 조회
    List<OverworkVo> selectDateList(SqlSessionTemplate sst, OverworkVo vo, PageVo pv2);



}
