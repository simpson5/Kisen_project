package com.simpson.kisen.fan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
public class MyPageController {
	
	@GetMapping("/mypage_pay.do")
	public void mypage(){
	}
	@GetMapping("/mypage_artist.do")
	public void mypageArtist(){
	}
	@GetMapping("/mypage_member.do")
	public void mypageMember(){
	}
}
