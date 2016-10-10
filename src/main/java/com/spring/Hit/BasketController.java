package com.spring.Hit;

import java.sql.Timestamp;

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

import com.spring.Hit.dao.BasketIDao;
import com.spring.Hit.dao.ProductIDao;
import com.spring.Hit.dto.BasketDto;
import com.spring.Hit.dto.OrderDto;

@Controller //컨트롤러 설정
@RequestMapping("/basket")
public class BasketController {
	
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);
	@Autowired //의존식 주입
	private SqlSession sqlsession;
	
	@Inject
	private BasketIDao bao; 
	
	@Inject
	private ProductIDao dao;
	   
	//장바구니의 목록 
	@RequestMapping("/mybasket")
	public String viewbasket(@ModelAttribute("bat") BasketDto bdt, Model model){
	
		model.addAttribute("list", bao.viewbasketDao(bdt));
		return "/basket/mybasket";
	}
	
	//장바구니 하나의 목록 비우기
	@RequestMapping("/deleteonesuccess")
	public String deletebasketone(HttpServletRequest req){
		int basket_no=Integer.parseInt(req.getParameter("basket_no"));
		bao.deletebasketDao(basket_no);
		return "/basket/deleteonesuccess";
	}
	//장바구니 선택 목록 비우기
	@RequestMapping("deleteselsuccess")
	public String deletebasketsel(HttpServletRequest req){
		String[] str = req.getParameter("basket_no").split(",");
		int[] list = new int[str.length];
		for(int i=0;i<list.length;i++){
			list[i]=Integer.parseInt(str[i]);
		}
		bao.delchoiceBasket(list);
		return "redirect:mybasket";
	}
	
	//장바구니에 상품 추가 
	@RequestMapping("/basketsuccess")
	public String insert(HttpServletRequest request,BasketDto bt){
		bt.setItem_no(Integer.parseInt(request.getParameter("item_no")));
		bt.setBuy_vol(Integer.parseInt(request.getParameter("buy_vol")));
		bao.writebasketDao(bt);
		return "/basket/basketsuccess";
	}
	
	//구매 페이지 이동(select one, select list)
	@RequestMapping("/buy")
	public String buyitem(Model model, HttpServletRequest request, HttpSession session){	
		String str[] = request.getParameter("basket_no").split(",");
		int[] list = new int[str.length];
		for(int i=0;i<list.length;i++){
			list[i]=Integer.parseInt(str[i]);
		}
		model.addAttribute("list", bao.buychoiceBasket(list));
		
		//
		//String id = request.getParameter("id");
		String id = session.getAttribute("id").toString();
		bao = sqlsession.getMapper(BasketIDao.class);
		model.addAttribute("mlist", bao.bmemDao(id));
		
		
		return "/basket/buy";
	}
	
	//주문 추가 (장바구니)
	@RequestMapping("/insert")
	public String insertOrder(HttpServletRequest request, Model model){
			
		String[] t1 = request.getParameterValues("id");
		String[] t2 = request.getParameterValues("item_no");
		String[] t3 = request.getParameterValues("order_vol");
		String[] t4 = request.getParameterValues("payment_price");
		String[] t5 = request.getParameterValues("type");
		String[] d1 = request.getParameterValues("basket_no");
		
			
		for (int i = 0; i < t1.length; i++) {
			OrderDto dto = new OrderDto(0, Integer.parseInt(t2[i]), t1[i], Integer.parseInt(t3[i]), 
					t5[i], null, new Timestamp(System.currentTimeMillis()/1000), 
					new Timestamp(System.currentTimeMillis()/1000), Integer.parseInt(t4[i]), 0, null, null, null, null, null);
			bao.orderbasketins(dto);
			bao.deletebasketDao(Integer.parseInt(d1[i]));
			dao.minuspd(dto);
		}
		return "/member/main";
	}


	
}
