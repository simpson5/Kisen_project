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
	
	@Autowired
	private IdolService idolService;
		
	@GetMapping("/mypageArtist.do")
	public void selectOneIdolCollection(Authentication authentication, Model model
			) {
		
		Fan principal = (Fan) authentication.getPrincipal();
		
		List<Idol> idolList = idolService.selectAllIdole();
		List<DipIdol> fan = idolService.selectOneCollection();
		
		model.addAttribute("loginMember", principal);
		model.addAttribute("fan", fan);
		model.addAttribute("idolList", idolList);
		log.info("fan = {}", fan);
		log.info("idolList = {}", idolList);
		
	
	}			
}
