package com.spring.Hit;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Hit.dao.MemberIDao;
import com.spring.Hit.dto.MemberDto;


@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberIDao dao;
	
	//메인 페이지 & 간략한 상품 리스트
	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest req) {
		
		model.addAttribute("list", dao.mainDao());
		
		return "/member/main";
	}
/*
 * 	작성자 : 박종영
 * 	수정일 : 2016.10.3
 */
	
	// 회원가입 입력
	@RequestMapping("/member_join")
	public String member_join(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		dao.memberJoinDao(model);

		return "/member/main";
	}

//	// 회원가입 페이지
//	@RequestMapping("/member_join_view")
//	public String member_join_view(Model model, HttpServletRequest req) {
//		
//		return "/member/member_join";
//	}

	// ID 중복 확인
//	@RequestMapping("/member_Id")
//	public String member_Id(Model model, HttpServletRequest req) {
//		String id = req.getParameter("id");
//		
//		String a = dao.memberId(id);
//		if(a==null){
//			System.out.println(id);
//			model.addAttribute("id", id);
//		}else{
//			
//		}
//		
//		return "/member/member_join";
//	}

/*
 * 	작성자 : 이지원
 * 	수정일 : 2016.10.3
 */	
   
   //마이페이지
   @RequestMapping("/myPage")
   public String myPage(Model model, HttpSession session) {
      
      String id = (String)session.getAttribute("id");
      
      model.addAttribute("dto", dao.viewMemberDao(id));
      
      return "/member/myPage";
   }
   
   //정보수정페이지
   @RequestMapping("/modifyInfo")
   public String modifyInfo(Model model, HttpSession session){
      
      String id = (String)session.getAttribute("id");
      model.addAttribute("dto", dao.viewMemberDao(id));
      
      return "/member/modifyInfo";
   }
   
   //정보수정 처리
   @RequestMapping("/modifyInfoProc")
   public String modifyInfoProc(Model model, MemberDto dto, HttpSession session){
	   System.out.println("1111");
      
      dao.updateDao(dto);
      session.setAttribute("password", dto.getPassword());
      session.setAttribute("email", dto.getEmail());
      session.setAttribute("phone", dto.getPhone());
      
      return "/member/modifyInfo";
   }
   
   //회원 탈퇴
   @RequestMapping("/deleteDao")
   public String deleteDao(Model model, MemberDto dto, HttpSession session){
   
      String id = (String)session.getAttribute("id");
      
      dao.deleteDao(id);
      session.removeAttribute("id");
      
      return "/member/main";
   }
/*
* 	작성자 : 전도해
* 	수정일 : 2016.10.3
*/	
   @RequestMapping("/joinForm")
   public String joinForm(Model model) {
	   return "/member/joinForm";
   }

   @RequestMapping("/loginForm")
   public String loginForm(Model model) {
	   return "/member/loginForm";
   }
	
   @RequestMapping("/login")
   public String login(Model model, HttpServletRequest req, HttpSession sess) {
	   model.addAttribute("req", req);
	   return dao.loginDao(model, sess);
   }
   @RequestMapping("/logout")
   public String logout(HttpSession session){	
	   session.invalidate();
	   return "member/main";
   }
	
   @RequestMapping("/cart")
   public String cart(HttpSession session){	
	   return "member/cart";
   }
	
   @RequestMapping("/order")
   public String order(HttpSession session){
	   return "member/order";
   }
		
   @RequestMapping("/wishList")
   public String wishList(HttpSession session){
	   	return "member/wishList";
   }
	
   @RequestMapping("/findlogin")
   public void findlogin(HttpSession session){
	   session.setAttribute("logininfo", true);
   }
	
//   @RequestMapping("/myPage")
//   public String myPage(Model model, HttpSession session) {
//	   String id = (String)session.getAttribute("id");
//	   System.out.println(id);
//	   model.addAttribute("dto", dao.viewMemberDao(id)); 
//	   return "/member/myPage";
//   }
   
}
