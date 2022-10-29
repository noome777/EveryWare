package com.kh.app00.emp.service;

import com.kh.app00.emp.vo.EmpVo;

public interface EmpService {

    //로그인
    EmpVo login(EmpVo vo);

    //아이디 찾기
    EmpVo selectIdInfo(EmpVo vo);

    //비밀번호 찾기(이름 && 이메일이 사원과 일치 여부 조회)
    EmpVo selectPwdInfo(EmpVo vo);

    //비밀번호 랜덤값으로 업데이트
    int updateTempPwd(EmpVo vo);

    //임시비밀번호와 db의 비밀번호의 일치 여부 체크(조회)
    EmpVo selectSearchTempPwd(EmpVo vo);

    //임시비밀번호를 새로운 비밀번호로 변경
    int updateNewPwd(EmpVo vo);

   

   

}
