package com.spring.Hit.dto;

import java.sql.Timestamp;

public class ProductDto {
	private int item_no;
	private String item_name;
	private String category; 
	private int price;
	private int volume;
	private String img;
	private String item_content;
	private Timestamp reg_date;
	
	public ProductDto() {
		// TODO Auto-generated constructor stub
	}

	public ProductDto(int item_no, String item_name, String category, int price, int volume, String img,
			String item_content, Timestamp reg_date) {
		this.item_no = item_no;
		this.item_name = item_name;
		this.category = category;
		this.price = price;
		this.volume = volume;
		this.img = img;
		this.item_content = item_content;
		this.reg_date = reg_date;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String getItem_content() {
		return item_content;
	}

	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ProductDto [item_no=" + item_no + ", item_name=" + item_name + ", category=" + category + ", price="
				+ price + ", volume=" + volume + ", img=" + img + ", item_content=" + item_content + ", reg_date="
				+ reg_date + "]";
	}

	
}
