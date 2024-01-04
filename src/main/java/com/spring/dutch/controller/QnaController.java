package com.spring.dutch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dutch.dto.QnaPagingCreatorDTO;
import com.spring.dutch.dto.QnaPagingDTO;
import com.spring.dutch.service.QnaService;

@Controller
@RequestMapping("/pages")
public class QnaController {
	
	private QnaService qnaService;
	
	//단일 생성자를 이용한 주입
	public QnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	
	//목록조회
	@GetMapping("/qnalist")
	public String ShowQnaList(QnaPagingDTO qnaPaging, Model model) {
		
		QnaPagingCreatorDTO qnaCreator = qnaService.getQnaList(qnaPaging);
		
		model.addAttribute(qnaCreator);
		
		return "pages/qnalist" ;
	}
}
