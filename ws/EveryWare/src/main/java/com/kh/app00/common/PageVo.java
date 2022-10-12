package com.kh.app00.common;

import lombok.Data;

@Data
public class PageVo {

	private int listCount;		//총 개시글 갯수
	private int currentPage;	//현재 페이지
	private int pageLimit; 		//하단 페이지 영역에 보여줄 페이지 버튼 갯수
	private int boardLimit;		//한 페이지에서 보여줄 게시글 갯수
	
	private int maxPage;		//가장 마지막 페이지
	private int startPage;		//페이지 영역에서 보여줄 시작 페이지
	private int endPage;		//페이지 영역에서 보여줄 마지막 페이지
	
}
