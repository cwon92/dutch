package com.spring.dutch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dutch.service.HomeService;


@Controller
public class HomeController {
	
	
	  @Autowired
	  private HomeService homeService;
	  
	  public HomeController(HomeService homeService ) { 
		  this.homeService = homeService; 
		  
	  }
	  
	  @RequestMapping(value = "/", method = RequestMethod.GET) 
	  public String home(Model model) {
	  
	  model.addAttribute("data", homeService.takeLists());
	  
	  
	  return "pages/homePage"; 
	  
	  }
	 
	
	@GetMapping(value = "/admin")
	public String adamin(Model model) {
		System.out.println("관리자 페이지 넘어감");
		model.addAttribute("admin", "여기는 관리자 페이지 입니다.");
		
		
		 
		return "pages/adminPage";
	}
	  
	  
}
