package com.kh.app00.emp.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.emp.vo.EmpVo;

public interface EmpDao {

    //로그인
    EmpVo login(SqlSessionTemplate sst, EmpVo vo);

}
