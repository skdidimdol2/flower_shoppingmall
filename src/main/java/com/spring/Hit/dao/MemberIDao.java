package com.spring.Hit.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

public interface MemberIDao {
	

	//���������� & ������ ��ǰ ����Ʈ
	public List<ProductDto> mainDao();
	//���������� ���� ����
	public ReviewDto reviewContentDao(Model model, HttpSession sess);
/*
 * 	�ۼ��� : ������
 * 	������ : 2016.10.3
 */	
	//ȸ�� ����
	public void memberJoinDao(Model model);
	//ID �ߺ� Ȯ��
	public String member_Id(String id);
	//ID ã��
	public String idsearch(MemberDto dto) throws Exception;
	//��й�ȣ ã��
	public String pwdsearch(MemberDto dto) throws Exception;
	//��й�ȣ ��������
	public String pwdDao(String id) throws Exception;
	//��й�ȣ �ٲٱ�
	public void resetpwd(MemberDto dto);


/*
 * 	�ۼ��� : ������
 * 	������ : 2016.10.3
 */		
	//ȸ�� ���� ����
	public MemberDto viewMemberDao(String id);
	//ȸ�� ���� ����
	public String updateMemberDao(Model model, HttpSession sess);
	//ȸ�� ���� ����
	public String deleteMemberDao(Model model, HttpSession sess);
	//�α��� ���� üũ
	public int checkDao(MemberDto dto);
/*
 * 	�ۼ��� : ������
 * 	������ : 2016.10.3
 */	
	// �α���
	public String loginDao(Model model, HttpSession sess);

	
}
