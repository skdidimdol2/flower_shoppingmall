package com.spring.Hit.dao;

import java.util.List;

import com.spring.Hit.dto.Criteria;
import com.spring.Hit.dto.ReplyDto;

public interface ReplyDao {
	//댓글 전체 리스트 보기
	public List<ReplyDto> list(Integer bno) throws Exception;
	//댓글 추가
	public void create(ReplyDto rto) throws Exception;
	//대댓글 추가
	public void repcreate(ReplyDto rto) throws Exception;
	//대댓글 업데이트
	public void repupdate(ReplyDto rto) throws Exception;
	//댓글 수정
	public void update(ReplyDto rto) throws Exception;
	//댓글 삭제
	public void delete(Integer rno) throws Exception;
	//댓글보기+페이징처리
	public List<ReplyDto> listPage(Integer bno, Criteria cri) throws Exception;
	//상품 숫자 추출
	public int count(Integer bno) throws Exception;
	//상품번호 추출
	public int getItemNo(Integer rno) throws Exception;

}
