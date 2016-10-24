package com.spring.Hit.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;

public interface AdminIDao {

	// ���� ����ǥ
	public List<OrderDto> totalDao(OrderDto odt);

	// ���� ����ǥ
	public List<OrderDto> monthDao(OrderDto odt);

	// ��ǰ ����Ʈ�� ���
	public List<ProductDto> adminItem(ProductDto pdt);

	// ��ǰ ������ �� ����������
	public ProductDto adminOneitem(int item_no);

	// ��ǰ ����
	public void adminDelitem(int item_no);

	// �Ż�ǰ ���
	public void adminInsitem(ProductDto pdt);

	// ��ǰ ����
	public void adminModitem(ProductDto pdt);

	// �ֹ� ��Ȳ
	public List<OrderDto> vieworder(OrderDto odt);

	// ��� ó��
	public void delsuc(int order_no);

	// ��� �˻�
	// public List<OrderDto> searchorder(OrderDto odt);
	public List<OrderDto> searchDao(Model model);

	// �ֹ� ��
	public List<OrderDto> deliver1(OrderDto odt);

	// �ֹ� ��
	public List<OrderDto> deliver2(OrderDto odt);

	// ȸ�� ����Ʈ
	public List<MemberDto> adminMemberListDao();

	// ȸ�� �˻�
	public List<MemberDto> adminSearchMemberDao(Model model);

	// ȸ�� ����
	public void adminMemberDeleteDao(Model model);

	// ����
	
	public int todayorder(); // Admin Main �ֹ� ��Ȳ 
	
	//��ǰ �� ���� ������ , ��ǰ ��� ����
//	public ProductDto viewDao(int item_no);
	
	//��ǰ �̸����� �˻�
//	public ProductDto searchItem(String item_name);
	
	//��ü ���� ��� 
	//public List<ReviewDto> getReview(int item_no);
	//���� ���
//	public void addReview(ReviewDto rd);
	//���� ����
//	public void updateReview(ReviewDto rd);
	//���� ����
	//public void deleteReview(int item_no);
}