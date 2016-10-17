package com.spring.Hit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.Hit.dto.BasketDto;
import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

@Repository
public class ProductIDaoImpl implements ProductIDao,BasketIDao{
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.spring.Hit.dao.ProductIDao";

	@Override //상품 목록 보기(select *)
	public List<ProductDto> listDao(ProductDto pdt) {
		return session.selectList("listDao", pdt);
	}
	
	@Override //상품 상세 정보보기(select one), 상품 즉시 구매(one)
	public ProductDto viewDao(int item_no) {
		return session.selectOne("viewDao", item_no);
	}
	
	@Override
	public ProductDto searchItem(String item_name) {
		return session.selectOne("searchItem", item_name);
	}
	
	@Override //장바구니에 상품 추가(insert one)
	public void writebasketDao(BasketDto bt) {
		BasketIDao bd = session.getMapper(BasketIDao.class);
		bd.writebasketDao(bt);
	}

	@Override //장바구니 내용 보기(select *)
	public List<ProductDto> viewbasketDao(BasketDto bdt) {
		return session.selectList("viewbasketDao",bdt);
	}
		
	@Override //장바구니의 물품 비우기(delete one)
	public void deletebasketDao(int basket_no) {
		BasketIDao bd = session.getMapper(BasketIDao.class);
		bd.deletebasketDao(basket_no);
	}
	
	@Override //장바구니의 물품 비우기(delete select)
	public void delchoiceBasket(int[] list) {
		BasketIDao bd = session.getMapper(BasketIDao.class);
		bd.delchoiceBasket(list);	
	}
	@Override
	public List<ProductDto> buychoiceBasket(int[] list) {
		return session.selectList("buychoiceBasket", list);
	}
	
	//리뷰 전체목록 가져오기
	@Override
	public List<ReviewDto>getReview(int item_no) {
		return session.selectList("getReview", item_no);
	}
	
	//리뷰 목록 가져오기(아이디)
	@Override
	public List<ReviewDto>getReviewList(String id) {
		return session.selectList("getReviewList", id);
	}
	
	//리뷰등록
	@Override
	public void addReview(ReviewDto rd) {
		System.out.println(rd.getId());
		System.out.println(rd.getItem_no());
		System.out.println(rd.getReview_con());
		System.out.println(rd.getReview_tit());
		session.insert("addReview", rd);
	}

	//리뷰수정
	@Override
	public void updateReview(ReviewDto rd) {
		session.update("updateReview", rd);
	}
	
	//리뷰삭제
	@Override
	public void deleteReview(int item_no) {
		session.delete("item_no", item_no);
	}
	
	// 구매자 정보(바로구매)
		@Override
		public List<MemberDto> vmemDao(String id) {
			return session.selectList("vmemDao", id);
		}
		
		
		// 구매자 정보(장바구니)
			@Override
			public List<MemberDto> bmemDao(String id) {
				return session.selectList("bmemDao", id);
			}

		// 구매 테이블 저장
		@Override
		public void orderinsertDao(OrderDto order) {
			ProductIDao pdo = session.getMapper(ProductIDao.class);
			pdo.orderinsertDao(order);
		}

		
		// 장바구니 구매 저장
		@Override
		public void orderbasketins(OrderDto order) {
			BasketIDao bdo = session.getMapper(BasketIDao.class);
			bdo.orderbasketins(order);
			
		}

		// 주문 목록 보기
		@Override
		public List<OrderDto> vieworderDao(String id) {
			
			return session.selectList("vieworderDao", id);
		}
		
		// 최근 주문 목록 보기
		@Override
		public List<OrderDto> viewRecentOrderDao(String id) {
			return session.selectList("viewRecentOrderDao", id);
		}

		// 결제 취소
		@Override
		public void deleteorder(int order_no) {
			ProductIDao pdo = session.getMapper(ProductIDao.class);
			pdo.deleteorder(order_no);
		}

		
		// 주문 취소 대기
		@Override
		public void orderdel(int order_no) {
			session.update("orderdel", order_no);
			
		}

		// 재고 수량 빼기
		@Override
		public void minuspd(OrderDto order) {
			ProductIDao pdo = session.getMapper(ProductIDao.class);
			pdo.minuspd(order);
		}

		
		
		// 재고수량 더하기
		@Override
		public void pluspd(OrderDto order) {
			ProductIDao pdo = session.getMapper(ProductIDao.class);
			pdo.pluspd(order);
		}
		
		
		

}
