package com.simpson.kisen.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 관리자 컨트롤러
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/adminMain")
	public void adminMain() {}
	
	@GetMapping("/adminProduct")
	public String adminProduct() { return "admin/adminProduct/adminAllProduct";}

	@GetMapping("/adminProductDetail")
	public String adminProductDetail() { return "admin/adminProduct/adminProductDetail";}
	
	@GetMapping("/adminProductUpdate")
	public String adminProductUpdate() { return "admin/adminProduct/adminProductUpdate";}
	
	

	@GetMapping("/adminMember")
	public String adminMember() { return "admin/adminMember/adminMember";}

	@GetMapping("/adminArtistDetail")
	public String adminArtistDetail() { return "admin/adminMember/adminArtistDetail";}
	
	@GetMapping("/adminArtistUpdate")
	public String adminArtistUpdate() { return "admin/adminMember/adminArtistUpdate";}
	
	
	
	

	@GetMapping("/adminSales")
	public String adminSales() { return "admin/adminPayment_Sales";}
	
	
	

	@GetMapping("/adminNotice")
	public String adminNotice() { return "admin/adminNotice/adminNotice";}
	
	@GetMapping("/adminSlideImgUpdate")
	public String adminSlideImgUpdate() { return "admin/adminNotice/adminSlideImgUpdate";}
	
	@GetMapping("/adminNoticeEnroll")
	public String adminNoticeEnroll() { return "admin/adminNotice/adminEnrollNotice";}

	

}