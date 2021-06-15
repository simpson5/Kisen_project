package com.simpson.kisen.agency.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("agency")
public class AgencyController {
	@Autowired
	private ServletContext application;
	@Autowired
	private AgencyService agencyService;
	
	
	
	@GetMapping("/agencyMain.do")
	public String agencyMain() { return "agency/agencyMain";}
	
	
	
	
	

	@GetMapping("/agencySales")
	public String agencySales() { return "agency/agencyPayment_Sales";}
	
	
	
	
	

	@GetMapping("/agencyProduct")
	public String agencyProduct() { return "agency/agencyProduct/agencyAllProduct";}
	
	@GetMapping("/agencyProductDetail")
	public String agencyProductDetail() { return "agency/agencyProduct/agencyProductDetail";}
	
	@GetMapping("/agencyProductUpdate")
	public String agencyProductUpdate() { return "agency/agencyProduct/agencyProductUpdate";}

	@GetMapping("/agencyProductEnroll")
	public String agencyProductEnroll() { return "agency/agencyProduct/agencyProductEnroll";}
	
	

	@GetMapping("/agencyArtist")
	public String agencyArtist() { return "agency/agencyArtist/agencyArtist";}
	
	@GetMapping("/agencyArtistDetail")
	public String agencyArtistDetail() { return "agency/agencyArtist/agencyArtistDetail";}

	@GetMapping("/agencyArtistEnroll")
	public String agencyArtistEnroll() { return "agency/agencyArtist/agencyArtistEnroll";}
	
	@PostMapping("/agencyArtistEnroll")
	public String artistEnroll(
			@RequestParam(name="idolName") String idolName,
			@RequestParam(name="idolImg") MultipartFile idolImg,
			RedirectAttributes redirectAttr
			) throws IllegalStateException, IOException{
		log.info("idolName = {}",idolName);
		log.info("idolImg = {}",idolImg.getOriginalFilename());
		
		//파일 저장
		String saveDir = application.getRealPath("/resources/upload/idol");
		log.info("saveDir = {}",saveDir);
		
		File dir = new File(saveDir);
		if(!dir.exists())
			dir.mkdirs();
		
		String renamedFilename = HelloSpringUtils.getRenamedFilename(idolImg.getOriginalFilename());
		
		
		//a. 서버 컴퓨터에 저장
		File dest = new File(saveDir,renamedFilename);
		idolImg.transferTo(dest);
		
		//b. img 객체 저장
		IdolImg idol_img = new IdolImg();
		idol_img.setOriginalFileName(idolImg.getOriginalFilename());
		idol_img.setRenamedFileName(renamedFilename);
		
		
		//c. idol 객체에 idol_img, idolName 저장
		Idol idol = new Idol();
		idol.setIdolName(idolName);
		idol.setIdolImg(idol_img);
		
		
		//2. 업무로직 : db 저장
		int result = agencyService.insertIdol(idol);
		
		return "agency/agencyArtist/agencyArtist";
	}
	
	
	@GetMapping("/agencyArtistUpdate")
	public String agencyArtistUpdate() { return "agency/agencyArtist/agencyProductUpdate";}
	
}
