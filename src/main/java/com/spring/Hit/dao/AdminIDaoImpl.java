package com.spring.Hit.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.spring.Hit.dto.BasketDto;
import com.spring.Hit.dto.BoardDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

@Repository
public class AdminIDaoImpl implements AdminIDao{
	
	
	@Inject
	private SqlSession session;

	private static String namespace="com.spring.Hit.dao.AdminIDao";
	
	@Override
	public List<OrderDto> totalDao(OrderDto odt) {
		return session.selectList(namespace+".totalDao", odt);
	}
	
	@Override
	public List<OrderDto> monthDao(OrderDto odt) {
		return session.selectList(namespace+".monthDao", odt);
	}

	@Override
	public List<OrderDto> vieworder(OrderDto odt) {
		return session.selectList("vieworder", odt);
	}

	// 배송 처리 
	@Override
	public void delsuc(int order_no) {
		session.update("delsuc", order_no);	
	}

	
	// 배송 검색
	@Override
	public List<OrderDto> searchDao(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		OrderDto dto = new OrderDto();
		String type = req.getParameter("type");
		
		String content = req.getParameter("query");
		dto.setCategory(type);
		dto.setContent(content);
		return session.selectList("searchDao", dto);
	}
	
	
	// 배송 상세
	@Override
	public List<OrderDto> deliver1(OrderDto odt) {
		return session.selectList("deliver1", odt);
	}
	@Override
	public List<OrderDto> deliver2(OrderDto odt) {
		return session.selectList("deliver2", odt);
	}
	
	
	
	
	
	
	
/*	@Override //상품 상세 정보보기(select one), 상품 즉시 구매(one)
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
	}*/
	
	
}
