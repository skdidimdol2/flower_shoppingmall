package com.spring.Hit.dto;

import java.sql.Timestamp;

public class OrderDto extends ProductDto{
	private int order_no;
	private int item_no;
	private String id;
	private int order_vol;		//주문 수량
	private String payment_way;	//결제 수단
	private String payment_bool;	//결제 유무
	private Timestamp order_date;	//주문일
	private Timestamp pay_date;		//결제 완료일
	//추가
	private int payment_price;
	private int payment_price_sum;
	private String month;
	private String del_bool;   // 배송 유무
	private String cancel_bool;   // 취소 유무
	private String category;  // 검색 카테고리
	private String content;  // 검색 내용
	
	public OrderDto() {
		// TODO Auto-generated constructor stub
	}
	
	

	public OrderDto(int order_no, int item_no, String id, int order_vol, String payment_way, String payment_bool,
			Timestamp order_date, Timestamp pay_date, int payment_price, int payment_price_sum, String month, 
			String del_bool, String cancel_bool, String category, String content) {
		super();
		this.order_no = order_no;
		this.item_no = item_no;
		this.id = id;
		this.order_vol = order_vol;
		this.payment_way = payment_way;
		this.payment_bool = payment_bool;
		this.order_date = order_date;
		this.pay_date = pay_date;
		this.payment_price = payment_price;
		this.payment_price_sum = payment_price_sum;
		this.month = month;
		this.del_bool = del_bool;
		this.cancel_bool = cancel_bool;
		this.category = category;
		this.content = content;
	}

	
	


	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getCancel_bool() {
		return cancel_bool;
	}



	public void setCancel_bool(String cancel_bool) {
		this.cancel_bool = cancel_bool;
	}



	public String getDel_bool() {
		return del_bool;
	}



	public void setDel_bool(String del_bool) {
		this.del_bool = del_bool;
	}



	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOrder_vol() {
		return order_vol;
	}

	public void setOrder_vol(int order_vol) {
		this.order_vol = order_vol;
	}

	public String getPayment_way() {
		return payment_way;
	}

	public void setPayment_way(String payment_way) {
		this.payment_way = payment_way;
	}

	public String getPayment_bool() {
		return payment_bool;
	}

	public void setPayment_bool(String payment_bool) {
		this.payment_bool = payment_bool;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public Timestamp getPay_date() {
		return pay_date;
	}

	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}

	public int getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}

	public int getPayment_price_sum() {
		return payment_price_sum;
	}

	public void setPayment_price_sum(int payment_price_sum) {
		this.payment_price_sum = payment_price_sum;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	
}
