package com.spring.Hit.dao;

import java.util.List;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

public interface ProductIDao {

	// 카테고리별 상품 리스트 페이지
	public List<ProductDto> listDao(ProductDto pdt);

	// 상품 상세 정보 페이지 , 상품 즉시 구매
	public ProductDto viewDao(int item_no);

	// 상품 이름으로 검색
	public ProductDto searchItem(String item_name);

	// 전체 리뷰 출력
	public List<ReviewDto> selectAllReview();

	// 상품별 리뷰 출력
	public List<ReviewDto> getReview(int item_no);

	// 전체 리뷰 출력(아이디)
	public List<ReviewDto> getReviewList(String id);

	// 리뷰 등록
	public void addReview(ReviewDto rd);

	// 리뷰 수정
	public void updateReview(ReviewDto rd);

	// 리뷰 삭제
	public void deleteReview(int item_no);

	// 여러 개 삭제
	public void deleteList(ReviewDto rd);

	// 리뷰 한개 선택
	public ReviewDto selectReview(int review_no);

	// 리뷰 개수 //페이징 처리
	public int reviewCount();

	// 구매자정보
	public List<MemberDto> vmemDao(String id);

	// 결제 입력
	public void orderinsertDao(OrderDto order);

	// 결제 테이블
	public List<OrderDto> vieworderDao(String id);

	// 최근 주문 목록 리스트
	public List<OrderDto> viewRecentOrderDao(String id);

	// 결제 취소
	public void deleteorder(int order_no);

	// 주문취소대기
	public void orderdel(int order_no);

	// 재고수량 빼기
	public void minuspd(OrderDto order);

	// 재고수량 더하기
	public void pluspd(OrderDto order);

}
