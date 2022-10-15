package com.kh.app00.emp.service;

import com.kh.app00.emp.vo.EmpVo;

public interface EmpService {

    //로그인
    EmpVo login(EmpVo vo);

    //아이디 찾기
    EmpVo selectIdInfo(EmpVo vo);

}
