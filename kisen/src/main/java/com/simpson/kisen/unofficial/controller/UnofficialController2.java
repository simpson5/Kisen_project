package com.simpson.kisen.unofficial.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simpson.kisen.unofficial.model.service.UnOfficialService;
import com.simpson.kisen.unofficial.model.vo.Deposit;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/unofficial")
@Slf4j

public class UnofficialController2 {

	@Autowired
	private UnOfficialService unofficialService; 
	@PostMapping("/depositSubmit")
	public String depositSubmit(@ModelAttribute Deposit deposit) {
		log.info("deposit={}",deposit);
		return "redirect:/unofficial/depositFormlist.do";
	}
	
}
