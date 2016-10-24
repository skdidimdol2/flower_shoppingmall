package com.spring.Hit.dto;

public class ZipcodeDto {
	private String address; // 지번주소
	private String lnmAddress; // 도로명주소
	private String zipcode; // 우편번호
	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLnmAddress() {
		return lnmAddress;
	}

	public void setLnmAddress(String lnmAddress) {
		this.lnmAddress = lnmAddress;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	
	
}
