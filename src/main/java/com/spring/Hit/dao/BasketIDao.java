package com.spring.Hit.dao;

import java.util.List;

import com.spring.Hit.dto.BasketDto;
import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;

public interface BasketIDao {

	// 장바구니에 상품 추가(insert one)
	public void writebasketDao(BasketDto bt);

	// 장바구니 목록 보기(select *)
	public List<ProductDto> viewbasketDao(BasketDto bdt);

	// 장바구니의 물품 삭제(delete one)
	public void deletebasketDao(int basket_no);

	// 장바구니의 물품 선택 삭제(delete list)
	public void delchoiceBasket(int[] list);

	public List<ProductDto> buychoiceBasket(int[] list);

	// 구매자정보
	public List<MemberDto> bmemDao(String id);

	// 결제 입력
	public void orderbasketins(OrderDto order);

	// 장바구니의 물품 선택 구매페이지 이동(select list,one)
	// public List<ProductDto> buychoiceBasket(int[] list);

	// 리뷰 보기
	// 리뷰 쓰기
	// 리뷰 수정
	// 리뷰 삭제
	// 댓글 보기
	// 댓글 쓰기
	// 댓글 수정
	// 댓글 삭제

}
