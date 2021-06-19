package com.simpson.kisen.idol.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.service.IdolService;
import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.member.controller.MemberController;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/mypage")
@Slf4j
public class IdolController {
	
	/*
	 * @Autowired private ServletContext application;
	 * 
	 * @Autowired private ResourceLoader resourceLoader;
	 * �׸��� controller�ܿ��� idol ��ü�� list�� �߰� �ؼ� view�ܿ� �Ѱ��ֽø� �ɰŰ��ƿ�
	 * 
	 * img������ upload�� ���ڿ��� �ҷ� ���°�
	 */
	@Autowired
	private IdolService idolService;
		
	@GetMapping("/mypageArtist.do")
	public void selectOneBoard(Authentication authentication, Model model
			) {

		Fan principal = (Fan) authentication.getPrincipal();
		model.addAttribute("loginMember", principal);
		
		log.debug("authentication = {}", authentication);
		// authentication = org.springframework.security.authentication.UsernamePasswordAuthenticationToken@23abe407: Principal: Member(id=honggd, password=$2a$10$qHHeJGgQ9teamJyIJFXbyOBtl7nIsQ37VP2jrz89dnDA7LgzS.nYi, name=카길동, gender=M, birthday=2021-05-04, email=honggd@naver.com, phone=01012341234, address=서울시 강남구, hobby=[운동,  등산], enrollDate=2021-05-20, authorities=[ROLE_USER], enabled=true); Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@166c8: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: B95C1041773474D93729781512D4490A; Granted Authorities: ROLE_USER
		log.debug("principal = {}", principal);
	}			
}
