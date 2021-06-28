package com.simpson.kisen.unofficial.controller;



import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.unofficial.model.service.UnOfficialService;
import com.simpson.kisen.unofficial.model.vo.DemandpdImg;
import com.simpson.kisen.unofficial.model.vo.DepositpdImg;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;
import com.simpson.kisen.unofficial.model.vo.UnofficialDeposit;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt2;

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
	@InitBinder
	protected void initBinder(WebDataBinder binder){
	DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	}
	
	@Autowired
	private ServletContext application;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	UnOfficialService unofficialService; 
	
	@GetMapping("/unofficial.do")
	public String unofficial(
		HttpServletRequest request,
		Model model
		) {
		
	List<UnofficialPdImgExt2> unofficialdepositList = new ArrayList<UnofficialPdImgExt2>();
	unofficialdepositList = unofficialService.selectunofficialdepositList();
		
		
	List<UnofficialPdImgExt> unofficialdemandList = new ArrayList<UnofficialPdImgExt>();
	unofficialdemandList = unofficialService.selectunofficialdemandList();
	
	model.addAttribute("unofficialdemandList", unofficialdemandList);
	model.addAttribute("unofficialdepositList", unofficialdepositList);
	return "unofficial/unofficial";
}
	
	

	@GetMapping("/demandFormEnroll.do")
	public void demandFormEnroll() {
	}
	
	@PostMapping("/demandEnroll.do")
	@ResponseBody
	public String demandEnroll(
//			@RequestBody UnofficialPdImgExt unofficialdemand,
			@ModelAttribute UnofficialPdImgExt unofficialdemand,
			@RequestParam(name="thumbnailFile", required = false) MultipartFile thumbnailFile,
			@RequestParam(name="detailFile", required = false) MultipartFile detailFile
			) throws Exception {
		log.info("unofficialDemand = {}", unofficialdemand);
		log.info("thumbnailFile = {}", thumbnailFile);
		log.info("detailFile = {}", detailFile);
		
        //파일
		Map<String, Object> upFile = new HashMap<String, Object>();
		if(!thumbnailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL, thumbnailFile);
		}
		if(!detailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL, detailFile);
		}
		
		List<DemandpdImg> demandpdImgList = new ArrayList<DemandpdImg>();
		int count=0;
        for(Entry<String, Object> elem : upFile.entrySet()){
        	MultipartFile file = (MultipartFile) elem.getValue();
            log.info("file ={} " ,file.getOriginalFilename());
        	
            DemandpdImg demandpdImg = demandpdImgUpload(file);
        	if(elem.getKey().equals(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL)) {
        		demandpdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL);
        	}
        	else {
        		demandpdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL);
        	}
            log.info("키 ={} ",elem.getKey());
            demandpdImgList.add(demandpdImg);
        }

        UnofficialPdImgExt pd = unofficialdemand;
		pd.setDemandpdImgList(demandpdImgList);
		log.info("product={}", pd);
		
		// 업무로직
		int result = unofficialService.insertdemandEnroll(unofficialdemand);
		
		return "unofficial/demendFormlist.do";
	}

	@GetMapping("/depositFormEnroll.do")
	public void depositFormEnroll() {
	}
	
	@PostMapping("/depositEnroll.do")
	public String depositEnroll(
//				@RequestBody UnofficialPdImgExt2 unofficialdeposit,
			@ModelAttribute UnofficialPdImgExt2 unofficialdeposit,
			@RequestParam(name="thumbnailFile", required = false) MultipartFile thumbnailFile,
			@RequestParam(name="detailFile", required = false) MultipartFile detailFile
			) throws Exception {
		log.info("unofficialDeposit = {}", unofficialdeposit);
		log.info("thumbnailFile = {}", thumbnailFile.getOriginalFilename());
		log.info("detailFile = {}", detailFile.getOriginalFilename());
		
        //파일
	Map<String, Object> upFile = new HashMap<String, Object>();
		if(!thumbnailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL, thumbnailFile);
		}
		if(!detailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL, detailFile);
		}
		
		List<DepositpdImg> depositpdImgList = new ArrayList<DepositpdImg>();
		int count=0;
       for(Entry<String, Object> elem : upFile.entrySet()){
       	MultipartFile file = (MultipartFile) elem.getValue();
            log.info("file ={} " ,file.getOriginalFilename());
        	
            DepositpdImg depositpdImg = depositpdImgUpload(file);
        	if(elem.getKey().equals(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL)) {
        		depositpdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL);
        	}
       	else {
        		depositpdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL);
        	}
            log.info("키 ={} ",elem.getKey());
            depositpdImgList.add(depositpdImg);
        }

        UnofficialPdImgExt2 pd = unofficialdeposit;
		pd.setDepositpdImgList(depositpdImgList);
		log.info("product={}", pd);
		
		// 업무로직
		int result = unofficialService.insertdepositEnroll(unofficialdeposit);
		
		return "unofficial/unofficial.do";
		
	}
	



