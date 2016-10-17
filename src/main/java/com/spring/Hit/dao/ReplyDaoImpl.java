package com.spring.Hit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.spring.Hit.dto.Criteria;
import com.spring.Hit.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Inject
	private SqlSession session;

	private static String namespace = "com.spring.Hit.dao.ReplyDao";

	// 댓글 리스트
	@Override
	public List<ReplyDto> list(Integer item_no) throws Exception {

		return session.selectList(namespace + ".list", item_no);
	}

	// 댓글 생성
	@Override
	public void create(ReplyDto rdt) throws Exception {
		session.insert(namespace + ".create", rdt);
	}

	// 대댓글 생성
	@Override
	public void repcreate(ReplyDto rdt) throws Exception {
		session.insert(namespace + ".repcreate", rdt);
	}

	// 대댓글 업데이트
	@Override
	public void repupdate(ReplyDto rdt) throws Exception {
		session.update(namespace + ".repupdate", rdt);
	}

	// 댓글 수정
	@Override
	public void update(ReplyDto rdt) throws Exception {
		session.update(namespace + ".update", rdt);
	}

	// 댓글 삭제
	@Override
	public void delete(Integer reply_no) throws Exception {

		session.delete(namespace + ".delete", reply_no);
	}

	// 댓글 리스트 & 페이징처리
	@Override
	public List<ReplyDto> listPage(Integer item_no, Criteria cri) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("item_no", item_no);
		paramMap.put("cri", cri);

		return session.selectList(namespace + ".listPage", paramMap);
	}

	// 상품번호(item_no) 수
	@Override
	public int count(Integer item_no) throws Exception {

		return session.selectOne(namespace + ".count", item_no);
	}

	// 상품번호 추출
	@Override
	public int getItemNo(Integer reply_no) throws Exception {
		return session.selectOne(namespace + ".getItemNo", reply_no);
	}

	// 경희
	@Override
	public int replyCountDao() {
		return session.selectOne("replyCountDao");
	}

	@Override
	public List<ReplyDto> replyAllList(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int strNum = 1;
		if (req.getParameter("strNum") != null) {
			strNum = Integer.parseInt(req.getParameter("strNum"));
		}
		return session.selectList("replyList", strNum);
	}

	@Override
	public List<ReplyDto> replyDtail(int reply_group) {
		return session.selectList("replyDtail", reply_group);
	}

}
