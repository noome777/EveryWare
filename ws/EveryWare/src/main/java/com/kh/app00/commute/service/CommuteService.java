package com.kh.app00.commute.service;

import com.kh.app00.commute.vo.CommuteVo;

public interface CommuteService {

    //출퇴근 체크
    int insertCommute(CommuteVo vo);

}
