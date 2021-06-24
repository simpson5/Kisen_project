package com.simpson.kisen.unofficial.controller;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;
import com.simpson.kisen.unofficial.model.service.UnOfficialService;
import com.simpson.kisen.unofficial.model.vo.UnOfficial;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImg;

import lombok.extern.slf4j.Slf4j;

/**
 * 비공식굿즈 컨트롤러
 * 
 * 
 */
@Controller
@RequestMapping("/unofficial")
@Slf4j
public class UnofficialController {
	@Autowired
	private ServletContext application;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	UnOfficialService unofficialService; 
	
	

	
	
	

	@GetMapping("/unofficial.do")
	public void unofficial() {
	}

	@GetMapping("/demandEnroll.do")
	public void demandForm() {
	}
	
//	@PostMapping("/demandEnroll.do")
//	public String demandEnroll(
//			@RequestParam(name="pdName") String pdName,
//			@RequestParam(name="idolName") String idolName,
//			@RequestParam(name="pdCategory") String pdCategory,
//			@RequestParam(name="price") int price,
//			@RequestParam(name="deliveryPrice") int deliveryPrice,
//			@RequestParam(name="pdStock") int pdStock,
//			@RequestParam(name="pdSales") int pdSales,
//			@RequestParam(name="pdImg") UnofficialPdImg pdImg,
//			@RequestParam(name="pdContent") String pdContent,
//			@RequestParam(name="demandstartDate") Date demandstartDate,
//			@RequestParam(name="demandendDate") Date demandendDate,
//			@RequestParam(name="question") String question,
//			Authentication authentication,
//			RedirectAttributes redirectAttr
//			) throws IllegalStateException, IOException{
//
//	    Fan loginMember = (Fan) authentication.getPrincipal();
//		Member member = unofficialService.selectMember(loginMember.getFanNo());
//
//		
//		
//		//b. img 객체 저장
//		UnofficialPdImg unofficialpdImg = unofficialPdImgUpload(unofficialpdImg);
//
//		
//		
//				UnofficialDemand unofficialdemand = new UnofficialDemand();
//				unofficialdemand.setPdName(pdName);
//				unofficialdemand.setIdolName(idolName);
//				unofficialdemand.setPdCategory(pdCategory);
//				unofficialdemand.setPrice(price);
//				unofficialdemand.setDeliveryPrice(deliveryPrice);
//				unofficialdemand.setPdStock(pdStock);
//				unofficialdemand.setPdSales(pdSales);
//				unofficialdemand.setPdImg(pdImg);
//				unofficialdemand.setPdContent( pdContent);
//				unofficialdemand.setDemandstartDate(demandstartDate);
//				unofficialdemand.setDemandendDate( demandendDate);
//				unofficialdemand.setQuestion(question);
//				unofficialdemand.setDemandNo(unofficialdemand.getDemandNo());
//				
//				
//				
//				int result = unofficialService.insertdemandEnroll(unofficialdemand);
//				redirectAttr.addFlashAttribute("msg","수요조사 폼이 등록되었습니다.");
//				return "redirect:unofficial.do";
//			}

	private UnofficialPdImg unofficialPdImgUpload(UnofficialPdImg unofficialpdImg) {
		// TODO Auto-generated method stub
		return null;
	}

	@GetMapping("/depositEnroll.do")
	public void depositForm() {
	}

	@GetMapping("/depositDetail.do")
	public void depositDetail() {
	}

	@GetMapping("/demandDetail.do")
	public void demandDetail() {
	}

	@GetMapping("/demandFormlist.do")
	public void demandFormlist() {
	}

	@GetMapping("/depositFormlist.do")
	public void depositFormlist() {
	}
	
	

}
