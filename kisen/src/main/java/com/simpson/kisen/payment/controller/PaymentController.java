package com.simpson.kisen.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simpson.kisen.idol.controller.IdolController;
import com.simpson.kisen.payment.model.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/basket") 
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private static final String HOST = "https://kapi.kakao.com";
	
	@GetMapping("/cart.do")
	public void cart() {
		
	}
	@GetMapping("/payment.do")
	public void payment() {
		
	}
	@GetMapping("/payComplet.do")
	public void payComplet() {
		
	}
	
	
	
}
