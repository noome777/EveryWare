package com.kh.app00.common;

public class Pagination {
	
	public static PageVo getPageVo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo vo = new PageVo();
		vo.setListCount(listCount);
		vo.setCurrentPage(currentPage);
		vo.setPageLimit(pageLimit);
		vo.setBoardLimit(boardLimit);
		vo.setMaxPage(maxPage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return vo;
	}
	
}
