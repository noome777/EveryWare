package com.kh.app00.commute.service;

import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;

public interface CommuteService {

    //출퇴근 체크
    int insertCommute(CommuteVo vo);

    //시간 외 근무 신청 
    int insertOver(OverworkVo vo);

}
