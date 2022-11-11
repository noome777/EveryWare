package com.kh.app00.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.vo.MailFileVo;
import com.kh.app00.notice.dao.NoticeDao;
import com.kh.app00.notice.vo.NoticeFileVo;
import com.kh.app00.notice.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeDao dao;
	private final SqlSessionTemplate sst;
	
	public NoticeServiceImpl(NoticeDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//사내공지 목록 조회
	@Override
	public List<NoticeVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
	}
	
	//개시글 갯수 조회
		@Override
		public int selectTotalCnt() {
			return dao.selectCountAll(sst);
		}
	
	//사내공지 작성
	@Override
	public int write(NoticeVo vo) {
		return dao.insertNotice(sst, vo, null);
	}

	@Override
	public NoticeVo selectOne(String noticeCode) {
		int result = dao.increaseViews(sst, noticeCode);
		if(result == 1) {
			return dao.selectOne(sst , noticeCode, null);
		}else {
			return null;
		}
	}
	
	

	@Override
	public int delete(String noticeCode) {
		return dao.delete(sst, noticeCode);
	}

	@Override
	public int edit(NoticeVo nvo) {
		return dao.updateOne(sst , nvo);
	}

	@Override
	public int fileWrite(NoticeFileVo nfvo) {
		return dao.insertFile(sst,nfvo);
	}

	@Override
	public List<NoticeFileVo> selectFile(String noticeFilecode) {
		return dao.selectFile(sst,noticeFilecode);
	}

	@Override
	public List<NoticeFileVo> selectNoticeFileList(String noticeCode) {
		return dao.selectNoticeFileList(sst,noticeCode);
	}

	@Override
	public List<NoticeVo> selectNList() {
		return dao.selectNList(sst);
	}
}
