package com.simpson.kisen.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.product.model.service.ProductService;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.review.model.service.ReviewService;
import com.simpson.kisen.review.model.vo.ReviewExt;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;


@Controller
@RequestMapping("/product")
@Slf4j
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/productInfo")
	public void pdInfo(@RequestParam int no, 
						@RequestParam(required = true, defaultValue = "1") int cpage,
						HttpServletRequest request,
						Authentication authentication,
						Model model) {
		ProductImgExt product = productService.selectOneProduct(no);
		
		product.setPdName(product.getPdName().replaceAll("`", "&#96;"));
		if(authentication != null) {
			Fan loginMember = (Fan) authentication.getPrincipal();
			model.addAttribute("loginMember", loginMember);		
		}
		try {
			log.debug("cpage = {}", cpage);
			final int limit = 5;
			final int offset = (cpage - 1) * limit;
			Map<String, Object> param = new HashMap<>();
			param.put("limit", limit);
			param.put("offset", offset);
			param.put("no", no);
			//1.업무로직 : content영역 - Rowbounds
			List<ReviewExt> list = reviewService.selectReviewList(param);
			List<ProductImgExt> randomList = productService.selectRandomProductList();
			int totalContents = reviewService.selectReviewTotalContents(no);
			String url = request.getRequestURI();
			
			log.info("url = {}", url);
			log.info("list = {}", list);
			log.debug("totalContents = {}, url = {}", totalContents, url);
			String pageBar = HelloSpringUtils.getPageBar(totalContents, cpage, limit, url);
			
			log.info("pageBar = {}", pageBar);
			//2. jsp에 위임
			model.addAttribute("randomList",randomList);
			model.addAttribute("list", list);
			model.addAttribute("pageBar", pageBar);
			model.addAttribute("no",no);
		}catch(Exception e) {
			throw e;
		}
		log.debug("product = {}", product);
		
		model.addAttribute("product", product);
	}
	
	
	@PostMapping(value="insertBasket", produces="application/json; charset=utf-8")
	@ResponseBody
	public String insertBasket(
			@RequestParam(value="json" ,required = false) String json
			) {
		log.info("json = {}",json);
	 
		return "";
	}
}
