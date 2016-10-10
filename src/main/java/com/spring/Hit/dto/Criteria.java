package com.spring.Hit.dto;

// Criteria page=페이지 수, perPageNum=몇개를 나타낼건지, pageEnd=마지막페이지
public class Criteria {
	private int page;
	private int perPageNum;
	private int pageEnd;
	
	public Criteria(){
		this.page = 1;
		this.perPageNum = 10;
		this.pageEnd = this.page*this.perPageNum;
	}
	
	public void setPage(int page){
 		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPageEnd(){
		this.pageEnd = page*perPageNum;
	}
	
	public void setPerPageNum(int perPageNum){
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage(){
		return page;
	}
	
	public int getPageEnd(){
		return pageEnd;
	}
	
	public int getPageStart(){
		return (this.page -1) * perPageNum;
	}
	
	public int getPerPageNum(){
		return this.perPageNum;
	}

	public int getPageEnded(){
		return this.page*this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", pageEnd=" + pageEnd + "]";
	}
	
	

}
