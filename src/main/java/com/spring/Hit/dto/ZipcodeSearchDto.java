package com.spring.Hit.dto;

public class ZipcodeSearchDto {
	/*
	 * target string(필수) 서비스에 따라 다음과 같이 지정해야 하는 필수 값 입니다. 지번 우편번호 API 서비스 : post
	 * 도로명 우편번호 API 서비스 : postRoad 새우편번호(2015년 8월 1일 시행되는 5자리 구역번호) 지번 우편번호 API
	 * 서비스 : newPost 새우편번호(2015년 8월 1일 시행되는 5자리 구역번호) 도로명 우편번호 API 서비스 :
	 * newPostRoad
	 * 
	 * query string(필수) 조회하고자 하는 내용의 검색 질의어입니다. 지번 우편번호 API 사용시에는 읍/면/동, 도로명
	 * 우편번호 API 사용시에는 도로명+건물번호 예) 지번 : 신사동, 구의1동 / 도로명 : 세종로 17
	 */

	private String target;
	private String query;
	
	private String countPerPage;
	private String currentPage;

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(String countPerPage) {
		this.countPerPage = countPerPage;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

}
