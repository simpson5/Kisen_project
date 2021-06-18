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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	 * 그리고 controller단에서 idol 객체를 list에 추가 해서 view단에 넘겨주시면 될거같아요
	 * 
	 * img파일은 upload에 문자열로 불러 오는것
	 */
	@Autowired
	private IdolService idolService;
		
	@GetMapping("/mypageArtist.do")
	public void selectOneBoard(@RequestParam int fanNo, Model model
			) {
		//1. 업무로직 
		DipIdol dipidol = idolService.selectOneIdolCollection(fanNo);
		
		//2. 객체에 저장된 파일 담기	
		List<DipIdol> idolList = new ArrayList<>();
		idolList.add(dipidol);
		
		model.addAttribute("dipidol",idolList);
		
	}			
}
