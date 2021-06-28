package com.simpson.kisen.agency.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Pattern;

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
import com.simpson.kisen.product.model.vo.ProductOption;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/agency")
@SessionAttributes("agencyMember")
public class AgencyController_Product {
	@Autowired
	private ServletContext application;
	
	@Autowired
	private AgencyService agencyService;
	
	
	
	

	@GetMapping("/agencyProduct")
	public String agencyProduct(
			Authentication authentication, 
			@RequestParam(required = true, defaultValue = "1") int cpage,
			HttpServletRequest request,
			Model model
			) { 
		final int limit = 5;
		final int offset = (cpage - 1) * limit;;
		Map<String, Object> param = new HashMap<>();
		param.put("limit", limit);
		param.put("offset", offset);
	    Fan loginMember = (Fan) authentication.getPrincipal();

	    List<ProductImgExt> productList = agencyService.selectProductList(loginMember.getFanNo(),param);
		int totalContents = agencyService.selectProductTotalContents(loginMember.getFanNo());
		
		
		String url = request.getRequestURI();
		log.info("totalContents = {}, url = {}", totalContents, url);
	    log.info("productList={}",productList);

		//1.업무로직 : pageBar영역 
		String pageBar = HelloSpringUtils.getPageBar(totalContents, cpage, limit, url);
		List<Idol> idolList = agencyService.selectIdolNameList(loginMember.getFanNo());

		model.addAttribute("pageBar", pageBar);
		model.addAttribute("category", AgencyService.PRODUCT_CATEGORY);
		model.addAttribute("idolList", idolList);
		model.addAttribute("productList", productList);
		
		return "agency/agencyProduct/agencyAllProduct";
	}
	
	@GetMapping("/agencyProductDetail/{pdNo}")
	public String agencyProductDetail(@PathVariable String pdNo, Model model) { 
		ProductImgExt product = agencyService.selectOneProduct(pdNo);
		model.addAttribute("product", product);
		model.addAttribute("category", AgencyService.PRODUCT_CATEGORY);
		return "agency/agencyProduct/agencyProductDetail";
	}
	
	@DeleteMapping("/agencyProductDelete/{pdNo}")
	public ResponseEntity<?> agencyProductDelete(@PathVariable String pdNo) {
		log.debug("pdNo ={}",pdNo);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int result =agencyService.deleteProduct(pdNo);
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
	
	@GetMapping("/agencyProductUpdate/{pdNo}")
	public String agencyProductUpdate(
			Authentication authentication,
			@PathVariable String pdNo, 
			Model model) { 
	    Fan loginMember = (Fan) authentication.getPrincipal();
		ProductImgExt product = agencyService.selectOneProduct(pdNo);
		List<Idol> idolList = agencyService.selectIdolNameList(loginMember.getFanNo());
		
		
		model.addAttribute("idolList", idolList);
		model.addAttribute("product", product);
		model.addAttribute("category", AgencyService.PRODUCT_CATEGORY);
		return "agency/agencyProduct/agencyProductUpdate";
	}

	@PostMapping("/agencyProductUpdate")
	public String productUpdate(
			Authentication authentication,
			@ModelAttribute ProductImgExt product,
			@RequestParam(name="thumbnailFile", required = false) MultipartFile thumbnailFile,
			@RequestParam(name="detailFile", required = false) MultipartFile detailFile,
			@RequestParam(name="pdOptionPlus", required = false) String[] pdOptionPlus,
			RedirectAttributes redirectAttr
		) throws IllegalStateException, IOException { 
        log.info("thumbnailFile ={} ",thumbnailFile.getOriginalFilename());
        log.info("detailFile ={} ",detailFile.getOriginalFilename());

		Map<String, Object> upFile = new HashMap<String, Object>();
		if(!thumbnailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL, thumbnailFile);
		}
		if(!detailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL, detailFile);
		}
		

