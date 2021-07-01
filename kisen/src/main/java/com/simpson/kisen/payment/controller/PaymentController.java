package com.simpson.kisen.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.controller.IdolController;
import com.simpson.kisen.payment.model.service.PaymentService;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentProduct;
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
	public void payment(@RequestParam String[] bNo, @RequestParam int total,Authentication authentication, Model model ) {
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			log.info("bNo = {}",bNo);
			log.info("total = {}",total);
			
			Map<String, Object> param = new HashMap<>();
			param.put("bNo", bNo);
			
			List<Basket> PaymentList = paymentService.selectPaymentList(param);
			
			model.addAttribute("loginMember", principal);
			model.addAttribute("PaymentList", PaymentList);
			model.addAttribute("total", total);
	
			log.info("authentication = {}", authentication);
			log.info("principal = {}", principal);
			log.info("PaymentList = {}", PaymentList);
		} catch (Exception e) {
			log.error("장바구니 내역 불러오기 오류!", e);
			throw e;
		}
	}
	@GetMapping("/payComplet.do")
	public void payComplet() {
		
	}
	@PostMapping("/insertPay.do")
	public String insertPay(@RequestParam String[] pdNoo,
			@RequestParam int[] opNoo, @RequestParam int total, @RequestParam int sumA,
			@RequestParam String fNo, @RequestParam String ptype,							  
			RedirectAttributes redirectAttr) {
		try {
			log.info("pdNoo = {}",pdNoo);
			log.info("opNoo = {}",opNoo);
			log.info("fNo = {}",fNo);
			log.info("total = {}",total);
			log.info("sumA = {}",sumA);
			log.info("ptype = {}",ptype);
			
			PaymentProduct pp = new PaymentProduct();
			pp.setFanNo(fNo);
//			pp.setOpNo(opNoo);
//			pp.setPdNo(pdNoo);
			// 아하 슬슬 이해된다
			
			
			log.info("pp = {}",pp);
			
			
			 List<PaymentProduct> pList = new ArrayList<PaymentProduct>();
			 pList.add(pp);
			 
			 
			Payment payHistory = new Payment();
			payHistory.setPrice(total);
			payHistory.setAmount(sumA);
			payHistory.setFanNo(fNo);
			payHistory.setPayType(ptype);
			
			Map<String, Object> param = new HashMap<>();
			param.put("payHistory", payHistory);
			param.put("pp", pp);
			
			log.info("param= {}",param);
			
			
			int result = paymentService.insertPayment(param);
			
		} catch (Exception e) {
			log.error("선택상품 삭제 오류!", e);
			throw e;
		}
		return "redirect:/basket/payComplet.do";
	}
	
	
	@PostMapping("/delCart.do")
	public String delCart(@RequestParam String [] bNo, RedirectAttributes redirectAttr) {
		
		try {
			log.info("bNo = {}",bNo);
			
			Map<String, Object> param = new HashMap<>();
			param.put("bNo", bNo);	
			//1. 업무로직
			int result = paymentService.deleteCart(param);
		
	//2. 사용자피드백 
			redirectAttr.addFlashAttribute("msg", "선택상품 삭제 성공!");
		} catch(Exception e) {
			log.error("선택상품 삭제 오류!", e);
			throw e;
		}
		return "redirect:/basket/cart.do";
	}
	
}
