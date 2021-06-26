package com.simpson.kisen.agency.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;

@Controller
@RequestMapping("agency")
public class AgencyController_Sales {
	@Autowired
	private AgencyService agencyService;
	
	

	@GetMapping("/agencySales")
	public String agencySales(
		Authentication authentication,
		Model model
	) { 
	    Fan loginMember = (Fan) authentication.getPrincipal();

		//결제 내역 조회
		
		return "agency/agencyPayment_Sales";
	}
}
