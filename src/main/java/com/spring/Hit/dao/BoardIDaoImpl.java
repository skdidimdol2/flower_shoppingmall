package com.spring.Hit.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.spring.Hit.dto.BoardDto;

@Repository
public class BoardIDaoImpl implements BoardIDao{
	@Inject
	private SqlSession session;
	
	@Override
	public int boardCountDao() {
		// TODO Auto-generated method stub
		return session.selectOne("boardCountDao");
	}
	
	@Override
	public String boardTName(String tName) {
		// TODO Auto-generated method stub
		if(tName.equals("board_t")){
			tName = "Q&A";
		}else if(tName.equals("reply_t")){
			tName = "¸®ºä";
		}else if(tName.equals("review_t")){
			tName = "´ñ±Û";
		}
		return tName;
	}
	
	@Override
	public List<BoardDto> boardDao(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int strNum = 1;
		if(req.getParameter("strNum")!=null){
			strNum = Integer.parseInt(req.getParameter("strNum"));
		}
		return session.selectList("boardDao", strNum);
	}

	@Override
	public List<BoardDto> boardSearchDao(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		BoardDto dto = new BoardDto();
		dto.setCategory(req.getParameter("type"));
		dto.setContent(req.getParameter("query"));
		return session.selectList("boardSearchDao", dto);
	}
	
	@Override
	public BoardDto boardContentDao(Model model){
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		return session.selectOne("boardContentDao", board_no);
	}

	@Override
	public int boardWriteDao(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String content = req.getParameter("content");	
		BoardDto dto = new BoardDto(0, id, name, title, content, category, 0, 0, 0, 0, new Timestamp(System.currentTimeMillis()/1000));
		
		return session.insert("boardWriteDao", dto);
		
	}

	@Override
	public int boardDeleteDao(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		
		return session.delete("boardDeleteDao", board_no);
	}
	
	@Override
	public BoardDto boardUpdateFormDao(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		return session.selectOne("boardContentDao", board_no);
	}

	@Override
	public int boardUpdateDao(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String category = req.getParameter("category");
		Timestamp post_date = Timestamp.valueOf(req.getParameter("post_date"));
		
		BoardDto dto = new BoardDto(board_no, id, name, title, content, category, 0, 0, 0, 0, post_date);
		
		return session.update("boardUpdateDao", dto);
	}

	@Override
	public int boardHitsUpDao(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		return session.update("boardHitsUpDao", board_no);
	}
	
	@Override
	public List<BoardDto> boardReplyListDao(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		return session.selectList("boardReplyListDao", board_no);
	}

	@Override
	public int boardReplyWriteDao(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String id = "user01";// req.getParameter("id");
		String name = "»ç¿ëÀÚ1";//req.getParameter("name");
		String content = req.getParameter("content");
		int board_group = Integer.parseInt(req.getParameter("board_group"));
		int board_step = Integer.parseInt(req.getParameter("board_step"));
		int board_indent = Integer.parseInt(req.getParameter("board_indent"));
		
		BoardDto dto = new BoardDto(0, id, name, null, content, null, 0, board_group, board_step, board_indent, new Timestamp(System.currentTimeMillis()/1000));
		session.update("boardReplyShapeDao", dto);
		return session.insert("boardReplyWriteDao",dto);
	}




}
