package com.kh.app00.commute.service;

import java.util.List;

import com.kh.app00.common.PageVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;

public interface CommuteService {

    //출퇴근 체크
    int insertCommute(CommuteVo vo);

    //시간 외 근무 신청 
    int insertOver(OverworkVo vo);

    //시간 외 근무 리스트
    List<OverworkVo> overworkList(OverworkVo vo, PageVo pv);

    //리스트 전체 신청글 수 조회
    int selectTotalCnt(OverworkVo vo);

    //사원의 근태 리스트 
//    List<CommuteVo> commuteList();

}
