package com.simpson.kisen.payment.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
	
	@GetMapping("/cart.do")
	public void cart(Authentication authentication, Model model) {
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			
		List<Basket> basketList = paymentService.selectBasketList(principal.getFanNo());
			
			model.addAttribute("loginMember", principal);
		model.addAttribute("basketList", basketList); //그냥 이렇게.. 팬 번호 랑 엮어서 조회햇습니당
			
			
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
			log.info("total = {}",total); //여기가 그 결제 부분인데 이부분에는 그 저 pdno가 필요해서 아마 아까 그부분에서 리다이렉트로 넘길때 pdno를 같이 보내야 할거 같..ㅅ비다
			//장바구니 insert는 없나요?그거 지금 원영님이...하시는줄 알았는데 아니더라구요 제가 해야 한다고 해서 
			
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
	public void payComplet(Authentication authentication, Model model) {
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			
		List<Payment> paymentList = paymentService.selectAllList(principal.getFanNo());
			
			model.addAttribute("loginMember", principal);
		model.addAttribute("paymentList",paymentList ); //그냥 이렇게.. 팬 번호 랑 엮어서 조회햇습니당
			
			
			log.info("paymentList = {}", paymentList);
			log.info("authentication = {}", authentication);
			log.info("principal = {}", principal);
		} catch (Exception e) {
			log.error("장바구니 내역 불러오기 오류!", e);
			throw e;
		}
	}
	
	@PostMapping("/insertPay.do")
	public String insertPay(@RequestParam int[] pdNoo,
			@RequestParam(value = "opNoo") List<String> opNoo, @RequestParam int total, @RequestParam int sumA,
			@RequestParam String fanNo, @RequestParam String ptype,							  
			RedirectAttributes redirectAttr) {
		try {
			log.info("pdNoo = {}",pdNoo);
			log.info("opNoo = {}",opNoo.toString());
			log.info("fNo = {}",fanNo);
			log.info("total = {}",total);
			log.info("sumA = {}",sumA);
			log.info("ptype = {}",ptype);
		
					
			List<PaymentProduct> pList = new ArrayList<PaymentProduct>();
			for(int i=0 ;i< opNoo.size() ;i++) {
				PaymentProduct pp = new PaymentProduct();
				pp.setFanNo(fanNo);
				
				String[] array = opNoo.get(i).split("-");
				String pdNo = array[0];
				String opNo = array[1];
				pp.setPdNo(pdNo);
				if (!opNo.equals("0")) {
					pp.setOpNo(Integer.parseInt(opNo)); 
				}
				pList.add(pp);
			}
			
			
			Payment payHistory = new Payment();
			payHistory.setPrice(total);
			payHistory.setAmount(sumA);
			payHistory.setFanNo(fanNo);
			payHistory.setPayType(ptype);
			 
			
			Map<String, Object> param = new HashMap<>();
			param.put("payHistory", payHistory);
			param.put("pList", pList);
			
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
	
	@PostMapping("/buyNow.do")
	public String insertBasket(@RequestParam String fanNo, @RequestParam String pdNo,
			@RequestParam int cnt, @RequestParam int opNo,RedirectAttributes redirectAttr
			 ) { 
			
			Basket bs = new Basket();
			bs.setFanNo(fanNo);
			bs.setOpNo(opNo);
			bs.setPdNo(pdNo);
			bs.setPdAmount(cnt);
		
			int bsket = paymentService.insertBasket(bs);
		
			redirectAttr.addFlashAttribute("msg", "선택상품 삭제 성공!");
		return null;
	}
}
