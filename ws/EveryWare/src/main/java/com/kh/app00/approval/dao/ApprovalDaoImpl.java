package com.kh.app00.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.approval.vo.DocFormVo;
import com.kh.app00.approval.vo.DocPeriodVo;
import com.kh.app00.approval.vo.DocSecurityVo;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	@Override
	public List<DocFormVo> selectFormList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectFormList");
	}

	@Override
	public List<DocPeriodVo> selectPeriodList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectPeriodList");
	}

	@Override
	public List<DocSecurityVo> selectSecurityList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectSecurityList");
	}

}
