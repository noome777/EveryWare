package com.kh.app00.emp.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.app00.common.SpaceRemover;
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
        EmpVo dbMember = dao.login(sst, vo);
        
        if(pwdEnc.matches(vo.getEmpPwd(), dbMember.getEmpPwd())) {
            return dbMember;
        }else {
            return null;
        }
//        return dao.login(sst, vo);
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
        
        vo.encodePwd(pwdEnc);
        return dao.updateTempPwd(sst, vo);
    }

    //임시비밀번호와 db의 비밀번호의 일치 여부 체크(조회)
    @Override
    public EmpVo selectSearchTempPwd(EmpVo vo) {
        
        //DB의 암호화 된 비밀번호와 일치 여부 확인
        EmpVo dbMember = dao.selectSearchTempPwd(sst, vo);
        
        if(pwdEnc.matches(vo.getEmpPwd(), dbMember.getEmpPwd())) {
            return dbMember;
        }else {
            return null;
        }
    }

    //임시비밀번호를 새로운 비밀번호로 변경
    @Override
    public int updateNewPwd(EmpVo vo) {
        
        vo.encodePwd(pwdEnc);
        return dao.updateNewPwd(sst, vo);
    }

    //임직원 정보 업데이트
	@Override
	public int updateEmp(EmpVo empVo) {
			
		if(empVo.getEmpPwd()!=null || empVo.getEmpPwd()!="") {
			String replacedPwd = SpaceRemover.removeSpace(empVo.getEmpPwd());
			empVo.setEmpPwd(replacedPwd);
			empVo.encodePwd(pwdEnc);
		}
		
		if(empVo.getEmpTel().length()!=11) {
			return -2;
		} else if (empVo.getEmpPhone().length()!=11) {
			return -3;
		} else if (empVo.getEmpEMail().length()>30) {
			return -4;
		} else if (empVo.getEmpAddress1().length()>50) {
			return -5;
		} else if (empVo.getEmpAddress2().length()>50) {
			return -6;
		}
		
		int result = dao.updateEmp(sst,empVo);
		
		if(result==1) {
			return result;
		} else {
			return -1;
		}
	}

	//임직원 정보 업데이트 후 정보 가져오기
	@Override
	public EmpVo selectEmpByEmpCode(String empCode) {
		return dao.selectEmpByEmpCode(sst,empCode);
	}

   

   

    

}
