package com.spring.Hit.dto;

import java.sql.Timestamp;
import java.sql.Date;

public class MemberDto {
	private String id;			//���̵�
	private String password;	//��й�ȣ
	private String name;		//�̸�
	private Date birthday;		//����
	private String email;		//�̸���
	private String address;		//�ּ�
	private String phone;		//����ó
	private String gender;		//����
	private int point;			//����Ʈ ����
	private Timestamp joindate;	//������
	private int reply;			//��� ��
	private int review;			//���� ��
	private String admin;		//������ �Ǻ�
	
	public MemberDto(String id, String password, String name, Date birthday, String email, String address, String phone, String gender,
			int point, Timestamp joindate, int reply, int review, String admin ) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.gender = gender;
		this.point = point;
		this.joindate = joindate;
		this.reply = reply;
		this.review = review;
		this.admin = admin;
	}

	public MemberDto() {
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getJoindate() {
		return joindate;
	}

	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}

	public String getAdmin() {
		return admin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

}
