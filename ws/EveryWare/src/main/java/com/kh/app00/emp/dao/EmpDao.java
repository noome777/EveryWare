package com.kh.app00.emp.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.emp.vo.EmpVo;

public interface EmpDao {

    //로그인
    EmpVo login(SqlSessionTemplate sst, EmpVo vo);

    //아이디 찾기
    EmpVo selectIdInfo(SqlSessionTemplate sst, EmpVo vo);

    //비밀번호 찾기(이름 && 이메일이 사원과 일치 여부 조회)
    EmpVo selectPwdInfo(SqlSessionTemplate sst, EmpVo vo);


}
