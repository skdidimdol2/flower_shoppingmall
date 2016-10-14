package com.spring.Hit;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Hit.dao.BoardIDao;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardIDao dao;
	
	//게시판 목록보기
	@RequestMapping("/boardList")
	public String board(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		model.addAttribute("list", dao.boardDao(model));	//데이터 리스트
		model.addAttribute("count", dao.boardCountDao());	//페이징 처리
	//	model.addAttribute("tableName",dao.boardTName(req.getParameter("tName")));
		
		return "/board/board";
	}
	//게시판 검색
	@RequestMapping("/boardSearch")
	public String boardSearch(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("list", dao.boardSearchDao(model));//제목,내용,작성자로 검색
		return "/board/board";
	}
	
	//게시판 글보기 & 게시판 조회수 증가 & 댓글 리스트 보기
	@RequestMapping("/boardContent")
	public String boardContent(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		dao.boardHitsUpDao(model);	//조회수 증가
		model.addAttribute("dto", dao.boardContentDao(model));
		model.addAttribute("list", dao.boardReplyListDao(model));
		
		return "/board/boardContent";
	}
	//게시글 폼 열기
	@RequestMapping("/boardWriteForm")
	public String boardWriteForm(Model model, HttpSession sess) {
		
		return "/board/boardWriteForm";
	}
	
	//게시판 글등록
	@RequestMapping("/boardWrite")
	public String boardWrite(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);		//req를 DAO에서 사용하기 위해서 model에 담는다.
		model.addAttribute("num", dao.boardWriteDao(model));//DAO를 호출해서 반환된 값을 model에 다시 담아서 jsp에서 판단하는 값으로 사용한다.
		
		return "/board/boardWriteForm";
	}
	//게시판 글 수정 폼
	@RequestMapping("/boardUpdateForm")
	public String boardUpdateForm(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);		//req를 DAO에서 사용하기 위해서 model에 담는다.
		model.addAttribute("dto", dao.boardUpdateFormDao(model));//DAO를 호출해서 반환된 값을 model에 다시 담아서 jsp에서 판단하는 값으로 사용한다.
		
		return "/board/boardUpdateForm";
	}
	//게시판 글수정
	@RequestMapping("/boardUpdate")
	public String boardUpdate(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);		//req를 DAO에서 사용하기 위해서 model에 담는다.
		model.addAttribute("num", dao.boardUpdateDao(model));//DAO를 호출해서 반환된 값을 model에 다시 담아서 jsp에서 판단하는 값으로 사용한다.
		
		return "/board/boardUpdateForm";
	}
	//게시판 글삭제
	@RequestMapping("/boardDelete")
	public String boardDelete(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);		//req를 DAO에서 사용하기 위해서 model에 담는다.
		model.addAttribute("num", dao.boardDeleteDao(model));//DAO를 호출해서 반환된 값을 model에 다시 담아서 jsp에서 판단하는 값으로 사용한다.
		
		return "redirect:boardList";
	}
	//게시판 댓글 쓰기
	@RequestMapping("/boardReplyWrite")
	public String boardReplyWrite(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);		//req를 DAO에서 사용하기 위해서 model에 담는다.
		dao.boardReplyWriteDao(model);		//DAO를 호출해서 반환된 값을 model에 다시 담아서 jsp에서 판단하는 값으로 사용한다.
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		return "redirect:boardContent?board_no="+board_no;
	}
	
}
