package com.spring.Hit;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.Hit.dao.AdminIDao;
import com.spring.Hit.dao.BoardIDao;
import com.spring.Hit.dao.ProductIDao;
import com.spring.Hit.dao.ReplyDao;
import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;
import com.spring.Hit.mail.SendMail;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private ProductIDao pro_dao;

	@Inject
	private ReplyDao rep_dao;

	@Inject
	private BoardIDao boa_dao;
	
	@Inject
	private AdminIDao dao;

	@Inject
	private SendMail sendMail;

	// 관리자 메인 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		logger.info("메인 페이지");
		if (session.getAttribute("id") != null) {
			if (session.getAttribute("id").equals("admin123") == true) {
				model.addAttribute("order", dao.todayorder());
				
				return "/admin/main";
			} else {
				return "/member/error";
			}
		} else {
			return "/member/error";
		}
		
	}

	// 관리자 상품관리
	@RequestMapping(value = "/itemMan")
	public String itemlist(Model model, @ModelAttribute("pdt") ProductDto pdt) {
		model.addAttribute("item", dao.adminItem(pdt));
		return "/admin/itemMan";

	}

	@RequestMapping(value = "/insertItem")
	public String insertItem() {
		return "/admin/insertItem";
	}

	// 상품 추가
	@RequestMapping(value = "/adminInsitem")
	public String insertItem(HttpServletRequest req, ProductDto pdt) {
		pdt.setItem_name(req.getParameter("item_name"));
		pdt.setCategory(req.getParameter("category"));
		pdt.setPrice(Integer.parseInt(req.getParameter("price")));
		pdt.setVolume(Integer.parseInt(req.getParameter("volume")));
		pdt.setImg("../resources/image/" + req.getParameter("img"));
		pdt.setItem_content(req.getParameter("item_content"));
		dao.adminInsitem(pdt);
		return "redirect:itemMan";
	}

	// 상품 수정페이지 이동
	@RequestMapping(value = "/modifyItem")
	public String modifyItem(Model model, HttpServletRequest req) {
		int item_no = Integer.parseInt(req.getParameter("item_no"));
		model.addAttribute("item", dao.adminOneitem(item_no));
		return "/admin/modifyItem";
	}

	@RequestMapping(value = "/modifyOk")
	public String modifyItem(HttpServletRequest req, ProductDto pdt) {
		pdt.setItem_name(req.getParameter("item_name"));
		pdt.setPrice(Integer.parseInt(req.getParameter("price")));
		pdt.setVolume(Integer.parseInt(req.getParameter("volume")));
		pdt.setImg("../resources/image/" + req.getParameter("img"));
		pdt.setItem_content(req.getParameter("item_content"));
		pdt.setItem_no(Integer.parseInt(req.getParameter("item_no")));
		dao.adminModitem(pdt);
		return "redirect:itemMan";
	}

	@RequestMapping(value = "/adminDelitem")
	public String adminDelitem(HttpServletRequest req, Model model) {
		int item_no = Integer.parseInt(req.getParameter("item_no"));
		dao.adminDelitem(item_no);
		return "redirect:itemMan";
	}

	// 관리자 매출 관리
	@RequestMapping(value = "/admin_sales", method = RequestMethod.GET)
	public void salesGET(@ModelAttribute("odt") OrderDto odt, Model model) {
		logger.info("매출 페이지");
		model.addAttribute("list", dao.totalDao(odt));
	}

	// 관리자 매출 관리
	@RequestMapping(value = "/admin_sales_month", method = RequestMethod.GET)
	public void salesMonth(@ModelAttribute("odt") OrderDto odt, @RequestParam("month") String month, Model model) {
		logger.info("월 페이지");
		odt.setMonth(month);
		model.addAttribute("list", dao.monthDao(odt));
	}

	// 관리자 배송 관리
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public void delivery(@ModelAttribute("odt") OrderDto odt, Model model) {
		logger.info(odt.toString());
		model.addAttribute("list", dao.vieworder(odt));
	}

	// 배송 완료 처리
	@RequestMapping("/delsuc")
	public String delsuc(HttpServletRequest request) {
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		dao.delsuc(order_no);
		return "redirect:delivery";
	}

	// 배송 검색
	@RequestMapping("/search")
	public String boardSearch(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("list", dao.searchDao(model));// 제목,내용,작성자로 검색
		return "/admin/delivery";
	}

	// 배송 상세 페이지 처리
	@RequestMapping(value = "/deliver_detail", method = RequestMethod.GET)
	public void deliver(@ModelAttribute("odt") OrderDto odt, Model model, HttpServletRequest request) {
		String detail = request.getParameter("detail");
		if (detail.equals("a")) {

			logger.info(odt.toString());
			model.addAttribute("list", dao.deliver1(odt));

		} else if (detail.equals("b")) {

			logger.info(odt.toString());
			model.addAttribute("list", dao.deliver2(odt));

		}
	}

	// 회원 관리 리스트
	@RequestMapping("/adminMember")
	public String adminMember(Model model, HttpServletRequest req) {
		model.addAttribute("list", dao.adminMemberListDao());
		return "/admin/adminMember";
	}

	// 메일 보내기 폼 열기
	@RequestMapping("/sendMailForm")
	public String adminSendMailForm(Model model) {
		return "/admin/sendMailForm";
	}

	// 메일 보내기 기능
	@RequestMapping("/adminSendMail")
	public String adminSendMail(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("num", sendMail.sendMail(model));
		model.addAttribute("message", "메일 전송 완료");
		return "/admin/sendMailForm";
	}

	// 회원 관리 리스트 검색
	@RequestMapping("/adminSearchMember")
	public String adminSearchMember(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("list", dao.adminSearchMemberDao(model));
		return "/admin/adminMember";
	}

	// 회원 삭제(관리자)
	@RequestMapping("/adminMemberDel")
	public String adminMemberDel(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		dao.adminMemberDeleteDao(model);
		return "redirect:adminMember";
	}

	// 경희
	// 게시판관리 페이지 이동
	@RequestMapping("boardList")
	ModelAndView boardList(HttpServletRequest req, Model model) {
		ModelAndView mav = new ModelAndView("/admin/boardList");
		// 리뷰리스트
		mav.addObject("reviewList", pro_dao.selectAllReview());
		mav.addObject("replyCount", pro_dao.reviewCount());
		// 댓글리스트
		model.addAttribute("req", req);
		mav.addObject("replyList", rep_dao.replyAllList(model));
		mav.addObject("replyCount", rep_dao.replyCountDao());
		// 자유게시판리스트
		mav.addObject("freeList", boa_dao.boardDao(model));
		mav.addObject("freeCount", boa_dao.boardCountDao());

		return mav;
	}

	// 게시판 글 삭제
	@RequestMapping("boardDelete")
	ModelAndView boardDelete(HttpServletRequest req, @RequestParam("type") String id, ReviewDto rd) {
		ModelAndView mav = new ModelAndView("/admin/boardList");
		String[] no = req.getParameterValues("checkno");
		rd.setId(id);
		for (int i = 0; i < no.length; i++) {
			rd.setReview_no(Integer.parseInt(no[i]));
			pro_dao.deleteList(rd);
		}
		return mav;
	}

	// 게시판 글 상세 내용
	@RequestMapping("boardDetail")
	ModelAndView boardDetail(HttpServletRequest req, @RequestParam("type") String type, Model model) {
		ModelAndView mav = new ModelAndView("/admin/boardListContent");
		mav.addObject("type", type);
		System.out.println(type + "====");
		System.out.println(req.getParameter("reply_no"));
		if (type.equals("review")) {
			int reivew_no = Integer.parseInt(req.getParameter("review_no"));
			mav.addObject("review", pro_dao.selectReview(reivew_no));
		} else if (type.equals("reply")) {
			int reply_group = Integer.parseInt(req.getParameter("reply_no"));
			mav.addObject("reply", rep_dao.replyDtail(reply_group));
		} else if (type.equals("board")) {
			model.addAttribute("req", req);
			mav.addObject("board", boa_dao.boardContentDao(model));
		}

		return mav;
	}
	
	
