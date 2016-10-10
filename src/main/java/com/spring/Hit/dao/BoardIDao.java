package com.spring.Hit.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.spring.Hit.dto.BoardDto;

public interface BoardIDao {
	
	//게시판 글 갯수
	public int boardCountDao();
	//게시판 종류 확인하기
	public String boardTName(String tName);
	//게시판 목록보기
	public List<BoardDto> boardDao(Model model);
	//게시판 검색
	public List<BoardDto> boardSearchDao(Model model);
	//게시판 글보기
	public BoardDto boardContentDao(Model model);
	//게시판 글등록
	public int boardWriteDao(Model model);
	//게시판 글 수정 폼
	public BoardDto boardUpdateFormDao(Model model);
	//게시판 글수정
	public int boardUpdateDao(Model model);
	//게시판 글삭제
	public int boardDeleteDao(Model model);
	//게시판 조회수 증가
	public int boardHitsUpDao(Model model);
	//게시판 댓글 리스트 보기
	public List<BoardDto> boardReplyListDao(Model model);
	//게시판 댓글 쓰기
	public int boardReplyWriteDao(Model model);
}
