package com.kh.app00.emp.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.emp.vo.EmpVo;

public interface EmpDao {

    //로그인
    EmpVo login(SqlSessionTemplate sst, EmpVo vo);

    //아이디 찾기
    EmpVo selectIdInfo(SqlSessionTemplate sst, EmpVo vo);

    //회원 패스워드 불러오기
    EmpVo searchPwd(SqlSessionTemplate sst, EmpVo vo);

    //회원 패스워드 업데이트

}
