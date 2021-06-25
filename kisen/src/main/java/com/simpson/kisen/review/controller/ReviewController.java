package com.simpson.kisen.review.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.product.model.service.ProductService;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.review.model.service.ReviewService;
import com.simpson.kisen.review.model.vo.ReviewExt;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/review")
@Slf4j
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private ProductService productService;
	
	@GetMapping("/reviewList.do")
	public String reviewList(
				@RequestParam int no,
				@RequestParam(required = true, defaultValue = "1") int cpage,
				HttpServletRequest request,
				Model model
			) {
		try {
			log.debug("cpage = {}", cpage);
			final int limit = 5;
			final int offset = (cpage - 1) * limit;
			Map<String, Object> param = new HashMap<>();
			param.put("limit", limit);
			param.put("offset", offset);
			//1.업무로직 : content영역 - Rowbounds
			List<ReviewExt> list = reviewService.selectReviewList(param);
			int totalContents = reviewService.selectReviewTotalContents(no);
			String url = request.getRequestURI();
			log.debug("totalContents = {}, url = {}", totalContents, url);
			String pageBar = HelloSpringUtils.getPageBar(totalContents, cpage, limit, url);
			
			//2. jsp에 위임
			model.addAttribute("list", list);
			model.addAttribute("pageBar", pageBar);
		} catch(Exception e) {
			log.error("게시글 조회 오류!", e);
			throw e;
		}
		return "review/reviewList";
	}

	@GetMapping("/reviewForm.do")
	public String reviewForm(@RequestParam(value="no", required = false) int no,
							Model model) {
		ProductImgExt product = productService.selectOneProduct(no);
		
		model.addAttribute("product",product);
		return "review/reviewForm";
	}
	
	@PostMapping("/reviewInsert")
	public String reviewInsert(
			@ModelAttribute ReviewExt reviewExt,
			HttpServletRequest request,
			Model model 						
				) {		
		String fanId = request.getParameter("fanId");
		String fanNo = request.getParameter("fanNo");
		log.info("model = {}" , model);
		log.info("reviewExt = {}", reviewExt);
		log.info("fanId = {}", fanId);
		log.info("fanNo = {}", fanNo);
				
		reviewExt.setFanId(fanId);
		reviewExt.setFanNo(fanNo);
		int result = reviewService.insertReview(reviewExt);
		System.out.println("result = " + result);
		
		return "redirect:/review/reviewForm.do?no=" + reviewExt.getPdNo();
	}

	
	
	@GetMapping("/revieweditForm.do")
	public void revieweditForm() {}
	
	
	@GetMapping("/reviewDetail.do")
	public void reviewDetail() {}

	
	
	
	
	
	
	
	
	
}
