package com.spring.dutch.controller;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dutch.domain.MemberVO;
import com.spring.dutch.service.MypageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {

	private MypageService mypageService ;
	
	public MypageController (MypageService mypageService) {
		this.mypageService = mypageService;
	}

	//마이페이지 호출
	@GetMapping("/test")
	public String showMemberData () {
		
		System.out.println("그냥 페이지호출..");
		
		return "pages/mypage";
	}
	
	//인풋창에 mno 넣었을 때 DB가져오기
	@GetMapping(value = "/home" )
	//@PreAuthorize("isAthenticated() && principal.email == #email")
	public String showMemberData (long mno, Model model) {
		
		System.out.println("고객님의 회원번호는 " + mno + " 입니다.");
		
		MemberVO memberData = mypageService.getMemberData(mno);
		model.addAttribute("memberData", memberData);
		
		System.out.println("memberData : " + memberData);
		
		return "/pages/mypage";
	}
	
	
	
	
	
	//더치페이 내역 > 정산 중인 방 호출
	@GetMapping(value = "/ongoing" )
	public String showDutchOngoingList () {
		
		System.out.println("더치페이 내역 > 정산 중인 방");
		
		return "/pages/mypageDutchOngoing";
	}
	
	//더치페이 내역 > 정산 완료 방 호출
	@GetMapping(value = "/history" )
	public String showDutchHistoryList () {
		
		System.out.println("더치페이 내역 > 정산 완료 방");
		
		return "/pages/mypageDutchHistory";
	}
	
	
	
	
	
	//수정 페이지 이동
	@GetMapping(value = "/modify" )
	public String showModify (long mno, Model model) {
		
		System.out.println("마이페이지 > 수정");
		System.out.println("mno 잘 넘어왔나? : " + mno);
		
		MemberVO memberData = mypageService.getMemberData(mno);
		model.addAttribute("memberData", memberData);
		
		System.out.println("memberData : " + memberData);
		
		return "/pages/mypageModify";
	}
	
	//수정된 정보 받아서 DB작업
	@PostMapping(value = "/modify" )
	public String memberModify (MemberVO member, RedirectAttributes redirectAttr) {
		
		System.out.println("화면에서 수정된 member 잘 넘어왔나? : " + member);
		
		
		boolean modifyResult = mypageService.modifyMember(member);
		
		if(modifyResult) {
			redirectAttr.addAttribute("result", "successModify") ;
			
		} else {
			redirectAttr.addAttribute("result", "failModify") ;
		}
		
		redirectAttr.addAttribute("mno", member.getMno()) ;
		redirectAttr.addAttribute("nickname", member.getNickname());
		redirectAttr.addAttribute("bank", member.getBank()) ;
		redirectAttr.addAttribute("bankAccount", member.getBankAccount()) ;
		redirectAttr.addAttribute("username", member.getUsername()) ;
		redirectAttr.addAttribute("email", member.getEmail()) ;
		redirectAttr.addAttribute("password", member.getPassword()) ;
		redirectAttr.addAttribute("hp", member.getHp()) ;
		redirectAttr.addAttribute("cellphone", member.getCellphone()) ;
//		redirectAttr.addAttribute("regDate", member.getRegDate()) ;
//		redirectAttr.addAttribute("modDate", member.getModDate()) ;
		redirectAttr.addAttribute("delFlag", member.getDelFlag()) ;
		redirectAttr.addAttribute("loginType", member.getLoginType()) ;
		redirectAttr.addAttribute("gender", member.getGender()) ;
		redirectAttr.addAttribute("age", member.getAge()) ;
		
		return "redirect:/pages/mypageModify";
	}
	
	
	
	
	

}
