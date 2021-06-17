package com.simpson.kisen.unofficial.controller;


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



import lombok.extern.slf4j.Slf4j;



/**
 * 비공식굿즈 컨트롤러
 */
@Controller
@RequestMapping("/unofficial")
@Slf4j
public class UnofficialController {
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/unofficial.do")
	public void unofficial() {}

	
	
	@GetMapping("/demandForm.do")
	public void demandForm() {}
	
	@GetMapping("/depositForm.do")
	public void depositForm() {}
	

	
	@GetMapping("/depositDetail.do")
	public void depositDetail() {}
	
	@GetMapping("/demandDetail.do")
	public void demandDetail() {}
	
	
	
	@GetMapping("/demandFormlist.do")
	public void demandFormlist() {}
	
	@GetMapping("/depositFormlist.do")
	public void depositFormlist() {}
	
	
	
	
	
	
	
	
	
}