		//이미지 저장
		List<ProductImg> pdImgList = new ArrayList<ProductImg>();
		if(upFile.size()>0) {
	        for(Entry<String, Object> elem : upFile.entrySet()){
	        	MultipartFile file = (MultipartFile) elem.getValue();
	            log.info("file ={} " ,file.getOriginalFilename());
	        	
				ProductImg pdImg = productImgUpload(file);
	        	if(elem.getKey().equals(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL)) {
	        		pdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL);
	        	}
	        	else {
	        		pdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL);
	        	}
	            log.info("키 ={} ",elem.getKey());
	            pdImgList.add(pdImg);
	        }
        }
		
		ProductImgExt pd = product;
		pd.setPdImgList(pdImgList);
		log.info("pd={}", pd);
        
        //새로 추가된 옵션은 insert 처리
		if(pdOptionPlus != null) {
			List<ProductOption> pdOptionList = pdOptionUpload(pdOptionPlus);
			log.info("pdOptionList={}",pdOptionList.toString());
			pd.setPdOptionList(pdOptionList);
		}		
		
		int result = agencyService.updateProduct(product);
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg","상품 수정 성공");
		return "redirect:agencyProductDetail/"+pd.getPdNo();
	}
	
	
	@DeleteMapping("/optionDelete/{optionNo}")
	public ResponseEntity<?> productOPtionDelete(@PathVariable String optionNo) {
		int optionNum = Integer.parseInt(optionNo);
		log.debug("pdNo ={}",optionNo);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int result =agencyService.deleteOption(optionNum);
			if(result > 0) {
				map.put("msg", "메뉴삭제성공");
				return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			}
			else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);			//status: 404 에러 보냄
			}
		} catch (Exception e) {
			log.error("옵션 조회 오류 : " + optionNo, e);
			throw e;
		}
	}
	
	@GetMapping("/agencyProductEnroll")
	public String agencyProductEnroll(Authentication authentication, Model model) { 
	    Fan loginMember = (Fan) authentication.getPrincipal();

		List<Idol> idolList = agencyService.selectIdolNameList(loginMember.getFanNo());
		model.addAttribute("idolList", idolList);
		model.addAttribute("category", AgencyService.PRODUCT_CATEGORY);
		return "agency/agencyProduct/agencyProductEnroll";
	}
	
	
	@PostMapping("/agencyProductEnroll")
	public String productEnroll(
			@ModelAttribute ProductImgExt product,
			@RequestParam(name="thumbnailFile", required = false) MultipartFile thumbnailFile,
			@RequestParam(name="detailFile", required = false) MultipartFile detailFile,
			@RequestParam(name="pdOption", required = false) String[] pdOption,
			RedirectAttributes redirectAttr
	) throws IllegalStateException, IOException { 

        //파일
		Map<String, Object> upFile = new HashMap<String, Object>();
		if(!thumbnailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL, thumbnailFile);
		}
		if(!detailFile.isEmpty()) {
			upFile.put(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL, detailFile);
		}
		
		List<ProductImg> pdImgList = new ArrayList<ProductImg>();
		int count=0;
        for(Entry<String, Object> elem : upFile.entrySet()){
        	MultipartFile file = (MultipartFile) elem.getValue();
            log.info("file ={} " ,file.getOriginalFilename());
        	
			ProductImg pdImg = productImgUpload(file);
        	if(elem.getKey().equals(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL)) {
        		pdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_THUMBNAIL);
        	}
        	else {
        		pdImg.setPdCategory(AgencyService.PRODUCT_IMG_CATEGORY_DETAIL);
        	}
            log.info("키 ={} ",elem.getKey());
            pdImgList.add(pdImg);
        }

		ProductImgExt pd = product;
		pd.setPdImgList(pdImgList);
		log.info("product={}", product);

        
        //옵션
		if(pdOption!=null) {
			List<ProductOption> pdOptionList = pdOptionUpload(pdOption);
			log.info("pdOptionList={}",pdOptionList.toString());
			pd.setPdOptionList(pdOptionList);	
		}	
		
		
		int result = agencyService.insertProduct(product);
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg","상품 등록성공");
		return "redirect:agencyProduct";
	}
	
	@GetMapping("/searchIdolProduct")
	@ResponseBody
	public List<ProductImgExt> searchIdolProduct(
			Authentication authentication,
			@RequestParam(value="idolNoList[]",required = false) List<Integer> idolNoList){
		log.info("idolNoList= {}",idolNoList);
		Map<String, Object> param = new HashMap<String, Object>();
		List<ProductImgExt> productList =null;
	    Fan loginMember = (Fan) authentication.getPrincipal();
		try {
			param.put("idolNoList", idolNoList);
			param.put("fanNo", loginMember.getFanNo());
			productList = agencyService.selectIdolProductList(param);
		} catch (Exception e) {
			throw e;
		}
		return productList;
	}
	
	
	
	
	/**
	 * product option 관련
	 * @param pdOption
	 * @return
	 */
	private List<ProductOption> pdOptionUpload(String[] pdOption) {
		List<ProductOption> pdOptionList = new ArrayList<ProductOption>();
		//d. idol mv 넣기
		for(String option : pdOption) {
			if(!option.equals("")) {
				ProductOption po = new ProductOption();
				po.setOptionName(option);
				pdOptionList.add(po);
			}
		}
		return pdOptionList;
	}

	/**
	 * product img 업로드 관련 function
	 * @param img
	 * @param category
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public ProductImg productImgUpload(MultipartFile img) throws IllegalStateException, IOException {
		String saveDir = application.getRealPath("/resources/upload/product");
		log.info(saveDir);
		
		File dir = new File(saveDir);
		if(!dir.exists())
			dir.mkdirs();
		
		String renamedFilename = HelloSpringUtils.getRenamedFilename(img.getOriginalFilename());
		
		//a. �꽌踰� 而댄벂�꽣�뿉 ���옣
		File dest = new File(saveDir,renamedFilename);
		img.transferTo(dest);
		
		ProductImg pdImg = new ProductImg();
		pdImg.setOriginalFilename(img.getOriginalFilename());
		pdImg.setRenamedFilename(renamedFilename);
		
		return pdImg;
	}
	
	
}
