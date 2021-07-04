package com.simpson.kisen.payment.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.simpson.kisen.payment.model.service.PaymentService;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentProduct;
import com.simpson.kisen.product.model.vo.Basket;
import com.simpson.kisen.product.model.vo.ProductImgExt;

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
	public void payment(@RequestParam(value = "bNo") List<String> bNo, @RequestParam String fanNo,
			@RequestParam int total, Authentication authentication, Model model) {
		try {
			Fan principal = (Fan) authentication.getPrincipal();

			log.info("bNo = {}", bNo.toString());
			log.info("total = {}", total);
			// List<Basket> PaymentoptionList = new ArrayList<Basket>();
			// List<Basket> PaymentList = new ArrayList<Basket>();

			List<Basket> basketList = new ArrayList<Basket>();
			for (int i = 0; i < bNo.size(); i++) {
				Basket bb = new Basket();
				String[] array = bNo.get(i).split("-");
				String pdNo = array[0];			
				String opNo = array[1];
				bb.setPdNo(pdNo);
				if (!opNo.equals("0")) {
					bb.setOpNo(Integer.parseInt(opNo));
				}
				log.info("bb = {}", bb);
				basketList.add(bb);
			}

			List<Integer> opNoList = new ArrayList<Integer>();
			List<String> pdNoList = new ArrayList<String>();
			int i=0;
			for (Basket bs : basketList) {
				log.info("bs.getOpNo() = {}", bs.getOpNo());
				opNoList.add(bs.getOpNo());
				pdNoList.add(bs.getPdNo());	
				i++;
			}
			log.info("opNoList = {}", opNoList.toString());
			log.info("pdNoList = {}", pdNoList.toString());



			Map<String, Object> param = new HashMap<>();
			param.put("fanNo", fanNo);
			if (opNoList.size()>0) {
				param.put("opNo", opNoList);
				param.put("pdNo", pdNoList);
				boolean isNull = false;
				for(int j=0 ; j< opNoList.size();j++) {
					int opNo =opNoList.get(j);
					if(opNo== 0)
						isNull = true;
				}
				
				if (isNull) {
					param.put("isNull", true);
				}
				List<Basket> paymentOptionList = paymentService.selectoptionProduct(param);
				model.addAttribute("paymentOptionList", paymentOptionList);
				log.info("paymentOptionList = {}", paymentOptionList);

			} else {
				param.put("pdNo", pdNoList);
				List<Basket> paymentList = paymentService.selectPaymentList(param);
				model.addAttribute("paymentList", paymentList);
				log.info("paymentList = {}", paymentList);
			}

			model.addAttribute("loginMember", principal);
			model.addAttribute("total", total);

			log.info("authentication = {}", authentication);
			log.info("authentication = {}", authentication);

		} catch (Exception e) {
			log.error("장바구니 내역 불러오기 오류!", e);
			throw e;
		}
		
		
		
	}
	
	@GetMapping("/payComplet.do")
	public void payComplet(Authentication authentication, Model model) {
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			
		List<PaymentProduct> historyList = paymentService.selectHistory(principal.getFanNo());
			
			model.addAttribute("loginMember", principal);
		model.addAttribute("historyList",historyList ); 
			
			
			log.info("historyList = {}", historyList);
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
	public String delCart(@RequestParam String [] bNo, @RequestParam String fanNo, @RequestParam int[] opNo, RedirectAttributes redirectAttr) {
		
		try {	
			log.info("bNo = {}",bNo);
			log.info("opNo = {}",opNo);
			Map<String, Object> param = new HashMap<>();
		
			param.put("bNo", bNo);	
			param.put("fanNo", fanNo);
			param.put("opNo",opNo);
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
	
	@PostMapping("delBasket.do")
	public String delBasket(@RequestParam String[] bNo, @RequestParam String fanNo,@RequestParam int[] opNo) {
		
		try {
			log.info("bNo = {}",bNo);
			log.info("opNo = {}",opNo);
			
			Map<String, Object> param = new HashMap<>();
			param.put("bNo", bNo);	
			param.put("fanNo", fanNo);	
			param.put("opNo", opNo);	
			//1. 업무로직
			int result = paymentService.deleteCart(param);
			
		} catch(Exception e) {
			log.error("장바구니 삭제 오류", e);
			throw e;
		}
		return "redirect:/";
	}
	
	@PostMapping("/buyNow.do")
	public String insertBasket(@RequestParam String fanNo, @RequestParam String pdNo, @RequestParam int total,
			@RequestParam(value = "optionList", required = false) int[] optionList, RedirectAttributes redirectAttr
			 ) { 
			
		log.info("optionList={}",Arrays.toString(optionList));
		log.info("optionList null={}",optionList==null);
		log.info("fanNo={}",fanNo);
		log.info("pdNo={}",pdNo);
		log.info("total={}",total);
		List<Basket> basketList = new ArrayList<Basket>();
		List<String> bNo = new ArrayList<String>();
		
		
		if (optionList.length>0) {
			for(int optionNo : optionList) {
				Basket bs = new Basket();
				bs.setFanNo(fanNo);
				bs.setOpNo(optionNo);
				bs.setPdNo(pdNo);
				

				String bNoStr = pdNo+ "-"+optionNo;
				bNo.add(bNoStr);
				basketList.add(bs);
			}
		}
		else {
			Basket bs = new Basket();
			bs.setFanNo(fanNo);
			bs.setPdNo(pdNo);
			String bNoStr = pdNo+ "-" +"0";
			bNo.add(bNoStr);
			log.info("bs={}",bs);
			basketList.add(bs);
		}

		String[] bNoArr = new String[bNo.size()];		
		int size=0;
		for(String temp : bNo){
			bNoArr[size++] = temp;
		}
		log.info("bNoArr={}", Arrays.toString(bNoArr));

		
		int bsket = paymentService.insertBasket(basketList);
		redirectAttr.addAttribute("bNo", bNoArr);
		return "redirect:/basket/payment.do?total="+total;
	}
}
