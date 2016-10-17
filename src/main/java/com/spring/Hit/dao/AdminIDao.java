package com.spring.Hit.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;

public interface AdminIDao {

	// 월별 매출표
	public List<OrderDto> totalDao(OrderDto odt);

	// 월별 매출표
	public List<OrderDto> monthDao(OrderDto odt);

	// 상품 리스트들 출력
	public List<ProductDto> adminItem(ProductDto pdt);

	// 상품 상세정보 및 수정페이지
	public ProductDto adminOneitem(int item_no);

	// 상품 삭제
	public void adminDelitem(int item_no);

	// 신상품 등록
	public void adminInsitem(ProductDto pdt);

	// 상품 수정
	public void adminModitem(ProductDto pdt);

	// 주문 현황
	public List<OrderDto> vieworder(OrderDto odt);

	// 배송 처리
	public void delsuc(int order_no);

	// 배송 검색
	// public List<OrderDto> searchorder(OrderDto odt);
	public List<OrderDto> searchDao(Model model);

	// 주문 상세
	public List<OrderDto> deliver1(OrderDto odt);

	// 주문 상세
	public List<OrderDto> deliver2(OrderDto odt);

	// 회원 리스트
	public List<MemberDto> adminMemberListDao();

	// 회원 검색
	public List<MemberDto> adminSearchMemberDao(Model model);

	// 회원 삭제
	public void adminMemberDeleteDao(Model model);

	// 경희
	

	// 상품 상세 정보 페이지 , 상품 즉시 구매
	// public ProductDto viewDao(int item_no);

	// 상품 이름으로 검색
	// public ProductDto searchItem(String item_name);

	// 전체 리뷰 출력
	// public List<ReviewDto> getReview(int item_no);
	// 리뷰 등록
	// public void addReview(ReviewDto rd);
	// 리뷰 수정
	// public void updateReview(ReviewDto rd);
	// 리뷰 삭제
	// public void deleteReview(int item_no);
	
	
	public int todayorder(); // Admin Main 주문 현황 
	
	//상품 상세 정보 페이지 , 상품 즉시 구매
//	public ProductDto viewDao(int item_no);
	
	//상품 이름으로 검색
//	public ProductDto searchItem(String item_name);
	
	//전체 리뷰 출력 
	//public List<ReviewDto> getReview(int item_no);
	//리뷰 등록
//	public void addReview(ReviewDto rd);
	//리뷰 수정
//	public void updateReview(ReviewDto rd);
	//리뷰 삭제
	//public void deleteReview(int item_no);
	
}
