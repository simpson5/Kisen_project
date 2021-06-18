package com.simpson.kisen.fan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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
	private FanService fanService;
	
	@GetMapping("/mypagePay.do")
	public void mypage(){
	
	}
	
		
	@GetMapping("/mypageMember.do")
	public void mypageMember(){
	}
	
	@PostMapping("/updateMypage.do")
	public String updateMypgae (@ModelAttribute Fan fan, @RequestParam String addressExt1,
			@RequestParam String addressExt2, @RequestParam String addressExt3,  
			RedirectAttributes redirectAttr) {
		log.info("수정요청 fan = {}", fan);
		try {
			fan.setAddress(fan.getAddress() + ") " + addressExt1 + addressExt2 + " " + addressExt3);
			//1. 업무로직
			int result = fanService.updateFan(fan);
			if(result == 0)
				throw new IllegalArgumentException("존재하지 않는 회원 정보 : " + fan.getFanNo());
			
			
			//2. 사용자피드백 & 리다이렉트
			redirectAttr.addFlashAttribute("msg", "회원 정보 수정 성공!");
		} catch(Exception e) {
			log.error("회원 정보 수정 오류!", e);
			throw e;
		}
		return "redirect:/mypage/mypageMember.do";
		
	}
	
}
