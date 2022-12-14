package com.kh.app00.mail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.vo.MailFileVo;
import com.kh.app00.mail.vo.MailVo;

@Repository
public class MailDaoImpl implements MailDao {

	@Override
	public List<MailVo> selectList(SqlSessionTemplate sst,String id,PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		return sst.selectList("mailMapper.selectList",id, rb);
	}

	@Override
	public int insertMail(SqlSessionTemplate sst, MailVo mvo) {
		return sst.insert("mailMapper.insertMail", mvo);
	}

	@Override
	public int deleteMail(SqlSessionTemplate sst, String mailCode) {
		return sst.delete("mailMapper.deleteMail", mailCode);
	}

	@Override
	public List<MailVo> selectTrashlist(SqlSessionTemplate sst,String id, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		return sst.selectList("mailMapper.selectTrashlist", id, rb);
	}

	@Override
	public int clean(SqlSessionTemplate sst, String mailCode) {
		return sst.delete("mailMapper.cleanMail", mailCode);
	}

	@Override
	public int back(SqlSessionTemplate sst, String mailCode) {
		return sst.update("mailMapper.backMail", mailCode);
	}

	@Override
	public List<MailVo> selectSendlist(SqlSessionTemplate sst,String id, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		return sst.selectList("mailMapper.selectSendlist", id, rb);
	}

	@Override
	public List<MailVo> selectRelist(SqlSessionTemplate sst, String id,PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		return sst.selectList("mailMapper.selectRelist", id, rb);
	}

	@Override
	public int replyMail(SqlSessionTemplate sst, MailVo mvo) {
		return sst.insert("mailMapper.replyMail", mvo);
	}

	@Override
	public int selfWrite(SqlSessionTemplate sst, MailVo mvo) {
		return sst.insert("mailMapper.selfMail", mvo);
	}

	@Override
	public List<MailVo> selectSelflist(SqlSessionTemplate sst, String id,PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		
		return sst.selectList("mailMapper.selectSelflist", id, rb);
	}
	
	@Override
	public MailVo selectMail(SqlSessionTemplate sst, String mailCode) {
		return sst.selectOne("mailMapper.selectMail", mailCode);
	}

	@Override
	public int deleteOne(SqlSessionTemplate sst, String mailCode) {
		return sst.delete("mailMapper.deleteOne", mailCode);
	}

	@Override
	public int selectCountAll(SqlSessionTemplate sst, String id) {
		return sst.selectOne("mailMapper.selectCountAll",id);
	}

	@Override
	public int selectDeleteCnt(SqlSessionTemplate sst) {
		return sst.selectOne("mailMapper.selectDeleteAll");
	}

	@Override
	public int increaseViews(SqlSessionTemplate sst, String mailCode) {
		return sst.update("mailMapper.increaseViews", mailCode);
	}

	@Override
	public int readMail(SqlSessionTemplate sst, String mailCode) {
		return sst.update("mailMapper.readMail", mailCode);
	}

	@Override
	public int noreadMail(SqlSessionTemplate sst, String mailCode) {
		return sst.update("mailMapper.noReadmail", mailCode);
	}

	@Override
	public List<MailVo> selectSearchList(SqlSessionTemplate sst ,MailVo mvo,PageVo pv2) {
		
		int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
		
		return sst.selectList("mailMapper.selectSearchList",mvo , rb);
	}

	@Override
	public int selectSearchTotalCnt(SqlSessionTemplate sst, MailVo mvo) {
		return sst.selectOne("mailMapper.selectSearchTotalCnt", mvo);
	}

	@Override
	public int insertFile(SqlSessionTemplate sst,MailFileVo mfvo) {
		return sst.insert("mailMapper.insertFile",mfvo);
	}
	
	
	@Override
	public List<MailFileVo> selectMailFileList(SqlSessionTemplate sst, String mailCode) {
		return sst.selectList("mailMapper.selectMailFileList",mailCode);
	}
	
	@Override
	public List<MailFileVo> selectFile(SqlSessionTemplate sst, String mailFilecode) {
		return sst.selectList("mailMapper.selectFile",mailFilecode);
	}

	@Override
	public int selectSendTotalCnt(SqlSessionTemplate sst, String id) {
		return sst.selectOne("mailMapper.selectSendTotalCnt",id);
	}

	@Override
	public int selectSelfTotalCnt(SqlSessionTemplate sst, String id) {
		return sst.selectOne("mailMapper.selectSelfTotalCnt", id);
	}

	@Override
	public List<MailVo> selectSearchSendList(SqlSessionTemplate sst, MailVo mvo, PageVo pv2) {
		int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
		
		return sst.selectList("mailMapper.selectSearchSendList", mvo , rb);
	}
	
	
	@Override
	public int selectSearchSendCnt(SqlSessionTemplate sst, MailVo mvo) {
		return sst.selectOne("mailMapper.selectSearchSendCnt", mvo);
	}

	@Override
	public List<MailVo> selectSearchSelfList(SqlSessionTemplate sst, MailVo mvo, PageVo pv2) {
		
		int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
		return sst.selectList("mailMapper.selectSearchSelfList", mvo,rb);
	}

	@Override
	public int selectSearchSelfCnt(SqlSessionTemplate sst, MailVo mvo) {
		return sst.selectOne("mailMapper.selectSearchSelfCnt", mvo);
	}

	@Override
	public List<MailVo> selectSearchTrashList(SqlSessionTemplate sst, MailVo mvo, PageVo pv2) {

		int offset = (pv2.getCurrentPage()-1) * pv2.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv2.getBoardLimit());
        
        return sst.selectList("mailMapper.selectSearchTrashList", mvo, rb);
	}

	@Override
	public int selectSearchTrashCnt(SqlSessionTemplate sst, MailVo mvo) {
		return sst.selectOne("mailMapper.selectSearchTrashCnt", mvo);
	}

	


	
}
