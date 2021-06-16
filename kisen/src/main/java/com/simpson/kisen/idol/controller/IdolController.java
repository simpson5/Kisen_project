package com.simpson.kisen.idol.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simpson.kisen.idol.model.service.IdolService;
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
	 */
	@Autowired
	private IdolService idolService;
		
	@GetMapping("/mypageArtist.do")
	public void selectOneBoard(@RequestParam int fanNo , Model model) {
		//1. 업무로직 
		IdolImg idolImg = idolService.selectOneIdolCollection(fanNo);
			
		model.addAttribute("idolImg", idolImg);
		
	}
			
}
