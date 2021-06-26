package com.simpson.kisen;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.simpson.kisen.product.model.service.ProductService;
import com.simpson.kisen.product.model.vo.ProductImgExt;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	@Autowired
	private ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		log.info("home 지나감!");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		log.info("home 지나감!");
		// product 조회
		try {
			List<ProductImgExt> list = productService.selectRandomProductList(); // 추천상품 - 랜덤상품 추천
			List<ProductImgExt> newGoodsList = productService.selectNewGoodsProductList(); // new goods
			List<ProductImgExt> bestSellList = productService.selectBestSellProductList(); // 인기상품 - 판매량 순
			log.info("list = {}",list);
			
			model.addAttribute("list", list);
			model.addAttribute("bestSellList", bestSellList);
			model.addAttribute("newGoodsList", newGoodsList);
		} catch (Exception e) {
			log.debug("product 조회 오류",e);
			throw e;
		}
		
		return "forward:/index.jsp";
	}
	
	@GetMapping("/error/accessDenied.do")
	public void accesDenied() {}
	
}
