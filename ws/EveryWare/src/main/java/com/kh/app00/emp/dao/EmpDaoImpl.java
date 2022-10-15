package com.kh.app00.emp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.emp.vo.EmpVo;

@Repository
public class EmpDaoImpl implements EmpDao {

    //로그인
    @Override
    public EmpVo login(SqlSessionTemplate sst, EmpVo vo) {
        return sst.selectOne("empMapper.selectOneByEmail", vo);
    }

    //아이디 찾기
    @Override
    public EmpVo selectIdInfo(SqlSessionTemplate sst, EmpVo vo) {
        return sst.selectOne("empMapper.selectIdInfo", vo);
    }

    

}
