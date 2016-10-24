package com.spring.Hit;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.Hit.dao.ProductIDao;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private SqlSession sqlSession;

	@Inject
	private ProductIDao dao;

	// ī�װ��� ��ǰ ����Ʈ ������
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("pdt") ProductDto pdt, Model model) {
		logger.info(pdt.toString());

		model.addAttribute("list", dao.listDao(pdt));

	}

	// ��ǰ �� ���� ������
	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model) {
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		ProductIDao dao = sqlSession.getMapper(ProductIDao.class);
		model.addAttribute("list", dao.viewDao(item_no));
		model.addAttribute("review", dao.getReview(item_no));
		return "/product/detail";
	}

	// �ֹ��ϱ�
	@RequestMapping("/buy")
	public String directBuy(HttpServletRequest request, Model model, HttpSession session) {
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		ProductIDao dao = sqlSession.getMapper(ProductIDao.class);
		model.addAttribute("list", dao.viewDao(item_no));

		//
		
		String id = session.getAttribute("id").toString();
		//String id = request.getParameter("id");
		dao = sqlSession.getMapper(ProductIDao.class);
		model.addAttribute("mlist", dao.vmemDao(id));

		return "/product/buy";
	}

	// �����ۼ� �������� �̵�
	@RequestMapping("/writeReview")
	public String writeReview(@RequestParam("item_no") int item_no, Model model) {
		System.out.println("writeReview");
		model.addAttribute("item_no", item_no);
		return "/product/writeReview";

	}

	// ������
	@RequestMapping(value = "/addReview", method = RequestMethod.POST)
	public void addReview(ReviewDto rd, HttpServletRequest req) {
		System.out.println("addReview start");
		String fileName = rd.getImgfile().getOriginalFilename();
		System.out.println(fileName);
		String path = "C:\\Users\\chaehwi\\workspace\\flower_shoppingmall\\src\\main\\webapp\\resources\\review_img\\"
				+ fileName;
		File f = new File(path);
		try {
			rd.getImgfile().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		rd.setReview_img(fileName);
		dao.addReview(rd);
		System.out.println("addReview end");
	}

	// ���佴��
	@RequestMapping("/updateReview")
	public void updateReview(ReviewDto rd) {
		dao.updateReview(rd);
	}

	// �������
	@RequestMapping("/deleteReview")
	public void deleteReview(@RequestParam("item_no") int item_no) {
		dao.deleteReview(item_no);
	}

	// �ֹ� �߰� (����)
	@RequestMapping("/insert")
	public String insertOrder(HttpServletRequest request, Model model) {

		OrderDto order = new OrderDto();
		String id = request.getParameter("id");
		logger.info("3333333" + id);
		int i = Integer.parseInt(request.getParameter("item_no"));
		logger.info("3333333" + i);
		int j = Integer.parseInt(request.getParameter("order_vol"));
		logger.info("3333333" + j);
		int p = Integer.parseInt(request.getParameter("payment_price"));
		logger.info("3333333" + p);
		String payment_way = request.getParameter("type");
		logger.info("3333333" + payment_way);
		order.setPayment_way(payment_way);
		order.setId(id);
		order.setItem_no(i);
		order.setOrder_vol(j);
		order.setPayment_price(p);

		dao.orderinsertDao(order);
		// �ֹ� ���� ����
		dao.minuspd(order);
		return "/member/main";

	}

	// ���� ���� ������
	@RequestMapping("/myorder")
	public void myOrder(@ModelAttribute("odt") OrderDto odt, Model model, HttpSession session) {
		logger.info(odt.toString());
		String id = session.getAttribute("id").toString();
		dao = sqlSession.getMapper(ProductIDao.class);
		model.addAttribute("list", dao.vieworderDao(id));
	}

	
	
	
	// �������
	@RequestMapping("/delete")
	public String deleteorder(HttpServletRequest request) {
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		dao.deleteorder(order_no);
		
		//��� ������ ���ϱ�
		OrderDto order = new OrderDto();
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		logger.info("3333333" + item_no);
		int order_vol = Integer.parseInt(request.getParameter("order_vol"));
		logger.info("3333333" + order_vol);
		order.setItem_no(item_no);
		order.setOrder_vol(order_vol);
		
		dao.pluspd(order);
		return "redirect:/admin/delivery";
	}

	
	// �ֹ� ��� ���
	@RequestMapping("/orderdel")
	public String orderdel(HttpServletRequest request) {
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		dao.orderdel(order_no);
		return "redirect:/product/myorder";
	}
	
	
	// ��� ����
	// ��� ����
	// ��� ����
	// ��� ����
}
