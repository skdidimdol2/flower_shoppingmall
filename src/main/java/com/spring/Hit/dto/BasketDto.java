package com.spring.Hit.dto;

public class BasketDto extends ProductDto{
	private int basket_no;	//��ٱ��� ��ȣ
	private int item_no;	//��ǰ ��ȣ
	private String id;		//���̵�
	private int buy_vol;	//�ֹ� ����
	
	public BasketDto() {
		// TODO Auto-generated constructor stub
	}
	
	public BasketDto(int basket_no, int item_no, String id, int buy_vol) {
		super();
		this.basket_no = basket_no;
		this.item_no = item_no;
		this.id = id;
		this.buy_vol = buy_vol;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	@Override
	public int getItem_no() {
		return item_no;
	}

	@Override
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBuy_vol() {
		return buy_vol;
	}

	public void setBuy_vol(int buy_vol) {
		this.buy_vol = buy_vol;
	}
	
}
