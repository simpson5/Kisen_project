package com.simpson.kisen.review.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.review.model.service.ReviewService;
import com.simpson.kisen.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/review")
@Slf4j
public class ReviewController {
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/reviewList.do")
	public String reviewList(
				@RequestParam(required = true, defaultValue = "1") int cpage,
				HttpServletRequest request,
				Model model
			) {
		try {
			log.debug("cpage = {}", cpage);
			final int limit = 10;
			final int offset = (cpage - 1) * limit;
			Map<String, Object> param = new HashMap<>();
			param.put("limit", limit);
			param.put("offset", offset);
			//1.업무로직 : content영역 - Rowbounds
			List<Review> list = reviewService.selectReviewList(param);
			int totalContents = reviewService.selectReviewTotalContents();
			String url = request.getRequestURI();
			log.debug("totalContents = {}, url = {}", totalContents, url);
			String pageBar = HelloSpringUtils.getPageBar(totalContents, cpage, limit, url);
			
			//2. jsp에 위임
			model.addAttribute("list", list);
			model.addAttribute("pageBar", pageBar);
		} catch(Exception e) {
			log.error("리뷰 조회 오류!", e);
			throw e;
		}
		return "review/reviewList";
	}
	

	
	
	
	
	
	
	
	


	
	@GetMapping("/reviewForm.do")
	public void reviewForm() {}
	

	@GetMapping("/revieweditForm.do")
	public void revieweditForm() {}
	
	
	@GetMapping("/reviewDetail.do")
	public void reviewDetail() {}

	
	
	
	
	
	
	
	
	
}