//	// 경희 개인구현 
//	// 상품추가 페이지 이동
//	@RequestMapping("addProduct")
//	String addProduct() {
//		return "/admin/addProduct";
//	}
//
//	// 상품추가 - 엑셀 파일 다운로드
//	@RequestMapping("excelDownload")
//	ModelAndView download() {
//		String path = "C:\\workspace_spring\\Spring_ShoppingMall\\src\\main\\webapp\\resources\\addproduct_excel\\";
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("fileName", new File(path + "addProductFile.xls"));
//		mav.setViewName("downloadView");
//		return mav;
//
//	}
//
//	// 상품추가 - 엑셀 파일 업로드
//	@RequestMapping("excelUpload")
//	ModelAndView upload(MultipartHttpServletRequest mReq) {
//		System.out.println("upload start");
//		ModelAndView mav = new ModelAndView("/admin/excel_addProduct");
//		List<List<ProductDto>> list = null;
//		List<ProductDto> pdList = null;
//		List<ProductDto> new_pdList = null;
//		UploadView upload = new UploadView();
//		list = upload.upload(mReq);
//
//		pdList = list.get(0);
//		new_pdList = list.get(1);
//
//		System.out.println(pdList.size() + "사이즈" + new_pdList.size());
//
//		// 기존상품추가 - 지금 있는 상품인지 체크
//		// 새상품추가 - 지금 있는 상품과 이름 같은지 체크
//
//		mav.addObject("pdList", pdList);
//		mav.addObject("new_pdList", new_pdList);
//
//		System.out.println("upload end");
//		return mav;
//	}

}