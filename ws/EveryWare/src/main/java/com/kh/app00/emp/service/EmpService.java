package com.kh.app00.emp.service;

import com.kh.app00.emp.vo.EmpVo;

public interface EmpService {

    //로그인
    EmpVo login(EmpVo vo);

    //아이디 찾기
    EmpVo selectIdInfo(EmpVo vo);

    //비밀번호 찾기(이름 && 이메일이 사원과 일치 여부 조회)
    EmpVo selectPwdInfo(EmpVo vo);

   

   

}
