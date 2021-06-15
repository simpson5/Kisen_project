package com.simpson.kisen.agency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("agency")
public class AgencyController {
	
	@GetMapping("/agencyMain.do")
	public String agencyMain() { return "agency/agencyMain";}
	
	
	
	
	

	@GetMapping("/agencySales")
	public String agencySales() { return "agency/agencyPayment_Sales";}
	
	
	
	
	

	@GetMapping("/agencyProduct")
	public String agencyProduct() { return "agency/agencyProduct/agencyAllProduct";}
	
	@GetMapping("/agencyProductDetail")
	public String agencyProductDetail() { return "agency/agencyProduct/agencyProductDetail";}
	
	@GetMapping("/agencyProductUpdate")
	public String agencyProductUpdate() { return "agency/agencyProduct/agencyProductUpdate";}

	@GetMapping("/agencyProductEnroll")
	public String agencyProductEnroll() { return "agency/agencyProduct/agencyProductEnroll";}
	
	

	@GetMapping("/agencyArtist")
	public String agencyArtist() { return "agency/agencyArtist/agencyArtist";}
	
	@GetMapping("/agencyArtistDetail")
	public String agencyArtistDetail() { return "agency/agencyArtist/agencyArtistDetail";}
	
	@GetMapping("/agencyArtistEnroll")
	public String agencyArtistEnroll() { return "agency/agencyArtist/agencyArtistEnroll";}
	
	@GetMapping("/agencyArtistUpdate")
	public String agencyArtistUpdate() { return "agency/agencyArtist/agencyProductUpdate";}
	
}
