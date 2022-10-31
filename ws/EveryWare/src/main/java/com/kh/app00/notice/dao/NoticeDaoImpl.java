package com.kh.app00.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.notice.vo.NoticeFileVo;
import com.kh.app00.notice.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		return sst.selectList("noticeMapper.selectList", null , rb);
	}
	
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("noticeMapper.selectCountAll");
	}

	@Override
	public int insertNotice(SqlSessionTemplate sst, NoticeVo vo, NoticeFileVo fvo) {
		return sst.insert("noticeMapper.insertNotice", vo);
	}

	@Override
	public NoticeVo selectOne(SqlSessionTemplate sst, String noticeCode, NoticeFileVo fvo) {
		return sst.selectOne("noticeMapper.selectOne", noticeCode);
	}

	@Override
	public int increaseViews(SqlSessionTemplate sst, String noticeCode) {
		return sst.update("noticeMapper.increaseViews" , noticeCode);
	}

	

	@Override
	public int delete(SqlSessionTemplate sst, String noticeCode) {
		return sst.update("noticeMapper.deleteNotice", noticeCode);
	}

	@Override
	public int updateOne(SqlSessionTemplate sst, NoticeVo nvo) {
		return sst.update("noticeMapper.updateOne" , nvo);
	}

	
}
