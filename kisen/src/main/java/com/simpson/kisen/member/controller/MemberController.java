package com.simpson.kisen.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@GetMapping("/login.do")
	public void login() {}
	
	@GetMapping("/signupTerm.do")
	public void signupTerm() {}
	
	@GetMapping("/signup.do")
	public void signup() {}
	
	@GetMapping("/searchId.do")
	public void searchId() {}

}