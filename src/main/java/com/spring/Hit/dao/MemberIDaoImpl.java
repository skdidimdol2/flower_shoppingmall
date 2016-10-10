package com.spring.Hit.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.ProductDto;

@Repository
public class MemberIDaoImpl implements MemberIDao{
	@Inject
	private SqlSession session;
	
	@Override
	public List<ProductDto> mainDao() {
		// TODO Auto-generated method stub
		return null;
	}
/*
 * 	작성자 : 박종영
 * 	수정일 : 2016.10.3
 */	
	@Override
	public void memberJoinDao(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		Date birthday = Date.valueOf(req.getParameter("birthday"));
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String gender = req.getParameter("gender");
		MemberDto dto = new MemberDto(id, password, name, birthday, email, phone, gender, 0, new Timestamp(System.currentTimeMillis()/1000), 0, 0, null);
		session.insert("memberJoinDao", dto);
	}

	@Override
	public String memberId(String id) {
		return session.selectOne("memberId",id);
	}	
/*
 * 	작성자 : 이지원
 * 	수정일 : 2016.10.3
 */	
	@Override
	public MemberDto viewMemberDao(String id) {
		// TODO Auto-generated method stub
		return (MemberDto) session.selectOne("viewMemberDao", id);
	}
	@Override
	public void updateDao(MemberDto dto) {
		// TODO Auto-generated method stub
		session.update("updateDao", dto);
	}
	
	@Override
	public void deleteDao(String id) {
		// TODO Auto-generated method stub
		session.delete("deleteDao", id);
	}
	
	@Override
	public int checkDao(MemberDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("checkDao", dto).size();
	}
/*
 * 	작성자 : 전도해
 * 	수정일 : 2016.10.3
 */
   @Override
   public int loginDao(MemberDto dto) {
      // TODO Auto-generated method stub
      return session.selectOne("loginDao", dto);
   }

}
