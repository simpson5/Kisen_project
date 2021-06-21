package com.simpson.kisen.fan.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.fan.model.service.FanService;
import com.simpson.kisen.fan.model.vo.Fan;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
@SessionAttributes({"loginMember", "principal"})


public class MyPageController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private FanService fanService;
	
	@GetMapping("/mypagePay.do")
	public void mypage(Authentication authentication, Model model){
		Fan principal = (Fan) authentication.getPrincipal();
		model.addAttribute("loginMember", principal);
		
		log.debug("authentication = {}", authentication);
		// authentication = org.springframework.security.authentication.UsernamePasswordAuthenticationToken@23abe407: Principal: Member(id=honggd, password=$2a$10$qHHeJGgQ9teamJyIJFXbyOBtl7nIsQ37VP2jrz89dnDA7LgzS.nYi, name=카길동, gender=M, birthday=2021-05-04, email=honggd@naver.com, phone=01012341234, address=서울시 강남구, hobby=[운동,  등산], enrollDate=2021-05-20, authorities=[ROLE_USER], enabled=true); Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@166c8: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: B95C1041773474D93729781512D4490A; Granted Authorities: ROLE_USER
		log.debug("principal = {}", principal);
	}
	
	
		
	@GetMapping("/mypageMember.do")
	public void mypageMember(Authentication authentication, Model model){
		Fan principal = (Fan) authentication.getPrincipal();
		model.addAttribute("loginMember", principal);
		
		log.debug("authentication = {}", authentication);
		// authentication = org.springframework.security.authentication.UsernamePasswordAuthenticationToken@23abe407: Principal: Member(id=honggd, password=$2a$10$qHHeJGgQ9teamJyIJFXbyOBtl7nIsQ37VP2jrz89dnDA7LgzS.nYi, name=카길동, gender=M, birthday=2021-05-04, email=honggd@naver.com, phone=01012341234, address=서울시 강남구, hobby=[운동,  등산], enrollDate=2021-05-20, authorities=[ROLE_USER], enabled=true); Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@166c8: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: B95C1041773474D93729781512D4490A; Granted Authorities: ROLE_USER
		log.debug("principal = {}", principal);
	}
	
	@PostMapping("/updateMypage.do")
	public String updateMypgae (@ModelAttribute Fan updateFan, @RequestParam String addressExt1,
			@RequestParam String addressExt2, @RequestParam String addressExt3,Authentication oldAuthentication,
			RedirectAttributes redirectAttr) {
		log.info("수정요청 fan = {}", updateFan);
		try {
			String rawPassword = updateFan.getPassword();
			String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
			// member에 암호화된 비밀번호 다시 세팅
			updateFan.setPassword(encodedPassword);
			updateFan.setAddress(updateFan.getAddress() + ") " + addressExt1 + addressExt2 + " " + addressExt3);
				
			Collection<? extends GrantedAuthority> oldAuthorities = 
						oldAuthentication.getAuthorities();
			
			List<SimpleGrantedAuthority> authorities = new ArrayList<>();
			for(GrantedAuthority auth : oldAuthorities) {
					SimpleGrantedAuthority simpleAuth = 
						new SimpleGrantedAuthority(auth.getAuthority());
		      // 문자열을 인자로 auth객체생성 
					authorities.add(simpleAuth);
				}
			
			updateFan.setAuthorities(authorities);
			
			log.info("담긴내용 -fan = {}", updateFan);
			int result = fanService.updateFan(updateFan);
				
				//새로운 authentication객체 생성
				Authentication newAuthentication = 
						new UsernamePasswordAuthenticationToken(
								updateFan,
								oldAuthentication.getCredentials(),
								oldAuthentication.getAuthorities()
								);
				log.info("담긴내용 -Authentication = {}", newAuthentication);
				//SecurityContextHolder - SecurityContext 하위에 설정
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		} catch(Exception e) {
			log.error("회원 정보 수정 오류!", e);
			throw e;
		}
		return "redirect:/mypage/mypageMember.do";
		
	}
	
	@PostMapping("/deleteFan.do")
	public String deleteFan(@RequestParam String fanId, RedirectAttributes redirectAttr, Authentication oldAuthentication) {
		try {
		
			log.info("fanId={}",fanId);
		
			//1. 업무로직
			int result = fanService.deleteFan(fanId);
		
	//2. 사용자피드백 
			redirectAttr.addFlashAttribute("msg", "회원 탈퇴 성공!");
		} catch(Exception e) {
			log.error("회원 탈퇴 오류!", e);
			throw e;
		}
		return "redirect:/member/logout.do";
	}
	
	
}
