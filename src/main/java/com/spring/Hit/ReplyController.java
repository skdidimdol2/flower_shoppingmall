package com.spring.Hit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.Hit.dto.Criteria;
import com.spring.Hit.dto.PageMaker;
import com.spring.Hit.dto.ReplyDto;
import com.spring.Hit.dao.ReplyDao;
// Rest Controller 라는 것을 주의 !! 
// 웹을 통해서 작업할 때 REST 방식은 Ajax와 같이 결합된 형태이다.
// @PathVariable - URL의 경로에서 원하는 데이터를 추출하는 용도로 사용
// @RequestBody - 전송된 JSON 데이터를 객체로 변환해 주는 에노테이션으로 
// @ModelArrtibute와 유사한 역할을 하지만 JSON에서 사용된다는 점이 차이
// method = RequestMethod.?? -> 등록은 post, 보기는 get, 수정은 put or patch, 삭제는 delete로 이루어짐.

@RestController
@RequestMapping("/product/replies")
public class ReplyController {

	@Inject
	private ReplyDao dao;
	
	// 댓글 등록 
	// ResponseEntity<> 타입으로 리턴해야 한다.
	// = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	// HttpStatus.OK는 정상적으로 처리가 되었다. 그 후, "SUCCESS" 스트링을 보내준다.
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyDto rto) {
		/*
		 * ResponseEntity<String> 의 반환은 댓글 등록에 실패하면 try~catch에 에러의 원인 메시지를 전송하고
		 * 사용자에게는 BAD_REQUEST(400)를 결과로 전송한다.
		 */
		ResponseEntity<String> entity = null;
		try {
			dao.create(rto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
	// 실패했다면 BAD_REQUEST(400)을 전송한다.
			e.printStackTrace();
			
			entity = new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글의 댓글 등록 기능 
	@RequestMapping(value = "/{reply_group}", method = RequestMethod.POST)
	public ResponseEntity<String> rep_register(@RequestBody ReplyDto rto, @PathVariable("reply_group") Integer reply_group) {

		ResponseEntity<String> entity = null;
		try {
			rto.setReply_group(reply_group);
			dao.repupdate(rto);
			dao.repcreate(rto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			entity = new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 전체 댓글 리스트 출력
	@RequestMapping(value = "/all/{item_no}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDto>> list(@PathVariable("item_no") Integer item_no) {

		ResponseEntity<List<ReplyDto>> entity = null;
		try {
			// 위의 등록때와는 달리 전체 list를 전송한다.
			entity = new ResponseEntity<>(dao.list(item_no), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
	// 댓글 수정	
	@RequestMapping(value = "/{reply_no}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("reply_no") Integer reply_no, @RequestBody ReplyDto rto) {

		ResponseEntity<String> entity = null;
		try {
			rto.setReply_no(reply_no);
			dao.update(rto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 삭제
	@RequestMapping(value = "/{reply_no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_no") Integer reply_no) {

		ResponseEntity<String> entity = null;
		try {
			dao.delete(reply_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 보기 + 페이징처리
	@RequestMapping(value = "/{item_no}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("item_no") Integer item_no,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(10);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyDto> list = dao.listPage(item_no, cri);
			
			map.put("list", list);
			
			int replyCount = dao.count(item_no);
			pageMaker.setTotalCount(replyCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 보기 + 페이징처리
		@RequestMapping(value = "/{item_no}", method = RequestMethod.GET)
		public ResponseEntity<Map<String, Object>> listPage(@PathVariable("item_no") Integer item_no) {

			ResponseEntity<Map<String, Object>> entity = null;

			try {
				Criteria cri = new Criteria();
				// perPageNum은 한 화면에 볼 개수
				cri.setPerPageNum(3);

				Map<String, Object> map = new HashMap<String, Object>();
				List<ReplyDto> list = dao.listPage(item_no, cri);

				map.put("list", list);

				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	
}
