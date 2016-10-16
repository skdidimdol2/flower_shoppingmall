package com.spring.Hit.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.ProductDto;

public interface MemberIDao {
	

	//메인페이지 & 간략한 상품 리스트
	public List<ProductDto> mainDao();
/*
 * 	작성자 : 박종영
 * 	수정일 : 2016.10.3
 */	
	//회원 가입
	public void memberJoinDao(Model model);
	//ID 중복 확인
	public String memberId(Model model);

/*
 * 	작성자 : 이지원
 * 	수정일 : 2016.10.3
 */		
	//회원 정보 보기
	public MemberDto viewMemberDao(String id);
	//회원 정보 수정
	public void updateDao(MemberDto dto);
	//회원 정보 삭제
	public void deleteDao(String id);
	//로그인 정보 체크
	public int checkDao(MemberDto dto);
/*
 * 	작성자 : 전도해
 * 	수정일 : 2016.10.3
 */	
	// 로그인
	public String loginDao(Model model, HttpSession sess);

	
}
