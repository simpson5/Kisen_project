package com.simpson.kisen.fan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.simpson.kisen.fan.model.service.FanService;
import com.simpson.kisen.fan.model.vo.Fan;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
/* @SessionAttributes({"loginMember", "next"}) */
public class MyPageController {
	
	@Autowired
	private FanService fanService;
	
	@GetMapping("/mypageMember.do")
	public String mypageMember(Model model, @RequestParam(name = "fanNo", required = true) int fanNo){
		
		try {
			Fan fan = fanService.selectOneFan(fanNo);
			if (fan == null)
				throw new IllegalArgumentException("존재하지 않는 회원정보 : " + fanNo);
			log.info("fan = {}", fan);
			model.addAttribute("fan", fan);
		} catch (Exception e) {
			log.error("회원 정보수정 페이지 오류!", e);
			throw e;
		}
		return "mypage/mypageMember";
	}
	
	
	
	@GetMapping("/mypagePay.do")
	public void mypage(){
	}
	
}
