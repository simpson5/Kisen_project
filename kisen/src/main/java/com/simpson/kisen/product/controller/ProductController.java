package com.simpson.kisen.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simpson.kisen.product.model.service.ProductService;
import com.simpson.kisen.product.model.vo.ProductExt;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/product")
@Slf4j
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@GetMapping("/productInfo")
	public void pdInfo(@RequestParam int no, Model model) {
		ProductExt product = productService.selectOneProduct(no);
		log.debug("product = {}", product);
		
		model.addAttribute("product", product);
	}
}
