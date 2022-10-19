package com.kh.app00.emp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.emp.vo.EmpVo;

@Repository
public class EmpDaoImpl implements EmpDao {

    //로그인
    @Override
    public EmpVo login(SqlSessionTemplate sst, EmpVo vo) {
        return sst.selectOne("empMapper.selectOneById", vo);
    }

    //아이디 찾기
    @Override
    public EmpVo selectIdInfo(SqlSessionTemplate sst, EmpVo vo) {
        return sst.selectOne("empMapper.selectIdInfo", vo);
    }

    //비밀번호 찾기(이름 && 이메일이 사원과 일치 여부 조회)
    @Override
    public EmpVo selectPwdInfo(SqlSessionTemplate sst, EmpVo vo) {
        return sst.selectOne("empMapper.selectPwdInfo", vo);
    }

    //비밀번호 랜덤값으로 업데이트
    @Override
    public int updateTempPwd(SqlSessionTemplate sst, EmpVo vo) {
        return sst.update("empMapper.updateTempPwd", vo);
    }



    

}
