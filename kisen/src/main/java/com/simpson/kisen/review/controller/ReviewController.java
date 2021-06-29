package com.simpson.kisen.review.controller;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;

import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.product.model.service.ProductService;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.review.model.service.ReviewService;
import com.simpson.kisen.review.model.vo.Attachment;
import com.simpson.kisen.review.model.vo.Review;
import com.simpson.kisen.review.model.vo.ReviewExt;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/review")
@Slf4j
public class ReviewController {
	@Autowired
	private ServletContext application;
	
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
			Authentication authentication,
			Model model 						
				) {		
		Fan loginMember = (Fan) authentication.getPrincipal();
		String fanId = loginMember.getFanId();
		String fanNo = loginMember.getFanNo();
		log.info("model = {}" , model);
		log.info("reviewExt = {}", reviewExt);
		log.info("fanId = {}", fanId);
		log.info("fanNo = {}", fanNo);
		
		reviewExt.setFanId(fanId);
		reviewExt.setFanNo(fanNo);
		
		int result = reviewService.insertReview(reviewExt);
		System.out.println("result = " + result);
		
		return "redirect:/review/reviewDetail?no=" + reviewExt.getPdNo()+"&reviewNo="+reviewExt.getReviewNo();
	}

	@PostMapping("/reviewImages")
	@ResponseBody
	public Map<String, Object> handleFileUpload(
								@RequestParam(name="file") MultipartFile file,
								@RequestParam(name="no") int no,
								HttpServletResponse response,
								HttpServletRequest request
								) throws Exception{
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			String saveDirectory = application.getRealPath("/resources/upload/review");
			log.info("saveDir = {} " ,saveDirectory);
			String originalFileName = file.getOriginalFilename();
			String renamedFilename = 
					HelloSpringUtils.getRenamedFilename(originalFileName);
			File dir = new File(saveDirectory);
			if(!dir.exists())
				dir.mkdirs(); // 복수개의 디렉토리를 생성
			log.info("dir = {}" , dir);
			String buildPath = saveDirectory+"/"+renamedFilename;
			File dest = new File(saveDirectory, renamedFilename);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, dest);

			map.put("renamedFilename", renamedFilename);
			map.put("url", buildPath);
			
		}catch(Exception e) {
			FileUtils.deleteQuietly(dest);
			throw e;
		}
		return map;
	}
	

	@GetMapping("/reviewUpdate")
	public void reviewUpdate(
			@RequestParam(value="no", required = false) int no,
			@RequestParam(value="reviewNo", required = false) int reviewNo,
			Authentication authentication,
			Model model) {
		ProductImgExt product = productService.selectOneProduct(no);
		Review review = reviewService.selectOneReview(reviewNo);
		log.info("review = {}", review);
		Fan loginMember = (Fan) authentication.getPrincipal();
		
		model.addAttribute("loginMember",loginMember);
		model.addAttribute("review",review);
		model.addAttribute("product",product);
	}
	
	@PostMapping("/reviewUpdate")
	public String reviewUpdate(
			@ModelAttribute Review review,
			HttpServletRequest request,
			Authentication authentication,
			Model model 
			) {
		Fan loginMember = (Fan) authentication.getPrincipal();
		String fanId = loginMember.getFanId();
		String fanNo = loginMember.getFanNo();
		log.info("model = {}" , model);
		log.info("reviewExt = {}", review);
		
	
		review.setFanId(fanId);
		review.setFanNo(fanNo);
		
		int result = reviewService.updateReview(review);
		System.out.println("result = " + result);
		
		return "redirect:/review/reviewDetail?no=" + review.getPdNo()+"&reviewNo="+review.getReviewNo();
	}
	
	@GetMapping("/reviewDetail")
	public void reviewDetail(
				@RequestParam(value="no", required = false) int no,
				@RequestParam(value="reviewNo", required = false) int reviewNo,
				Authentication authentication,
				Model model) {
			ProductImgExt product = productService.selectOneProduct(no);
			Review review = reviewService.selectOneReview(reviewNo);
			log.info("review = {}", review);
			if(authentication != null) {
				Fan loginMember = (Fan) authentication.getPrincipal();				
				model.addAttribute("loginMember",loginMember);
			}
			model.addAttribute("review",review);
			model.addAttribute("product",product);
	}

	@PostMapping("/reviewDelete")
	public String reviewDelete(
			@RequestParam(value="pdNo", required = false) int no,
			@RequestParam(value="reviewNo", required = false) int reviewNo,
			Authentication authentication,
			Model model
			) {
		int result = reviewService.deleteReview(reviewNo);
		Fan loginMember = (Fan) authentication.getPrincipal();		
		model.addAttribute("loginMember",loginMember);
		log.info("result = {}", result);
		return "redirect:/product/productInfo?no="+no;
	}
	
	
	
	
	
	
	
	
}
