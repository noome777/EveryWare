package com.kh.app00.organization.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.organization.vo.JobVo;
import com.kh.app00.organization.vo.RankVo;

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

	//임직원 추가
	@Override
	public int insertEmp(SqlSessionTemplate sqlSessionTemplate, EmpVo empVo) {
		return sqlSessionTemplate.insert("organizationMapper.insertEmp",empVo);
	}

	//직위 리스트 가져오기
	@Override
	public List<RankVo> selectRankList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("organizationMapper.selectRankList");
	}

	//직무 리스트 가져오기
	@Override
	public List<JobVo> selectJobList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("organizationMapper.selectJobList");
	}

	//아이디 중복체크
	@Override
	public int checkIdDup(SqlSessionTemplate sqlSessionTemplate, String id) {
		return sqlSessionTemplate.selectOne("organizationMapper.checkIdDup",id);
	}

	//임직원 검색
	@Override
	public List<EmpVo> selectEmpListByEmpData(SqlSessionTemplate sqlSessionTemplate,String empData) {
		return sqlSessionTemplate.selectList("organizationMapper.selectEmpListByEmpName",empData);
	}

	
	

}
