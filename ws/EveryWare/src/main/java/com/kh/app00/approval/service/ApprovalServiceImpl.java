package com.kh.app00.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.approval.dao.ApprovalDao;
import com.kh.app00.approval.vo.DocFormVo;
import com.kh.app00.approval.vo.DocPeriodVo;
import com.kh.app00.approval.vo.DocSecurityVo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	private final ApprovalDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ApprovalServiceImpl(ApprovalDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//문서종류
	@Override
	public List<DocFormVo> selectFormList() {
		return dao.selectFormList(sst);
	}

	//보존연한
	@Override
	public List<DocPeriodVo> selectPeriodList() {
		return dao.selectPeriodList(sst);
	}

	//보안등급
	@Override
	public List<DocSecurityVo> selectSecurityList() {
		return dao.selectSecurityList(sst);
	}

}
