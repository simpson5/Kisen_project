package com.simpson.kisen.agency.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentExt;

import jline.internal.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("agency")
public class AgencyController_Sales {
	@Autowired
	private AgencyService agencyService;
	
	

	@GetMapping("/agencySales")
	public String agencySales(
		Authentication authentication,
		Model model,
		@RequestParam(name = "searchString", required = false) String searchString,
		@RequestParam(name = "searchOptions", defaultValue = "all") String searchOptions
	) { 
	    Fan loginMember = (Fan) authentication.getPrincipal();
	    Map<String, String> param = new HashMap<String, String>();

	    if(searchString !=null) 
	    	param.put("searchString", searchString);
	    	
    	param.put("searchOption", searchOptions);
    	param.put("fanNo", loginMember.getFanNo());
		//결제 내역 조회
		List<PaymentExt> paymentList = agencyService.selectSalesList(param);
		log.info("paymentList={}",paymentList);
		model.addAttribute("paymentList", paymentList);
		return "agency/agencyPayment_Sales";
	}
	
	@PutMapping("/updateWaybill")
	@ResponseBody
	public String productStockUpdate(
			@RequestBody Payment payment			
		) {
		log.info("pdNo@stockupdate={}",payment);

		int result = agencyService.updateWaybill(payment);
		return payment.getWaybill();
	}
	
	
}
