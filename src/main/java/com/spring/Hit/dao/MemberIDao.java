package com.spring.Hit.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

public interface MemberIDao {
	

	//메인페이지 & 간략한 상품 리스트
	public List<ProductDto> mainDao();
	//마이페이지 리뷰 보기
	public ReviewDto reviewContentDao(Model model, HttpSession sess);
/*
 * 	작성자 : 박종영
 * 	수정일 : 2016.10.3
 */	
	//회원 가입
	public void memberJoinDao(Model model);
	//ID 중복 확인
	public String member_Id(String id);
	//ID 찾기
	public String idsearch(MemberDto dto) throws Exception;
	//비밀번호 찾기
	public String pwdsearch(MemberDto dto) throws Exception;
	//비밀번호 가져오기
	public String pwdDao(String id) throws Exception;
	//비밀번호 바꾸기
	public void resetpwd(MemberDto dto);


/*
 * 	작성자 : 이지원
 * 	수정일 : 2016.10.3
 */		
	//회원 정보 보기
	public MemberDto viewMemberDao(String id);
	//회원 정보 수정
	public String updateMemberDao(Model model, HttpSession sess);
	//회원 정보 삭제
	public String deleteMemberDao(Model model, HttpSession sess);
	//로그인 정보 체크
	public int checkDao(MemberDto dto);
/*
 * 	작성자 : 전도해
 * 	수정일 : 2016.10.3
 */	
	// 로그인
	public String loginDao(Model model, HttpSession sess);

	
}
