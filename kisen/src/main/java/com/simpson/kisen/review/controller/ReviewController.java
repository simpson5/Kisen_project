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
	
	
	
//	@PostMapping("/reviewEnroll.do")
//	public String reviewEnroll(
//						@ModelAttribute ReviewExt review,
//						@RequestParam(name = "upFile") MultipartFile[] upFiles,
//						RedirectAttributes redirectAttr
//					) throws Exception {
//		
//		try {
//			log.debug("review = {}", review);
//			//1. 파일 저장 : 절대경로 /resources/upload/board
//			//pageContext:PageContext - request:HttpServletRequest - session:HttpSession - application:ServletContext
//			String saveDirectory = application.getRealPath("/resources/upload/review");
//			log.debug("saveDirectory = {}", saveDirectory);
//			
//			//디렉토리 생성
//			File dir = new File(saveDirectory);
//			if(!dir.exists())
//				dir.mkdirs(); // 복수개의 디렉토리를 생성
//			
//			List<Attachment> attachList = new ArrayList<>();
//			
//			for(MultipartFile upFile : upFiles) {
//				//input[name=upFile]로부터 비어있는 upFile이 넘어온다.
//				if(upFile.isEmpty()) continue;
//				
//				String renamedFilename = 
//						HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename());
//				
//				//a.서버컴퓨터에 저장
//				File dest = new File(saveDirectory, renamedFilename);
//				upFile.transferTo(dest); // 파일이동
//				
//				//b.저장된 데이터를 Attachment객체에 저장 및 list에 추가
//				Attachment attach = new Attachment();
//				attach.setOriginalFilename(upFile.getOriginalFilename());
//				attach.setRenamedFilename(renamedFilename);
//				attachList.add(attach);
//			}
//			
//			log.debug("attachList = {}", attachList);
//			//board객체에 설정
//			review.setAttachList(attachList);
//			
//			//2. 업무로직 : db저장 board, attachment
//			int result = reviewService.insertReview(review);
//			
//			//3. 사용자피드백 &  리다이렉트
//			redirectAttr.addFlashAttribute("msg", "리뷰등록 성공!");
//		} catch(Exception e) {
//			log.error("리뷰 등록 오류!", e);
//			throw e;
//		}
//		return "redirect:/review/reviewDetail.do?no=" + review.getReview_No();
//	}
	
	@GetMapping("/reviewDetail.do")
	public void selectOneReview(@RequestParam int no, Model model) {
		//1. 업무로직 : review - attachment 
		ReviewExt review = reviewService.selectOneReviewCollection(no);
		log.debug("review = {}", review);
		
		//2. jsp에 위임
		model.addAttribute("review", review);
	}
	
	
	
	/**
	 * ResponseEntity
	 * 1. status code 커스터마이징
	 * 2. 응답 header 커스터마이징
	 * 3. @ResponseBody 기능 포함
	 * 
	 * @param no
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
//	@GetMapping("/fileDownload.do")
//	public ResponseEntity<Resource> fileDownloadWithResponseEntity(@RequestParam int no) 
//			throws UnsupportedEncodingException{
//		ResponseEntity<Resource> responseEntity = null;
//		try {
//			//1. 업무로직 : db조회
//			Attachment attach = reviewService.selectOneAttachment(no);
//			if(attach == null) {
//				return ResponseEntity.notFound().build();
//			}
//			
//			//2. Resource객체
//			String saveDirectory = application.getRealPath("/resources/upload/review");
//			File downFile = new File(saveDirectory, attach.getRenamedFilename());
//			Resource resource = resourceLoader.getResource("file:" + downFile);
//			String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1");
//			
//			//3. ResponseEntity객체 생성 및 리턴
//			//builder패턴
//			responseEntity = 
//					ResponseEntity
//						.ok()
//						.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
//						.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + filename)
//						.body(resource);
//		} catch (Exception e) {
//			log.error("파일 다운로드 오류", e);
//			throw e;
//		}
//		return responseEntity;
//	}
	
	
	
	
	
	

	
	
	
	
	
	
	
	

	@GetMapping("/reviewList.do")
	public void reviewList() {}
	
	@GetMapping("/reviewForm.do")
	public void reviewForm() {}
	

	@GetMapping("/revieweditForm.do")
	public void revieweditForm() {}
	
	
	@GetMapping("/reviewDetail.do")
	public void reviewDetail() {}

	
	
	
	
	
	
	
	
	
}
