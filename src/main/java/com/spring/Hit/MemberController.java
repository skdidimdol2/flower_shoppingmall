package com.spring.Hit;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.Hit.dao.BasketIDao;
import com.spring.Hit.dao.MemberIDao;
import com.spring.Hit.dao.ProductIDao;
import com.spring.Hit.dto.BasketDto;
import com.spring.Hit.dto.MemberDto;


@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberIDao dao;
	@Inject
	private ProductIDao pdao;
	@Inject
	private BasketIDao bdao;
	
	//메인 페이지 & 간략한 상품 리스트
	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest req) {
		
		model.addAttribute("list", dao.mainDao());
		
		return "/member/main";
	}
	//리뷰 상세 보기
	@RequestMapping("/reviewContent")
	public String reviewContent(Model model, HttpServletRequest req, HttpSession sess){
		model.addAttribute("req", req);
		model.addAttribute("dto", dao.reviewContentDao(model, sess));
		
		return "/member/reviewPage";
	}
/*
 * 	작성자 : 박종영
 * 	수정일 : 2016.10.3
 */
	// 회원가입 입력 페이지
		@RequestMapping("/member_join")
		public String member_join(Model model, HttpServletRequest req) {
			model.addAttribute("req", req);
			dao.memberJoinDao(model);

			return "/member/main";
		}

		// ID 중복 확인
		/*@RequestMapping("/member_Id")
		public @ResponseBody String member_Id(Model model, HttpServletRequest req, HttpServletResponse response) throws IOException {
			String id = req.getParameter("jid");
			Map<String, Object> map = new HashMap<String, Object>();
			String a = dao.member_Id(id);
			System.out.println(a);
			map.put("b", a); //b를 ajax의 success : function(result)에서 if(result.b <-요기로 불러줌) 
			System.out.println((new Gson()).toJson(map));
			return (new Gson()).toJson(map);
//			return "/member/member_join";
		}*/
		
		//ID찾기 페이지
		@RequestMapping("/idsearch")
		public String idsearch(Model model, HttpServletRequest req) throws Exception{
			model.addAttribute("req", req);
			return "/member/idsearch";
		}
		
		//ID찾기
		//@RequestMapping("/idsearch2")
		/*public @ResponseBody String idsearch2(Model model, HttpServletRequest req) throws Exception{
			model.addAttribute("req", req);
			Map<String, Object> map = new HashMap<String, Object>();
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
//			System.out.println(name +"  "+ phone);
			
			MemberDto dto = new MemberDto();
			dto.setName(name);
			dto.setPhone(phone);
			String d = dao.idsearch(dto);
//			System.out.println(dao.idsearch(dto));
			map.put("name", name);
			map.put("phone", phone);
			map.put("i", d);
//			System.out.println((new Gson()).toJson(map));
			return (new Gson()).toJson(map);
		}*/
		
		//비밀번호 찾기 페이지
		@RequestMapping("/pwdsearch")
		public String pwdsearch(Model model, HttpServletRequest req) throws Exception{
			model.addAttribute("req", req);
			return "/member/pwdsearch";
		}
		
		//비밀번호 찾기
		/*@RequestMapping("/pwdsearch2")
		public @ResponseBody String pwdsearch2(Model model, HttpServletRequest req) throws Exception{
			model.addAttribute("req", req);
			Map<String, Object> map = new HashMap<String, Object>();
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			
			MemberDto dto = new MemberDto();
			dto.setId(id);
			dto.setName(name);
			dto.setPhone(phone);
			map.put("id", id);
			map.put("name", name);
			map.put("phone", phone);
			map.put("p", dao.pwdsearch(dto));
			return (new Gson()).toJson(map);
		}
		
		//비밀번호 바꾸기 페이지
		@RequestMapping("/pwd_reset")
		public String pwd_reset(Model model, HttpServletRequest req) throws Exception {
			model.addAttribute("req", req);
			String id = req.getParameter("id");
			
			model.addAttribute("pwd", dao.pwdDao(id));
			model.addAttribute("id", id);
			return "/member/pwd_reset";
		}
		
		//비밀번호 바꾸기
		@RequestMapping("/resetpwd")
		public String resetpwd(Model model, HttpServletRequest req, HttpSession session) throws Exception{
			String password = req.getParameter("pwd");
			System.out.println(password);
			String id = req.getParameter("id");
			System.out.println(id);
			MemberDto dto = new MemberDto();
			dto.setPassword(password);
			dto.setId(id);
			dao.resetpwd(dto);
			return "redirect:loginForm";
		}
=======
	
	// 회원가입 입력 페이지
	@RequestMapping("/member_join")
	public String member_join(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		dao.memberJoinDao(model);

		return "/member/main";
	}

	// ID 중복 확인
	@RequestMapping("/member_Id")
	public @ResponseBody String member_Id(Model model, HttpServletRequest req, HttpServletResponse response) throws IOException {
		String id = req.getParameter("jid");
		Map<String, Object> map = new HashMap<String, Object>();
		String a = dao.member_Id(id);
		System.out.println(a);
		map.put("b", a); //b를 ajax의 success : function(result)에서 if(result.b <-요기로 불러줌) 
		System.out.println((new Gson()).toJson(map));
		return (new Gson()).toJson(map);
//		return "/member/member_join";
	}
	
	//ID찾기 페이지
	@RequestMapping("/idsearch")
	public String idsearch(Model model, HttpServletRequest req) throws Exception{
		model.addAttribute("req", req);
		return "/member/idsearch";
	}
	
	//ID찾기
	@RequestMapping("/idsearch2")
	public @ResponseBody String idsearch2(Model model, HttpServletRequest req) throws Exception{
		model.addAttribute("req", req);
		Map<String, Object> map = new HashMap<String, Object>();
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
//		System.out.println(name +"  "+ phone);
		
		MemberDto dto = new MemberDto();
		dto.setName(name);
		dto.setPhone(phone);
		String d = dao.idsearch(dto);
//		System.out.println(dao.idsearch(dto));
		map.put("name", name);
		map.put("phone", phone);
		map.put("i", d);
//		System.out.println((new Gson()).toJson(map));
		return (new Gson()).toJson(map);
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping("/pwdsearch")
	public String pwdsearch(Model model, HttpServletRequest req) throws Exception{
		model.addAttribute("req", req);
		return "/member/pwdsearch";
	}
	
	//비밀번호 찾기
	@RequestMapping("/pwdsearch2")
	public @ResponseBody String pwdsearch2(Model model, HttpServletRequest req) throws Exception{
		model.addAttribute("req", req);
		Map<String, Object> map = new HashMap<String, Object>();
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		
		MemberDto dto = new MemberDto();
		dto.setId(id);
		dto.setName(name);
		dto.setPhone(phone);
		map.put("id", id);
		map.put("name", name);
		map.put("phone", phone);
		map.put("p", dao.pwdsearch(dto));
		return (new Gson()).toJson(map);
	}
	
	//비밀번호 바꾸기 페이지
	@RequestMapping("/pwd_reset")
	public String pwd_reset(Model model, HttpServletRequest req) throws Exception {
		model.addAttribute("req", req);
		String id = req.getParameter("id");
		
		model.addAttribute("pwd", dao.pwdDao(id));
		model.addAttribute("id", id);
		return "/member/pwd_reset";
	}
	
	//비밀번호 바꾸기
	@RequestMapping("/resetpwd")
	public String resetpwd(Model model, HttpServletRequest req, HttpSession session) throws Exception{
		String password = req.getParameter("pwd");
		System.out.println(password);
		String id = req.getParameter("id");
		System.out.println(id);
		MemberDto dto = new MemberDto();
		dto.setPassword(password);
		dto.setId(id);
		dao.resetpwd(dto);
		return "redirect:loginForm";
	}

>>>>>>> origin/chaehwi

/*
 * 	작성자 : 이지원
 * 	수정일 : 2016.10.3
 */	
   
   //마이페이지
   @RequestMapping("/myPage")
   public String myPage(Model model, HttpSession session) {
      
      String id = (String)session.getAttribute("id");
      BasketDto dto = new BasketDto();
      dto.setId(id);
      model.addAttribute("orderlist", pdao.viewRecentOrderDao(id));
      model.addAttribute("basketlist", bdao.viewbasketDao(dto));
      model.addAttribute("me", dao.viewMemberDao(id));
      model.addAttribute("re", pdao.getReviewList(id));
      
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
   public String modifyInfoProc(Model model, HttpServletRequest req, HttpSession sess){
      model.addAttribute("req", req);
	  
      return dao.updateMemberDao(model, sess);
   }
   
   //회원 탈퇴
   @RequestMapping("/deleteDao")
   public String deleteDao(Model model, HttpServletRequest req,  MemberDto dto, HttpSession sess){
	  model.addAttribute("req", req);
      
      return dao.deleteMemberDao(model, sess);
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
   public String login(Model model, HttpServletRequest req, HttpSession sess){
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
	

   
}
