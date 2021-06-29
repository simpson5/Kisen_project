package com.simpson.kisen.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.admin.model.service.AdminService;
import com.simpson.kisen.admin.model.vo.SlideImg;
import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.notice.model.vo.Notice;
import com.simpson.kisen.notice.model.vo.NoticeExt;
import com.simpson.kisen.notice.model.vo.NoticeImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import java.io.File;
import java.io.IOException;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 컨트롤러
 */
@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ServletContext application;
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/adminMain.do")
	public void adminMain(Model model) {
		//상품목록 random
	    List<ProductImgExt> p_productList= adminService.selectRandomProductList();
	    log.info("p_productList={}",p_productList);
	    log.info("p_productList size={}",p_productList.size());
	    
		//품절 상품 모든것
	    List<ProductImgExt> SoldOut_productList= adminService.selectSoldOutProductList();
	    log.info("SoldOut_productList={}",SoldOut_productList);

	    
	    
		//상품 Best10
	    List<ProductImgExt> best_productList= adminService.selectBestProductList();
	    log.info("best_productList={}",best_productList);

		model.addAttribute("p_productList", p_productList);
		model.addAttribute("SoldOut_productList", SoldOut_productList);
		model.addAttribute("best_productList", best_productList);
		
	}
	@GetMapping("/adminProduct")
	public String adminProduct(
			@RequestParam(required = true, defaultValue = "1") int cpage,
			HttpServletRequest request,
			Model model
			) { 
		final int limit = 5;
		final int offset = (cpage - 1) * limit;;
		Map<String, Object> param = new HashMap<>();
		param.put("limit", limit);
		param.put("offset", offset);

	    List<ProductImgExt> productList = adminService.selectProductList();
		int totalContents = adminService.selectProductTotalContents();
		
		
		String url = request.getRequestURI();
		log.info("totalContents = {}, url = {}", totalContents, url);
	    log.info("productList={}",productList);

		//1.업무로직 : pageBar영역 
		String pageBar = HelloSpringUtils.getPageBar(totalContents, cpage, limit, url);
		List<Idol> idolList = adminService.selectIdolNameList();

		model.addAttribute("pageBar", pageBar);
		model.addAttribute("category", AgencyService.PRODUCT_CATEGORY);
		model.addAttribute("idolList", idolList);
		model.addAttribute("productList", productList);
		
		return "admin/adminProduct/adminAllProduct";
	}

	@GetMapping("/adminProductDetail")
	public String adminProductDetail() { return "admin/adminProduct/adminProductDetail";}
	
	@GetMapping("/adminProductUpdate")
	public String adminProductUpdate() { return "admin/adminProduct/adminProductUpdate";}
	

	
	@GetMapping("/searchProduct")
	public String searchProduct(
			@RequestParam(value="idolNo",required = false) int[] idolNo,
			@RequestParam(value="category",required = false) String[] category,
			@RequestParam(value="searchString",required = false) String searchString,
			HttpServletRequest request,
			Model model
			){

		log.info("category@search= {}",category);	//null
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idolNo", idolNo);
		param.put("category", category);
		param.put("searchString", searchString);

		List<ProductImgExt> productList = adminService.selectIdolProductList(param);
		log.info("productList@search= {}",productList);	//null
		
		
//		int totalContents = agencyService.selectProductTotalContents(loginMember.getFanNo());
		
//		String url = request.getRequestURI();
//		log.info("totalContents = {}, url = {}", totalContents, url);
//	    log.info("productList={}",productList);

		//1.업무로직 : pageBar영역 
//		String pageBar = HelloSpringUtils.getPageBar(totalContents, cpage, limit, url);
		List<Idol> idolList = adminService.selectIdolNameList();


		model.addAttribute("pageBar", null);
		model.addAttribute("category", AgencyService.PRODUCT_CATEGORY);
		model.addAttribute("idolList", idolList);
		model.addAttribute("productList", productList);
		return "admin/adminProduct/adminAllProduct";
	}
	


	@GetMapping("/adminMember")
	public String adminMember() { return "admin/adminMember/adminMember";}

	@GetMapping("/adminArtistDetail")
	public String adminArtistDetail() { return "admin/adminMember/adminArtistDetail";}
	
	@GetMapping("/adminArtistUpdate")
	public String adminArtistUpdate() { return "admin/adminMember/adminArtistUpdate";}
	
	
	
	

	@GetMapping("/adminSales")
	public String adminSales() { return "admin/adminPayment_Sales";}
	
	
	

	@GetMapping("/adminNotice")
	public String adminNotice(Model model) { 
		List<SlideImg> slideImgList = adminService.selectSlideImgList();
		List<Notice> noticeList = adminService.selectNoticeList();
		
		
		model.addAttribute("slideImgList", slideImgList);
		model.addAttribute("noticeList", noticeList);
		return "admin/adminNotice/adminNotice";
	}
	
	@GetMapping("/adminSlideImgUpdate")
	public String adminSlideImgUpdate(Model model) { 
		List<SlideImg> slideImgList = adminService.selectSlideImgList();
		model.addAttribute("slideImgList", slideImgList);
		return "admin/adminNotice/adminSlideImgUpdate";
	}


	
	@GetMapping("/adminNoticeEnroll")
	public String adminNoticeEnroll() { return "admin/adminNotice/adminEnrollNotice";}


	@PostMapping("/adminNoticeEnroll")
	public String noticeEnroll(
			@ModelAttribute NoticeExt n,
			@RequestParam(name="formFile", required = false) MultipartFile formFile
		) throws IllegalStateException, IOException { 
		log.info("notice={}",n);
		log.info("formFile={}",formFile.getOriginalFilename());
		NoticeExt notice = n;
		

		String saveDirectory = application.getRealPath("/resources/upload/notice");
		log.debug("saveDirectory = {}", saveDirectory);
		
		//디렉토리 생성
		File dir = new File(saveDirectory);
		if(!dir.exists())
			dir.mkdirs(); // 복수개의 디렉토리를 생성
		List<SlideImg> slideImgList = new ArrayList<>();
		
		if(!formFile.isEmpty()) {
			String renamedFilename = 
					HelloSpringUtils.getRenamedFilename(formFile.getOriginalFilename());
			
			//a.서버컴퓨터에 저장
			File dest = new File(saveDirectory, renamedFilename);
			formFile.transferTo(dest); // 파일이동
			
			//b.저장된 데이터를 Attachment객체에 저장 및 list에 추가
			NoticeImg noticeImg = new NoticeImg();
			noticeImg.setOriginalFilename(formFile.getOriginalFilename());
			noticeImg.setRenamedFilename(renamedFilename);
			notice.setNoticeImg(noticeImg);
		}
		//2. 업무로직 : db저장 board, attachment
		int noticeNo = adminService.insertNotice(notice);
		
		return "redirect:adminNoticeDetail/"+noticeNo;
	}

	@GetMapping("/adminNoticeDetail/{noticeNo}")
	public String adminNoticeDetail(@PathVariable(name="noticeNo") String no, Model model) {
		int noticeNo = Integer.parseInt(no);
		NoticeExt notice = adminService.selectNotice(noticeNo);
		model.addAttribute("notice", notice);
		return "admin/adminNotice/adminDetailNotice";
	}
	
	@PostMapping("/adminSlideImg")
	public String insertSlideImg(
			@RequestParam(name="formFile", required = false) MultipartFile[] formFiles,
			RedirectAttributes redirectAttr
			) throws IllegalStateException, IOException {
		for(MultipartFile formFile : formFiles)
			log.info("formFiles={}",formFile.getOriginalFilename());
		

		String saveDirectory = application.getRealPath("/resources/upload/slide");
		log.debug("saveDirectory = {}", saveDirectory);
		
		//디렉토리 생성
		File dir = new File(saveDirectory);
		if(!dir.exists())
			dir.mkdirs(); // 복수개의 디렉토리를 생성
		
		List<SlideImg> slideImgList = new ArrayList<>();
		
		for(MultipartFile formFile : formFiles) {
			//input[name=upFile]로부터 비어있는 upFile이 넘어온다.
			if(formFile.isEmpty()) continue;
			
			String renamedFilename = 
					HelloSpringUtils.getRenamedFilename(formFile.getOriginalFilename());
			
			//a.서버컴퓨터에 저장
			File dest = new File(saveDirectory, renamedFilename);
			formFile.transferTo(dest); // 파일이동
			
			//b.저장된 데이터를 Attachment객체에 저장 및 list에 추가
			SlideImg slide = new SlideImg();
			slide.setOriginalFilename(formFile.getOriginalFilename());
			slide.setRenamedFilename(renamedFilename);
			slideImgList.add(slide);
		}
		
		//2. 업무로직 : db저장 board, attachment
		int result = adminService.insertSlideImg(slideImgList);
		
		//3. 사용자피드백 &  리다이렉트
		redirectAttr.addFlashAttribute("msg","등록성공");
		
		return "redirect:adminNotice";
	}

	
	@DeleteMapping("/slideImgUpdate/{imgNo}")
	public ResponseEntity<?> slideImgUpdate(@PathVariable String imgNo) {
		log.info("imgNo={}",imgNo);
		int slideImgNo = Integer.parseInt(imgNo);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int result = adminService.deleteSlideImg(slideImgNo);
			if(result > 0) {
				map.put("msg", "메뉴삭제성공");
				return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			}
			else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);			//status: 404 에러 보냄
			}
		} catch (Exception e) {
			throw e;
		}
	}
	@DeleteMapping("/noticeDelete/{noticeNo}")
	public ResponseEntity<?> noticeDelete(@PathVariable(name="noticeNo") String no) {
		log.info("no={}",no);
		int noticeNo = Integer.parseInt(no);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int result = adminService.deleteNotice(noticeNo);
			if(result > 0) {
				map.put("msg", "삭제성공");
				return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			}
			else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);			//status: 404 에러 보냄
			}
		} catch (Exception e) {
			throw e;
		}
	}
	@GetMapping("/adminNoticeUpdate/{noticeNo}")
	public String adminNoticeUpdate(@PathVariable(name="noticeNo") String no, Model model) {
		int noticeNo = Integer.parseInt(no);
		NoticeExt notice = adminService.selectNotice(noticeNo);
		model.addAttribute("notice", notice);
		return "admin/adminNotice/adminNoticeUpdate";
	}

	
	
	@PostMapping("/adminNoticeUpdate")
	public String adminNoticeUpdate(
			@ModelAttribute NoticeExt n,
			@RequestParam(name="formFileUpdate", required = false) MultipartFile formFileUpdate,
			@RequestParam(name="formFileInsert", required = false) MultipartFile formFileInsert
		) throws IllegalStateException, IOException { 
		log.info("notice={}",n);
		NoticeExt notice = n;
		MultipartFile formFile ;
		String file  ;
		if(formFileInsert != null) {
			formFile = formFileInsert;
			file="I";
		}
		else {
			formFile = formFileUpdate;
			file="U";
		}
		

		String saveDirectory = application.getRealPath("/resources/upload/notice");
		
		//디렉토리 생성
		File dir = new File(saveDirectory);
		if(!dir.exists())
			dir.mkdirs(); // 복수개의 디렉토리를 생성
		
		if(!formFile.isEmpty()) {
			String renamedFilename = 
					HelloSpringUtils.getRenamedFilename(formFile.getOriginalFilename());
			
			//a.서버컴퓨터에 저장
			File dest = new File(saveDirectory, renamedFilename);
			formFile.transferTo(dest); // 파일이동
			
			//b.저장된 데이터를 Attachment객체에 저장 및 list에 추가
			NoticeImg noticeImg = new NoticeImg();
			noticeImg.setOriginalFilename(formFile.getOriginalFilename());
			noticeImg.setRenamedFilename(renamedFilename);
			notice.setNoticeImg(noticeImg);
		}
		//2. 업무로직 : db저장 board, attachment
		int result = adminService.updateNotice(notice,file);
		
		return "redirect:adminNoticeDetail/"+notice.getNoticeNo();
	}
}