//	@PostMapping("/depositEnroll.do")
//	@ResponseBody
//	public String depositEnroll(@RequestBody UnofficialDeposit unofficialdeposit
//			) throws Exception {
//		log.info("unofficialDeposit = {}", unofficialdeposit);
		// 업무로직
//		int result = unofficialService.insertdepositEnroll(unofficialdeposit);
		
//		return "redirect:unofficial.do";
//	}
	
	



	@GetMapping("/depositDetail.do")
	public String depositDetail(
			String dno,
			HttpServletRequest request,
			Model model
			) {
		log.info(dno);
		UnofficialPdImgExt2 unofficialdeposit = unofficialService.selectunofficialdeposit(dno);
		
		model.addAttribute("unofficialdeposit", unofficialdeposit);
		return "unofficial/depositDetail";
	}

	@GetMapping("/demandDetail.do")
	public String demandDetail(
			String demandNo,
			HttpServletRequest request,
			Model model
			) {
		log.info(demandNo);
		UnofficialPdImgExt unofficialdemand = unofficialService.selectunofficialdemand(demandNo);
		
		model.addAttribute("unofficialdemand", unofficialdemand);
		return "unofficial/demandDetail";
	}

	@GetMapping("/demandFormlist.do")
	public String demandFormlist(
			HttpServletRequest request,
			Model model
			) {
		
		List<UnofficialPdImgExt> unofficialdemandList = new ArrayList<UnofficialPdImgExt>();
		unofficialdemandList = unofficialService.selectunofficialdemandList();
		
		model.addAttribute("unofficialdemandList", unofficialdemandList);
		return "unofficial/demandFormlist";
	}

	@GetMapping("/depositFormlist.do")
		public String depositFormlist(
				HttpServletRequest request,
				Model model
				) {
			List<UnofficialPdImgExt2> unofficialdepositList = new ArrayList<UnofficialPdImgExt2>();
			unofficialdepositList = unofficialService.selectunofficialdepositList();
			
			model.addAttribute("unofficialdepositList", unofficialdepositList);
			return "unofficial/depositFormlist";
	}
	
	@GetMapping("/depositformUpdate.do")
	public void depositformUpdate() {
		
	}
	
	/**
	 * deposit img 업로드 관련 function
	 * @param img
	 * @param category
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
		public DepositpdImg depositpdImgUpload(MultipartFile img) throws IllegalStateException, IOException {
			String saveDir = application.getRealPath("/resources/upload/unofficial");
			log.info(saveDir);
			
			File dir = new File(saveDir);
			if(!dir.exists())
				dir.mkdirs();
			
			String renamedFilename = HelloSpringUtils.getRenamedFilename(img.getOriginalFilename());
			
			//a. �꽌踰� 而댄벂�꽣�뿉 ���옣
			File dest = new File(saveDir,renamedFilename);
			img.transferTo(dest);
			
			DepositpdImg pdImg = new DepositpdImg();
			pdImg.setOriginalFilename(img.getOriginalFilename());
			pdImg.setRenamedFilename(renamedFilename);
			
			return pdImg;
	}
	
	
	@GetMapping("/demandformUpdate.do")
	public void demandformUpdate() {
	}
	
	
	/**
	 * demand img 업로드 관련 function
	 * @param img
	 * @param category
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public DemandpdImg demandpdImgUpload(MultipartFile img) throws IllegalStateException, IOException {
		String saveDir = application.getRealPath("/resources/upload/unofficial");
		log.info(saveDir);
		
		File dir = new File(saveDir);
		if(!dir.exists())
			dir.mkdirs();
		
		String renamedFilename = HelloSpringUtils.getRenamedFilename(img.getOriginalFilename());
		
		//a. �꽌踰� 而댄벂�꽣�뿉 ���옣
		File dest = new File(saveDir,renamedFilename);
		img.transferTo(dest);
		
		DemandpdImg pdImg = new DemandpdImg();
		pdImg.setOriginalFilename(img.getOriginalFilename());
		pdImg.setRenamedFilename(renamedFilename);
		
		return pdImg;
	}
	

}
