package com.simpson.kisen.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.controller.IdolController;
import com.simpson.kisen.payment.model.service.PaymentService;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.product.model.vo.Basket;

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
	public void cart(Authentication authentication, Model model) {
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			
		List<Basket> basketList = paymentService.selectBasketList(principal.getFanNo());
			
			model.addAttribute("loginMember", principal);
		model.addAttribute("basketList", basketList);
			
			
			log.info("basketList = {}", basketList);
			log.info("authentication = {}", authentication);
			log.info("principal = {}", principal);
		} catch (Exception e) {
			log.error("장바구니 내역 불러오기 오류!", e);
			throw e;
		}
	}
	
	@GetMapping("/payment.do")
	public void payment(Authentication authentication, Model model) {
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			model.addAttribute("loginMember", principal);
			log.info("authentication = {}", authentication);
			log.info("principal = {}", principal);
		} catch (Exception e) {
			log.error("장바구니 내역 불러오기 오류!", e);
			throw e;
		}
	}
	@GetMapping("/payComplet.do")
	public void payComplet() {
		
	}
	
	
	
}
