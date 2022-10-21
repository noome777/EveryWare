package com.kh.app00.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.notice.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<NoticeVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("noticeMapper.selectList");
	}

	@Override
	public int insertNotice(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("noticeMapper.insertNotice", vo);
	}

	@Override
	public NoticeVo selectOne(SqlSessionTemplate sst, String noticeCode) {
		return sst.selectOne("noticeMapper.selectOne", noticeCode);
	}

	@Override
	public int increaseHit(SqlSessionTemplate sst, String noticeCode) {
		return sst.update("noticeMapper.increaseHit" , noticeCode);
	}
	
}
