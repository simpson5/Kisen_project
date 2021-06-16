package com.simpson.kisen.fan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.simpson.kisen.fan.model.service.FanService;
import com.simpson.kisen.fan.model.vo.Fan;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
@SessionAttributes({"loginMember", "next"})
public class MyPageController {
	
	@Autowired
	private FanService fanService;
	
	@GetMapping("/mypageMember.do")
	public ModelAndView mypageMember(ModelAndView mav, @SessionAttribute(name = "loginMember") Fan loginMember){
		log.info("loginMember = {}", loginMember);
		
		//속성 저장
		mav.addObject("time", System.currentTimeMillis());
		//viewName 설정
		mav.setViewName("mypage/mypageMember");
		return mav;

	}
	
	
	
	@GetMapping("/mypagePay.do")
	public void mypage(){
	}
	
}
