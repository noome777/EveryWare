package com.kh.app00.organization.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

@Repository
public class OrganizationDaoImpl implements OrganizationDao {

	//임직원 정보 불러오기
	@Override
	public List<EmpVo> selectEmpList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("organizationMapper.selectEmpList");
	}

	//이름으로 임직원 정보 불러오기
	@Override
	public List<EmpVo> selectEmpListByWord(SqlSessionTemplate sqlSessionTemplate, String word) {
		return sqlSessionTemplate.selectList("organizationMapper.selectEmpListByWord", word);
	}

	//부서 정보 가져오기
	@Override
	public List<DeptVo> selectDeptList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("organizationMapper.selectDeptList");
	}
	

}
