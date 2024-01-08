package com.spring.dutch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dutch.dto.DutchBoardPagingCreatorDTO;
import com.spring.dutch.dto.DutchBoardPagingDTO;
import com.spring.dutch.dto.DutchGroupNicknameDTO;
import com.spring.dutch.dto.DutchRegisterPagingCreatorDTO;
import com.spring.dutch.dto.DutchRegisterPagingDTO;
import com.spring.dutch.domain.DutchBoardVO;
import com.spring.dutch.domain.MemberVO;
import com.spring.dutch.service.DutchBoardService;

@Controller
@RequestMapping("/pages")
public class DutchBoardController {

	  private DutchBoardService dutchBoardService ;

	  @Autowired
	  public DutchBoardController(DutchBoardService dutchBoardService) {
	  this.dutchBoardService = dutchBoardService ;
	  System.out.println("DutchBoardController의 모든 필드 초기화 생성자 입니다."); 

	  }


	//더치페이 목록 조회
	@GetMapping("/dutchlist") 
	public String showBoardList(DutchBoardPagingDTO dutchboardPaging, Model model) { 

	    DutchBoardPagingCreatorDTO pagingCreator = dutchBoardService.getDutchList(dutchboardPaging);

	  model.addAttribute("pagingCreator", pagingCreator);

	  return "pages/dutchlist"; 
	}

	//더치페이 게시물 페이지 호출
	@GetMapping("/dutchregister")
	public String showBoardRegisterPage(DutchRegisterPagingDTO dutchRegisterPaging,
			                            MemberVO member,Model model) {
		
		DutchRegisterPagingCreatorDTO pagingCreator = dutchBoardService.getAllMembers(dutchRegisterPaging);
		//member = dutchBoardService.selectDutchNickname(2);
		model.addAttribute("pagingCreator", pagingCreator);
		//model.addAttribute("member", member);

		return "pages/dutchregister";
	}

	//더치페이 등록 처리
	@PostMapping("/dutchregister")
	public String registerNewBoard(DutchBoardVO dutchBoard, String nicknames, String nicknames2, String nicknames3, String nicknames4, 
								   DutchGroupNicknameDTO dutchGroupNicknameDTO,
			                       RedirectAttributes redirectAttr, Model model) {

			
		dutchGroupNicknameDTO.setNicknames(nicknames);
		dutchGroupNicknameDTO.setNicknames2(nicknames2);
		dutchGroupNicknameDTO.setNicknames3(nicknames3);
		dutchGroupNicknameDTO.setNicknames4(nicknames4);
		
		System.out.println("setNicknames: " + dutchGroupNicknameDTO.getNicknames());
		System.out.println("setNicknames2: " + dutchGroupNicknameDTO.getNicknames2());
		System.out.println("setNicknames3: " + dutchGroupNicknameDTO.getNicknames3());
		System.out.println("setNicknames4: " + dutchGroupNicknameDTO.getNicknames4());
		
		long pno = dutchBoardService.DutchregisterBoard(dutchBoard);

		redirectAttr.addFlashAttribute("result", pno);
		
		System.out.println("result : " + pno);
//		System.out.println("nicknames : " + nicknames);
//		System.out.println("nicknames2 : " + nicknames2);
		
		return "redirect:/pages/dutchlist" ;

	}

	//특정 더치페이 게시물 조회 페이지 or 수정 후 조회 페이지
	@GetMapping("/dutchdetail")
	public String showDutchBoardDetail(Long pno, Model model, DutchGroupNicknameDTO dutchGroupNicknameDTO,
			                           @ModelAttribute("dutchboardPaging") 
	                                   DutchBoardPagingDTO dutchboardPaging) {

		DutchBoardVO dutchboard = null ;
		
		String nicknames = dutchGroupNicknameDTO.getNicknames();
		
		String nicknames2 = dutchGroupNicknameDTO.getNicknames2();
		
		String nicknames3 = dutchGroupNicknameDTO.getNicknames3();
		
		String nicknames4 = dutchGroupNicknameDTO.getNicknames4();

		dutchboard = dutchBoardService.getDutchBoard(pno);
		
		dutchGroupNicknameDTO = dutchBoardService.registerNicknames(nicknames, nicknames2, nicknames3, nicknames4);

		model.addAttribute("dutchboard", dutchboard);

		model.addAttribute("dutchGroupNicknameDTO", dutchGroupNicknameDTO);
		
		System.out.println("model: " + model);

		return "pages/dutchdetail";
	}

	//더치페이 수정 페이지 호출
	@GetMapping("/dutchmodify")
	public String showDutchModify(Long pno, Model model, @ModelAttribute("dutchboardPaging") DutchBoardPagingDTO myBoardPaging) {
		
		DutchBoardVO dutchboard = dutchBoardService.getDutchBoard2(pno); //getBoard : 게시물 호출
		
		model.addAttribute("dutchboard", dutchboard);
		
		return "pages/dutchmodify";
	}
	
	//더치페이 게시물 수정
	@PostMapping("/dutchmodify")
	public String modifyBoard(DutchBoardVO dutchboard, 
			                  RedirectAttributes redirectAttr,
			                  DutchBoardPagingDTO dutchBoardPaging) {
		
		boolean modifyResult = dutchBoardService.modifyBoard(dutchboard);
		
		if(modifyResult) {
		redirectAttr.addAttribute("result", "successModify") ;
		
		} else {
		redirectAttr.addAttribute("result", "failModify") ;
		}
		
 		redirectAttr.addAttribute("pno", dutchboard.getPno()) ;
		redirectAttr.addAttribute("pageNum", dutchBoardPaging.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", dutchBoardPaging.getRowAmountPerPage()) ;

		
		
		return "redirect:/pages/dutchdetail";
	}
	
	//더치페이 게시물 삭제 
	@PostMapping("/remove")
	public String removeBoard(DutchBoardVO dutchboard, RedirectAttributes redirectAttr,
			                 DutchBoardPagingDTO dutchBoardPaging) {
		
		
		  boolean removeResult = dutchBoardService.removeBoard(dutchboard.getPno());
		  
		  if(dutchBoardService.removeBoard(dutchboard.getPno())) {
		  redirectAttr.addFlashAttribute("result", "successRemove"); } else {
		  redirectAttr.addFlashAttribute("result", "failRemove"); }
		  
		  redirectAttr.addAttribute("pageNum", dutchBoardPaging.getPageNum()) ;
		  redirectAttr.addAttribute("rowAmountPerPage",
		  dutchBoardPaging.getRowAmountPerPage()) ;
		 
		
		
		return "redirect:/pages/dutchlist";
	}
	
	
	
	
	
	
	
	
	
	
	

}
