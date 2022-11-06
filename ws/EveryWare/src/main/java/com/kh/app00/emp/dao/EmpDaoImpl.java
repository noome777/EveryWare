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

    //임시비밀번호와 db의 비밀번호의 일치 여부 체크(조회)
    @Override
    public EmpVo selectSearchTempPwd(SqlSessionTemplate sst, EmpVo vo) {
        return sst.selectOne("empMapper.selectSearchTempPwd", vo);
    }

    //임시비밀번호를 새로운 비밀번호로 변경
    @Override
    public int updateNewPwd(SqlSessionTemplate sst, EmpVo vo) {
        return sst.update("empMapper.updateNewPwd", vo);
    }

    
    //임직원 정보수정
	@Override
	public int updateEmp(SqlSessionTemplate sst, EmpVo empVo) {
		System.out.println("지금 비밀번호 : " + empVo.getEmpPwd());
		return sst.update("empMapper.updateEmp",empVo);
	}

	//임직원 정보 업데이트 후 정보 가져오기
	@Override
	public EmpVo selectEmpByEmpCode(SqlSessionTemplate sst, String empCode) {
		return sst.selectOne("empMapper.selectEmpByEmpCode",empCode);
	}

   


    

}
