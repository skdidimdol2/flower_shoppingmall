package com.spring.Hit.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

@Repository
public class MemberIDaoImpl implements MemberIDao{
	@Inject
	private SqlSession session;
	@Override
	public List<ProductDto> mainDao() {
		// TODO Auto-generated method stub
		return null;
	}
	//마이페이지 리뷰 상세보기
	@Override
	public ReviewDto reviewContentDao(Model model, HttpSession sess) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int review_no = Integer.parseInt(req.getParameter("review_no"));
		String id = (String)sess.getAttribute("id");
		ReviewDto dto = new ReviewDto();
		dto.setId(id);
		dto.setReview_no(review_no);
		return session.selectOne("reviewContent", dto);
	}
/*
 * 	작성자 : 박종영
 * 	수정일 : 2016.10.3
 */	
	//회원가입
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
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		String gender = req.getParameter("gender");
		MemberDto dto = new MemberDto(id, password, name, birthday, email, address, phone, gender, 0, new Timestamp(System.currentTimeMillis()/1000), 0, 0, null);
		session.insert("memberJoinDao", dto);
	}
	//ID 중복 확인
	@Override
	public String member_Id(String id) {
		return session.selectOne("memberId",id);
	}	
	//ID 찾기
	@Override
	public String idsearch(MemberDto dto) throws Exception{
		return session.selectOne("idsearch2", dto);
	}
	//비밀번호 찾기
	@Override
	public String pwdsearch(MemberDto dto) throws Exception{
		return session.selectOne("pwdsearch2", dto);
	}
	// 비밀번호 가져오기
	public String pwdDao(String id){
		return session.selectOne("pwdDao",id);
	}
	//비밀번호 바꾸기
	@Override
	public void resetpwd(MemberDto	dto){
		session.update("resetpwd", dto);
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
	public String updateMemberDao(Model model, HttpSession sess) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String id = (String)sess.getAttribute("id");
		String passwords = (String)sess.getAttribute("password");	//세션의 비밀번호
		String password1 = req.getParameter("password1");			//현재 비밀번호
		String types = req.getParameter("types");				//변경할 칼럼
		String value = req.getParameter("value");				//변경할 값
		if(passwords.equals(password1)){
			MemberDto dto = new MemberDto();
			value = types+" = '"+ value+"'";
		    dto.setId(id);
			dto.setName(value);
			session.update("updateMemberDao", dto);
			return "redirect:myPage";
		}else{
			return "redirect:myPage";
		}
	}
	//회원 삭제
	@Override
	public String deleteMemberDao(Model model, HttpSession sess) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String id = (String)sess.getAttribute("id");
	    String password = req.getParameter("password");
	    MemberDto dto = new MemberDto();
	    dto.setId(id);
	    dto.setPassword(password);
	    
		int result = session.delete("deleteMemberDao", dto);
		
		if(result==1){
			sess.removeAttribute("id");
			return "redirect:main";
		}else{
			return "redirect:myPage";
		}
		
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
	public String loginDao(Model model, HttpSession sess) {
			Map<String,Object> map = model.asMap();
		   HttpServletRequest req = (HttpServletRequest)map.get("req");
		   String id = req.getParameter("id");
		   String password = req.getParameter("password");
		   MemberDto dto = new MemberDto(id, password, null, null, null, null, null, null, 0, new Timestamp(System.currentTimeMillis()/1000), 0, 0, null);
		   dto = session.selectOne("loginDao", dto);
		   // dao로부터 id,pwd를 넘겨서 데이터베이스에서 로그인된 사용자인지 아닌지를 판별
		   if (dto!=null&&dto.getId().equals(id)) {
				// 로그인 된 사용자 이기 때문에 세션을 저장한다.
			   sess.setAttribute("id", id);
			   sess.setAttribute("password", password);
			   sess.setAttribute("name", dto.getName());
			   sess.setAttribute("logininfo", true);
			   System.out.println("Login 성공!");
			   return "redirect:main";
		   } else {
				// 잘못된 접속이라는 뷰를 보여주도록 뷰의 정보를 지정.
			   System.out.println("잘못된 접근");
			   return "redirect:loginForm";
		   }
	}
}
