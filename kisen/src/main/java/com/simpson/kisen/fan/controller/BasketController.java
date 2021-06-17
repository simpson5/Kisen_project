package com.simpson.kisen.fan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


/**
 * 한글 잘 나올까요?
 * @author moon ju에서 보냅니당
 *
 */
@Controller
@Slf4j
@RequestMapping("/basket")
public class BasketController {
	
	@GetMapping("/cart.do")
	public void cart() {
		//사용자 번호를 가져와서 조회한후 상품테이블과 조인 후 상품 번호가 같다면 리스트로 만들어서 뿌린다.
		//
	}
	@GetMapping("/payment.do")
	public void payment() {
		
	}
	@GetMapping("/payComplet.do")
	public void payComplet() {
		
	}
	
	
}
