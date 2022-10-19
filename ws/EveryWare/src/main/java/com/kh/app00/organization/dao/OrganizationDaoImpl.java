package com.kh.app00.organization.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
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

	//임직원 관리 - 페이징 카운트
	@Override
	public int selectCountAll(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("organizationMapper.selectCountAll");
	}

	//임직원 관리 - 페이징
	@Override
	public List<EmpVo> selectEmpListByPage(SqlSessionTemplate sqlSessionTemplate, PageVo pv) {
		
		int offset = (pv.getCurrentPage() - 1) * pv.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset , pv.getBoardLimit()); //RowBounds(오프셋, 리밋)
		
		return sqlSessionTemplate.selectList("organizationMapper.selectEmpListByPage",null,rowBounds);
	}
	
	

}