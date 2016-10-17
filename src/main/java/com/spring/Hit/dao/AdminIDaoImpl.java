package com.spring.Hit.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;
import com.sun.media.jfxmedia.logging.Logger;

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
	public List<ProductDto> adminItem(ProductDto pdt) {
		return session.selectList("adminItem", pdt);
	}
	
	@Override
	public ProductDto adminOneitem(int item_no) {
		return session.selectOne("adminOneitem", item_no);
	}
	
	@Override
	public void adminDelitem(int item_no) {
		AdminIDao ado = session.getMapper(AdminIDao.class);
		ado.adminDelitem(item_no);
	}
	
	@Override
	public void adminInsitem(ProductDto pdt) {
		AdminIDao ado = session.getMapper(AdminIDao.class);
		ado.adminInsitem(pdt);
		
	}

	@Override
	public void adminModitem(ProductDto pdt) {
		AdminIDao ado = session.getMapper(AdminIDao.class);
		ado.adminModitem(pdt);
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
	
	
	//회원 관리 페이지 리스트
		@Override
		public List<MemberDto> adminMemberListDao() {
			// TODO Auto-generated method stub
			return session.selectList("adminMemberListDao");
		}
		//회원 관리 리스트 검색
		@Override
		public List<MemberDto> adminSearchMemberDao(Model model) {
			// TODO Auto-generated method stub
			Map<String,Object> map = model.asMap();
			HttpServletRequest req = (HttpServletRequest)map.get("req");
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String gender = req.getParameter("gender");
			String birthday1 = req.getParameter("birthday1");
			String birthday2 = req.getParameter("birthday2");
			String joindate1 = req.getParameter("joindate1");
			String joindate2 = req.getParameter("joindate2");
			String query = "";	//where절에 들어갈 쿼리문
			MemberDto dto = new MemberDto();
			if(!id.equals("")){
				query += " id = '"+id+"'";
			}	
			if(!name.equals("")){
				if(!query.equals("")){
					query += " and name like '%"+name+"%'";
				}else{
					query += " name like '%"+name+"%'";
				}
			}
			if(!email.equals("")){
				if(!query.equals("")){
					query += " and email like '%"+email+"%'";
				}else{
					query += " email like '%"+email+"%'";
				}
			}
			if(!phone.equals("")){
				if(!query.equals("")){
					query += " and phone = "+phone;
				}else{
					query += " phone = "+phone;
				}
			}
			if(!address.equals("")){
				if(!query.equals("")){
					query += " and address like '%"+address+"%'";
				}else{
					query += " address like '%"+address+"%'";
				}
			}
			if(!gender.equals("")){
				if(!query.equals("")){
					if(!gender.equals("전체")){
						query += " and gender = '"+gender+"'";
					}
				}else{
					if(!gender.equals("전체")){
						query += " gender = '"+gender+"'";
					}
				}
			}
			if(!birthday1.equals("")){
				if(!query.equals("")){
					query += " and birthday between '"+birthday1+"' and '"+birthday2+"'";
				}else{
					query += " birthday between '"+birthday1+"' and '"+birthday2+"'";
				}
			}
			if(!joindate1.equals("")){
				if(!query.equals("")){
					query += " and joindate between '"+joindate1+"' and '"+joindate2+"'";
				}else{
					query += " joindate between '"+joindate1+"' and '"+joindate2+"'";
				}
			}
			//검색 버튼만 눌렀을 경우. Data값이 하나도 없을 때
			if(query.equals(""))
				query +=" gender is not null";
			dto.setId(query);	//id값에 query를 넣어서 사용.
		//	System.out.println(query);
			return session.selectList("adminSearchMemberDao", dto);
		}
		//회원 삭제
		@Override
		public void adminMemberDeleteDao(Model model) {
			// TODO Auto-generated method stub
			Map<String,Object> map = model.asMap();
			HttpServletRequest req = (HttpServletRequest)map.get("req");
			String[] id = req.getParameterValues("id");
			for (int i = 0; i < id.length; i++) {
				session.delete("adminMemberDeleteDao", id[i]);
			}
			
		}
		//회원 리스트 정렬
		@Override
		public List<MemberDto> adminMemberSortDao(MemberDto dto) {
			// TODO Auto-generated method stub
			return session.selectList("adminMemberSortDao", dto);
		}

	
	
	
		// Admin Main 오늘 주문 현황
		@Override
		public int todayorder(){
			
			return session.selectOne("todayorder");
			
			
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
