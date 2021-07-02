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
	
	@PostMapping("/depositDetail.do")
	public String depositsubmit(
			@RequestParam(name ="email") String email
			) {
		log.info("email={}", email);
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
	public String demandsubmit(		//mappin아ㅣ 두번............ 어떤거로 하실건가요풋을 지우면 안되겠죠??post로 받는게 맞아요 form 제출은 put 못받아요
		//url 은 demandSumit으로 받으실건가요?아니요 demandDetail로 받는게 나을것같아요... 이거 view 좀 볼게요
			@RequestParam int demandNo,
			@RequestParam String email,
			@RequestParam(value = "twitter", required = false) String twitter,
			@RequestParam String phone
		) {	
		log.info("demandNo@stockupdate={}",demandNo);	//얘로 stock 처리해주시고
		log.info("demandNo@stockupdate={}",email);		// 그 사용자 email 찹아서 얘네 보내주면됩니당네 감사합니다 ㅠㅠㅠ
		log.info("demandNo@stockupdate={}",twitter);	//쿼리문 한번봐드릴게요
		log.info("demandNo@stockupdate={}",phone);
		Map<String, Object> map = new  HashMap<String, Object>();
			// key값을 int 주셨으면 1, 3 이런 숫자로 주셨어야합니다. string 으로 바꾸겠습니다
		//해주세요넵
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
				String pName,
				Model model
				) {
			log.info("pName = {}",pName);
			UnofficialPdImgExt unofficialdemand = unofficialService.selectOneDemand(pName);
			log.info("unofficialdemand = {}", unofficialdemand);
			model.addAttribute("unofficialdemand", unofficialdemand);
			 
		}
	

	
	@PostMapping("/demandformUpdate.do")
	public String demandUpdate(
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
		
		
			
		return "redirect:/unofficial/demandDetail.do"+pd.getDemandNo();
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
