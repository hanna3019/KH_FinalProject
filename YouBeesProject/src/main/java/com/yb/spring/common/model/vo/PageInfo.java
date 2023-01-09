package com.yb.spring.common.model.vo;

public class PageInfo {
	private int listCount;	// 총 게시글의 수
	private int nowPage;	// 현재페이지(요청한 페이지)
	private int pageLimit;	// 하단에 보여질 페이징바의 페이지 목록 최대 개수
	private int boardLimit;	// 한 페이지에 보여줄 게시글의 수
	
	private int maxPage;	// 가장 마지막 페이지 수
	private int startPage;	// 해당 페이지에 보여질 페이징바의 시작 수
	private int endPage;	// 해당 페이지에 보여질 페이징바의 끝 수
	
	public PageInfo() {
		
	}
	public PageInfo(int listCount, int nowPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.nowPage = nowPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", nowPage=" + nowPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
}
