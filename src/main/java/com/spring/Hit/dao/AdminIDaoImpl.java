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

	// ��� ó�� 
	@Override
	public void delsuc(int order_no) {
		session.update("delsuc", order_no);	
	}

	
	// ��� �˻�
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
	
	
	// ��� ��
	@Override
	public List<OrderDto> deliver1(OrderDto odt) {
		return session.selectList("deliver1", odt);
	}
	@Override
	public List<OrderDto> deliver2(OrderDto odt) {
		return session.selectList("deliver2", odt);
	}
	
	
	//ȸ�� ���� ������ ����Ʈ
		@Override
		public List<MemberDto> adminMemberListDao() {
			// TODO Auto-generated method stub
			return session.selectList("adminMemberListDao");
		}
		//ȸ�� ���� ����Ʈ �˻�
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
			String query = "";	//where���� �� ������
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
					if(!gender.equals("��ü")){
						query += " and gender = '"+gender+"'";
					}
				}else{
					if(!gender.equals("��ü")){
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
			//�˻� ��ư�� ������ ���. Data���� �ϳ��� ���� ��
			if(query.equals(""))
				query +=" gender is not null";
			dto.setId(query);	//id���� query�� �־ ���.
		//	System.out.println(query);
			return session.selectList("adminSearchMemberDao", dto);
		}
		//ȸ�� ����
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

		// Admin Main ���� �ֹ� ��Ȳ
		@Override
		public int todayorder(){
			
			return session.selectOne("todayorder");
			
			
		}

	
}
