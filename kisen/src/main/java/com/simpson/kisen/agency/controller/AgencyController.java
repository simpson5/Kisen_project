package com.simpson.kisen.agency.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;
import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/agency")
@SessionAttributes("agencyMember")
public class AgencyController {
	@Autowired
	private ServletContext application;
	
	@Autowired
	private AgencyService agencyService;
	
	
	@GetMapping("/agencyMain.do")
	public String agencyMain() {
		return "agency/agencyMain";
	}
	
	
	
	
	

	@GetMapping("/agencySales")
	public String agencySales() { return "agency/agencyPayment_Sales";}
	
	
	
}
