package com.spring.Hit.dto;

public class ZipcodeSearchDto {
	/*
	 * target string(�ʼ�) ���񽺿� ���� ������ ���� �����ؾ� �ϴ� �ʼ� �� �Դϴ�. ���� �����ȣ API ���� : post
	 * ���θ� �����ȣ API ���� : postRoad �������ȣ(2015�� 8�� 1�� ����Ǵ� 5�ڸ� ������ȣ) ���� �����ȣ API
	 * ���� : newPost �������ȣ(2015�� 8�� 1�� ����Ǵ� 5�ڸ� ������ȣ) ���θ� �����ȣ API ���� :
	 * newPostRoad
	 * 
	 * query string(�ʼ�) ��ȸ�ϰ��� �ϴ� ������ �˻� ���Ǿ��Դϴ�. ���� �����ȣ API ���ÿ��� ��/��/��, ���θ�
	 * �����ȣ API ���ÿ��� ���θ�+�ǹ���ȣ ��) ���� : �Ż絿, ����1�� / ���θ� : ������ 17
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
