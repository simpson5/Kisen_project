package com.simpson.kisen.unofficial.controller;



import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.unofficial.model.service.UnOfficialService;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialDeposit;

import lombok.extern.slf4j.Slf4j;

/**
 * 비공식굿즈 컨트롤러
 * 
 * 
 */
@Controller
@RequestMapping("/unofficial")
@Slf4j
public class UnofficialController {
	@Autowired
	private ServletContext application;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	UnOfficialService unofficialService; 
	
	

	
	
	

	@GetMapping("/unofficial.do")
	public void unofficial() {
	}

	@GetMapping("/demandFormEnroll.do")
	public void demandFormEnroll() {
	}
	
	@PostMapping("/demandEnroll.do")
	@ResponseBody
	public String demandEnroll(@RequestBody UnofficialDemand unofficialdemand
			) throws Exception {
		log.info("unofficialDemand = {}", unofficialdemand);
		// 업무로직
		int result = unofficialService.insertdemandEnroll(unofficialdemand);
		
		return "redirect:unofficial.do";
	}


	@GetMapping("/depositFormEnroll.do")
	public void depositForm() {
	}
	
	@PostMapping("/depositEnroll.do")
	@ResponseBody
	public String depositEnroll(@RequestBody UnofficialDeposit unofficialdeposit
			) throws Exception {
		log.info("unofficialDeposit = {}", unofficialdeposit);
		// 업무로직
		int result = unofficialService.insertdepositEnroll(unofficialdeposit);
		
		return "redirect:unofficial.do";
	}
	
	



	@GetMapping("/depositDetail.do")
	public void depositDetail() {
	}

	@GetMapping("/demandDetail.do")
	public void demandDetail() {
	}

	@GetMapping("/demandFormlist.do")
	public void demandFormlist() {
	}

	@GetMapping("/depositFormlist.do")
	public void depositFormlist() {
	}
	
	

}
