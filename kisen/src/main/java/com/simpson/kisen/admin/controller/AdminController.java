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
	public String adminMember() { return "admin/adminProduct/adminProductUpdate";}
	
}
