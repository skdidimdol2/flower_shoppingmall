package com.spring.Hit.dto;

import java.sql.Timestamp;

public class BoardDto {
	private int board_no;
	private String id;
	private String name;
	private String title;
	private String content;
	private String category;
	private int hits;
	private int board_group;	//원글이 위로 올라오게 desc
	private int board_step;	//먼저 작성된 글이 위로 올라오게 asc
	private int board_indent;//들여쓰기
	private Timestamp post_date;
	
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardDto(int board_no, String id, String name, String title, String content, String category, int hits,
			int board_group, int board_step, int board_indent, Timestamp post_date) {
		super();
		this.board_no = board_no;
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.category = category;
		this.hits = hits;
		this.board_group = board_group;	//글 그룹, 원글이 위로 올라오게 desc
		this.board_step = board_step;	//댓글, 먼저 작성된 글이 위로 올라오게 asc
		this.board_indent = board_indent;//들여쓰기
		this.post_date = post_date;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}
	
	public int getBoard_group() {
		return board_group;
	}

	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}

	public int getBoard_step() {
		return board_step;
	}

	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}

	public int getBoard_indent() {
		return board_indent;
	}

	public void setBoard_indent(int board_indent) {
		this.board_indent = board_indent;
	}

	public Timestamp getPost_date() {
		return post_date;
	}

	public void setPost_date(Timestamp post_date) {
		this.post_date = post_date;
	}

}
