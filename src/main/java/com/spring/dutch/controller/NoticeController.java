package com.spring.dutch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dutch.domain.NoticeVO;
import com.spring.dutch.dto.NoticePagingCreatorDTO;
import com.spring.dutch.dto.NoticePagingDTO;
import com.spring.dutch.service.NoticeService;

@Controller
@RequestMapping("/pages")
public class NoticeController {

	private NoticeService noticeService;
	
	//단일 생성자를 이용한 주입
	public NoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	
	//목록 조회
	@GetMapping("/noticelist")
	public String showNoticeList(NoticePagingDTO noticePaging, Model model) {
		
		NoticePagingCreatorDTO noticeCreator = noticeService.getNoticeList(noticePaging);
		
		model.addAttribute(noticeCreator);
		
		return "pages/noticelist";
	}
	
	//등록페이지 호출
	@GetMapping("/noticeregister")
	//@PreAuthorize("isAuthenticated()")
	public String showNoticeRegisterPage() {
		
		return "pages/noticeregister";
	}
	
	//게시물 등록 처리
	@PostMapping("/noticeregister")
	//@PreAuthorize("isAuthenticated()")
	public String registerNotice(NoticeVO notice, RedirectAttributes redirectAttr) {
		
		long cno = noticeService.registerNotice(notice);
		
		redirectAttr.addFlashAttribute(cno);
		
		return "redirect:/pages/noticelist";
	}
	
	//특정 게시물 조회, 수정 후 조회
	@GetMapping("/noticedetail")
	public String showNoticeDetail(Long cno, Model model, String result,
								   @ModelAttribute("noticePaging") NoticePagingDTO noticePaging) {
		
		NoticeVO notice = null;
		
		notice = noticeService.getNotice(cno, result);
		
		model.addAttribute(notice);
		model.addAttribute(result);
		
		return "pages/noticedetail";
	}
	
	
}
