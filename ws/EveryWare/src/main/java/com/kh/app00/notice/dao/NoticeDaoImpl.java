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
	
}
