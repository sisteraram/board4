package org.zerock.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserController {
	
	
	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwEncoder;
	
	
	@GetMapping("/login")
	public void login() {
		log.info("login get......");
	}
	
	
	@GetMapping("/logout")
	public void logoutGET() {
		log.info("custom logout");
	}
	
	
	@GetMapping("/register")
	public void register() {
		log.info("register.........");
	}
	
	
	@PostMapping("/register")
	public String registerPOST(MemberVO vo,RedirectAttributes rttr) {
		String pw=pwEncoder.encode(vo.getUserpw());
		vo.setUserpw(pw);
		
		int result = service.register(vo);
		
		rttr.addAttribute("result",result == 1? "SUCCESS" : "FAIL");
		
		return "redirect:/user/login";
	}

}