package com.kh.app00.emp.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.emp.dao.EmpDao;
import com.kh.app00.emp.vo.EmpVo;

@Service
public class EmpServiceImpl implements EmpService {

    private final EmpDao dao;
    private final SqlSessionTemplate sst;
    
    @Autowired
    public EmpServiceImpl(EmpDao dao, SqlSessionTemplate sst) {
        this.dao = dao;
        this.sst = sst;
    }
    
    //로그인
    @Override
    public EmpVo login(EmpVo vo) {
        return dao.login(sst, vo);
    }

    

}
