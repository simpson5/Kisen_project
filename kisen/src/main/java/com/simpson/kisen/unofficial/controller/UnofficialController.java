package com.simpson.kisen.unofficial.controller;



import java.io.File;

import java.io.IOException;
import java.lang.reflect.Member;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.simpson.kisen.agency.model.service.AgencyService;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.member.Config;
import com.simpson.kisen.member.MailService;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.unofficial.model.service.UnOfficialService;
import com.simpson.kisen.unofficial.model.vo.DemandpdImg;
import com.simpson.kisen.unofficial.model.vo.Deposit;
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
	
	private MailService mailService;
	
	
	
	

	
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
	
	public String demandEnroll(
			Authentication authentication,
			
//			@RequestBody UnofficialPdImgExt unofficialdemand,
			@ModelAttribute UnofficialPdImgExt unofficialdemand,
			@RequestParam(name="thumbnailFile", required = false) MultipartFile thumbnailFile,
			@RequestParam(name="detailFile", required = false) MultipartFile detailFile
			) throws Exception {
		log.info("unofficialDemand = {}", unofficialdemand);
		log.info("thumbnailFile = {}", thumbnailFile);
		log.info("detailFile = {}", detailFile);
		 Fan loginMember = (Fan) authentication.getPrincipal();
		
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
        pd.setFanNo(loginMember.getFanNo());
		pd.setDemandpdImgList(demandpdImgList);
		log.info("product={}", pd);
		
		// 업무로직
		int result = unofficialService.insertdemandEnroll(pd);
		
		return "redirect:demandFormlist.do";
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
		
		return "redirect:depositFormlist.do";
		
	}
	
	



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
	
	@PostMapping("/depositDetail.do")
	public String depositDetail(HttpServletRequest req, @ModelAttribute Deposit deposit,
			@RequestParam(name ="email") String email
			) {
		log.info("email={}", email);
		log.info("deposit={}",deposit);
		mailService = new MailService(Config.gmailId, Config.gmailPw, Config.mailFrom, Config.mailFromName);
		
		// send(email, title, content)	
		mailService.send(email, "[kisen] 입금폼제출 안내메일입니다.",
				"<div style=\"background-color: rgb(241, 241, 241); width: 900px; text-align: center; margin: 20px; padding: 20px;\">\r\n"
						+ "    <img src=\"https://blogfiles.pstatic.net/MjAyMTA2MjVfMjk4/MDAxNjI0NjA5ODQzMDQx.LJecEdDc183KLHTb-4MIJZd0b3Wih7dquRSJaqLYc2Mg.4hjwxApg9j2nPHj9erBQn_gw6hJP86v3rIaNdi5bwgEg.PNG.dbs7wl7/kisen_logo.png\" style=\"width: 300px;\">\r\n"
						+ "    <p style=\"font-size: large; margin-bottom: 10px;\">안녕하세요. K-POP 굿즈 종합쇼핑몰 kisen입니다.</p>\r\n"
						+ "    <p style=\"font-size: large; margin-bottom: 10px;\">입금폼 제출정보 보내드립니다.<span style=\"font-weight: bolder;\">"
						+ deposit +"    </span></p>\r\n"
						+ "    <p style=\"font-size: large; margin-bottom: 10px;\">#{}</p>\r\n"
						+ "    <div style=\"background-color: rgb(109, 51, 104); width: 300px; height: 40px; margin: 30px auto; line-height: 40px; border-radius: 20px;\">\r\n"
						+ "    <a href=\"http://localhost:9090/kisen/member/login.do\" style=\"color: white; text-decoration: none; font-size: large; \"></a>\r\n"
						+ "    </div>\r\n" + "</div>");
	
		return "redirect:depositFormlist.do";
	}
	

	@GetMapping("/demandDetail.do")
	public String demandDetail(
			String demandNo,
			HttpServletRequest request,
			Model model
			) {
		log.info(demandNo);
		UnofficialPdImgExt unofficialdemand = unofficialService.selectunofficialdemand(demandNo);
		log.info("unofficialdemand@controller={}",unofficialdemand);
		
		model.addAttribute("unofficialdemand", unofficialdemand);
		return "unofficial/demandDetail";
	}
	@ResponseBody
	@PostMapping("/demandDetail.do")
	public String demandsubmit(	
			@RequestParam int demandNo,
			@RequestParam String email,
			@RequestParam(value = "twitter", required = false) String twitter,
			@RequestParam String phone
		) {	
		log.info("demandNo@stockupdate={}",demandNo);	
		log.info("demandNo@stockupdate={}",email);		
		log.info("demandNo@stockupdate={}",twitter);	
		log.info("demandNo@stockupdate={}",phone);
		Map<String, Object> map = new  HashMap<String, Object>();
			
		map.put("demandNo", demandNo);
		
		int result = unofficialService.updateStock(map);
		return "redirect:demandFormlist.do";
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
			List<UnofficialPdImgExt2> unofficialdepositList = unofficialService.selectunofficialdepositList();
			
			log.info("unofficialdepositlist={}" ,unofficialdepositList);
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
		public void demandformUpdate(
				@RequestParam(required=false)
				String demandNo,
				Model model
				) {
			log.info("demandNo = {}",demandNo);
			UnofficialPdImgExt unofficialdemand = unofficialService.selectOneDemand(demandNo);
			log.info("unofficialdemand = {}", unofficialdemand);
			model.addAttribute("unofficialdemand", unofficialdemand);
			 
		}
	

	
	@PostMapping("/demandformUpdate.do")
	public String updateDemand(
			Authentication authentication,
			@ModelAttribute UnofficialPdImgExt unofficialdemand,
			@RequestParam(name="thumbnailFile", required = false) MultipartFile thumbnailFile,
			@RequestParam(name="detailFile", required = false) MultipartFile detailFile,
			RedirectAttributes redirectAttr
		) throws IllegalStateException, IOException { 
        log.info("thumbnailFile ={} ",thumbnailFile.getOriginalFilename());
        log.info("detailFile ={} ",detailFile.getOriginalFilename());

        
        Fan loginMember = (Fan) authentication.getPrincipal();
		Map<String, Object> upFile = new HashMap<String, Object>();
		if(!thumbnailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL, thumbnailFile);
		}
		if(!detailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL, detailFile);
		}
		
		//파일
				
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
				pd.setFanNo(loginMember.getFanNo());
				log.info("product={}", pd);
				
				int result = unofficialService.updateDemand(unofficialdemand);
				log.info("unofficialdemand = {}", unofficialdemand);
				
				if(result>0)
					redirectAttr.addFlashAttribute("msg","수정 성공");
		
		
			
		return "redirect:/mypage/mypageform.do";
	}
	
	
	
	@PostMapping("/unofficialDemandDelete.do")
	public String demaneDelete(
					@RequestParam(required=false)
					String delNo,
					RedirectAttributes redirectAttr) {
		log.info("delNo ={}",delNo);
		
		try {
			int result = unofficialService.deletedemand(delNo);
			redirectAttr.addFlashAttribute("msg", "삭제 성공!");
	      } catch(Exception e) {
	         log.error("삭제 오류!", e);
	         throw e;
	      }
	      return "redirect:/mypage/mypageform.do";
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
