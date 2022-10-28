package com.kh.app00.emp.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.app00.emp.dao.EmpDao;
import com.kh.app00.emp.vo.EmpVo;

@Service
public class EmpServiceImpl implements EmpService {

    private final EmpDao dao;
    private final SqlSessionTemplate sst;
    private final PasswordEncoder pwdEnc;
    
    @Autowired
    public EmpServiceImpl(EmpDao dao, SqlSessionTemplate sst, PasswordEncoder pwdEnc) {
        this.dao = dao;
        this.sst = sst;
        this.pwdEnc = pwdEnc;
    }
    
    //로그인
    @Override
    public EmpVo login(EmpVo vo) {
        //DB의 암호화 된 비밀번호와 일치 여부 확인
//        EmpVo dbMember = dao.login(sst, vo);
//        
//        if(pwdEnc.matches(vo.getEmpPwd(), dbMember.getEmpPwd())) {
//            return dbMember;
//        }else {
//            return null;
//        }
        return dao.login(sst, vo);
    }

    //아이디 찾기
    @Override
    public EmpVo selectIdInfo(EmpVo vo) {
        return dao.selectIdInfo(sst, vo);
    }

    //비밀번호 찾기(이름 && 이메일이 사원과 일치 여부 조회)
    @Override
    public EmpVo selectPwdInfo(EmpVo vo) {
        return dao.selectPwdInfo(sst, vo);
    }

    //비밀번호 랜덤값으로 업데이트
    @Override
    public int updateTempPwd(EmpVo vo) {
        return dao.updateTempPwd(sst, vo);
    }

   

   

    

}
