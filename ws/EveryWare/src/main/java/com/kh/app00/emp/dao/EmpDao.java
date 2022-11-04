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

    //비밀번호 랜덤값으로 업데이트
    int updateTempPwd(SqlSessionTemplate sst, EmpVo vo);

    //임시비밀번호와 db의 비밀번호의 일치 여부 체크(조회)
    EmpVo selectSearchTempPwd(SqlSessionTemplate sst, EmpVo vo);

    //임시비밀번호를 새로운 비밀번호로 변경
    int updateNewPwd(SqlSessionTemplate sst, EmpVo vo);

    //임직원 정보수정
	int updateEmp(SqlSessionTemplate sst, EmpVo empVo);

	//임직원 정보 업데이트 후 정보 가져오기
	EmpVo selectEmpByEmpCode(SqlSessionTemplate sst, String empCode);

   


}
