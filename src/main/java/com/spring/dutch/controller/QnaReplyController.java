package com.spring.dutch.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dutch.dto.QnaReplyPagingCreatorDTO;
import com.spring.dutch.dto.QnaReplyPagingDTO;
import com.spring.dutch.service.QnaReplyService;

@RestController
@RequestMapping(value= {"/qnareplies"})
public class QnaReplyController {
	
	private QnaReplyService qnareplyService;
	
	public QnaReplyController(QnaReplyService qnareplyService) {
		this.qnareplyService = qnareplyService;
	}
	
	//게시물에 대한 댓글 목록 조회
	//브라우저 ajax 코드에서 url을 아래처럼 작성
	//http://localhost:8080/dutch/qnareplies/1/page/1
//	@GetMapping(value="/{qno}/page/{pageNum}",
//				produces= {"application/json;charset=utf-8" ,
//						  "application/xml;charset=utf-8"})
//	public ResponseEntity<QnaReplyPagingCreatorDTO>
//				showQnaReplies(@PathVariable("qno") long qno,
//							   @PathVariable("pageNum") Integer pageNum){
//		
//		QnaReplyPagingCreatorDTO qnareplyPagingCreator = 
//				qnareplyService.getReplyList(new QnaReplyPagingDTO(qno, pageNum));
//		
//		ResponseEntity<QnaReplyPagingCreatorDTO> responseEntity = 
//				new ResponseEntity<QnaReplyPagingCreatorDTO>(qnareplyPagingCreator, HttpStatus.OK);
//		
//		return responseEntity; 
//	}
	
	
	
	
}
