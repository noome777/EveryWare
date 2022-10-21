package com.kh.app00.commute.service;

import java.util.List;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;

public interface CommuteService {

    //출퇴근 체크
    int insertCommute(CommuteVo vo);

    //시간 외 근무 신청 
    int insertOver(OverworkVo vo);

    //시간 외 근무 리스트
    List<OverworkVo> overworkList(OverworkVo vo, PageVo pv);

    //리스트 전체 신청글 수 조회
    int selectTotalCnt(OverworkVo vo);

    //기간 선택 글 수 조회
    int selectDateCnt(OverworkVo vo);

    //기간 선택시 리스트 조회
    List<OverworkVo> selectDateList(OverworkVo vo, PageVo pv2);


}
