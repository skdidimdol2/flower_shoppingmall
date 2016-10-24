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

	// ������ ���� ������
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		logger.info("���� ������");
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

	// ������ ��ǰ����
	@RequestMapping(value = "/itemMan")
	public String itemlist(Model model, @ModelAttribute("pdt") ProductDto pdt) {
		model.addAttribute("item", dao.adminItem(pdt));
		return "/admin/itemMan";

	}

	@RequestMapping(value = "/insertItem")
	public String insertItem() {
		return "/admin/insertItem";
	}

	// ��ǰ �߰�
	@RequestMapping(value = "/adminInsitem")
	public String insertItem(HttpServletRequest req, ProductDto pdt) {
		pdt.setItem_name(req.getParameter("item_name"));
		pdt.setCategory(req.getParameter("category"));
		pdt.setPrice(Integer.parseInt(req.getParameter("price")));
		pdt.setVolume(Integer.parseInt(req.getParameter("volume")));
		pdt.setItem_content(req.getParameter("item_content"));
		pdt.setImg("../resources/image/"+req.getParameter("img"));
		dao.adminInsitem(pdt);
		return "redirect:itemMan";
	}

	// ��ǰ ���������� �̵�
	@RequestMapping(value = "/modifyItem")
	public String modifyItem(Model model, HttpServletRequest req) {
		int item_no = Integer.parseInt(req.getParameter("item_no"));
		model.addAttribute("item", dao.adminOneitem(item_no));
		return "/admin/modifyItem";
	}
	//��ǰ ����
	@RequestMapping(value = "/modifyOk")
	public String modifyItem(HttpServletRequest req, ProductDto pdt) {
		pdt.setItem_name(req.getParameter("item_name"));
		pdt.setPrice(Integer.parseInt(req.getParameter("price")));
		pdt.setVolume(Integer.parseInt(req.getParameter("volume")));
		//pdt.setImg("../resources/image/" + req.getParameter("img"));
		pdt.setImg(req.getParameter("img"));
		System.out.println(req.getParameter("img"));
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

	// ������ ���� ����
	@RequestMapping(value = "/admin_sales", method = RequestMethod.GET)
	public void salesGET(@ModelAttribute("odt") OrderDto odt, Model model) {
		logger.info("���� ������");
		model.addAttribute("list", dao.totalDao(odt));
	}

	// ������ ���� ����
	@RequestMapping(value = "/admin_sales_month", method = RequestMethod.GET)
	public void salesMonth(@ModelAttribute("odt") OrderDto odt, @RequestParam("month") String month, Model model) {
		logger.info("�� ������");
		odt.setMonth(month);
		model.addAttribute("list", dao.monthDao(odt));
	}

	// ������ ��� ����
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public void delivery(@ModelAttribute("odt") OrderDto odt, Model model) {
		logger.info(odt.toString());
		model.addAttribute("list", dao.vieworder(odt));
	}

	// ��� �Ϸ� ó��
	@RequestMapping("/delsuc")
	public String delsuc(HttpServletRequest request) {
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		dao.delsuc(order_no);
		return "redirect:delivery";
	}

	// ��� �˻�
	@RequestMapping("/search")
	public String boardSearch(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("list", dao.searchDao(model));// ����,����,�ۼ��ڷ� �˻�
		return "/admin/delivery";
	}

	// ��� �� ������ ó��
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

	// ȸ�� ���� ����Ʈ
	@RequestMapping("/adminMember")
	public String adminMember(Model model, HttpServletRequest req) {
		model.addAttribute("list", dao.adminMemberListDao());
		return "/admin/adminMember";
	}

	// ���� ������ �� ����
	@RequestMapping("/sendMailForm")
	public String adminSendMailForm(Model model) {
		return "/admin/sendMailForm";
	}

	// ���� ������ ���
	@RequestMapping("/adminSendMail")
	public String adminSendMail(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("num", sendMail.sendMail(model));
		model.addAttribute("message", "���� ���� �Ϸ�");
		return "/admin/sendMailForm";
	}

	// ȸ�� ���� ����Ʈ �˻�
	@RequestMapping("/adminSearchMember")
	public String adminSearchMember(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("list", dao.adminSearchMemberDao(model));
		return "/admin/adminMember";
	}

	// ȸ�� ����(������)
	@RequestMapping("/adminMemberDel")
	public String adminMemberDel(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		dao.adminMemberDeleteDao(model);
		return "redirect:adminMember";
	}

	// ����
	// �Խ��ǰ��� ������ �̵�
	@RequestMapping("boardList")
	ModelAndView boardList(HttpServletRequest req, Model model) {
		ModelAndView mav = new ModelAndView("/admin/boardList");
		// ���丮��Ʈ
		mav.addObject("reviewList", pro_dao.selectAllReview());
		mav.addObject("replyCount", pro_dao.reviewCount());
		// ��۸���Ʈ
		model.addAttribute("req", req);
		mav.addObject("replyList", rep_dao.replyAllList(model));
		mav.addObject("replyCount", rep_dao.replyCountDao());
		// �����Խ��Ǹ���Ʈ
		mav.addObject("freeList", boa_dao.boardDao(model));
		mav.addObject("freeCount", boa_dao.boardCountDao());

		return mav;
	}

	// �Խ��� �� ����
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

	// �Խ��� �� �� ����
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

	// ���� ���α���
	// ��ǰ�߰� ������ �̵�
	@RequestMapping("addProduct")
	String addProduct() {
		return "/admin/addProduct";
	}

	// ��ǰ�߰� - ���� ���� �ٿ�ε�
	@RequestMapping("excelDownload")
	ModelAndView download() {
		String path = "C:\\workspace_spring\\Spring_ShoppingMall\\src\\main\\webapp\\resources\\addproduct_excel\\";
		ModelAndView mav = new ModelAndView();
		mav.addObject("fileName", new File(path + "addProductFile.xls"));
		mav.setViewName("downloadView");
		return mav;

	}

	// ��ǰ�߰� - ���� ���� ���ε�
	@RequestMapping("excelUpload")
	ModelAndView upload(MultipartHttpServletRequest mReq) {
		System.out.println("upload start");
		ModelAndView mav = new ModelAndView("/admin/addProduct");
		List<List<ProductDto>> list = null;
		List<ProductDto> pdList = null;
		List<ProductDto> new_pdList = null;
		UploadView upload = new UploadView();
		list = upload.upload(mReq);

		pdList = list.get(0);
		new_pdList = list.get(1);
		
		System.out.println(pdList.size() + "������" + new_pdList.size());

		// ������ǰ�߰� - ���� �ִ� ��ǰ���� üũ
		// ����ǰ�߰� - ���� �ִ� ��ǰ�� �̸� ������ üũ
		int i = 0;
		mav.addObject("i", i);
		mav.addObject("pdList", pdList);
		mav.addObject("new_pdList", new_pdList);

		System.out.println("upload end");
		return mav;
	}

}