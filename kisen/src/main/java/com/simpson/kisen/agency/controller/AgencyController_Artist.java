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
public class AgencyController_Artist {
	@Autowired
	private ServletContext application;
	
	@Autowired
	private AgencyService agencyService;
	

	@GetMapping("/agencyArtist")
	public String agencyArtist(
			Authentication authentication,
			@RequestParam(required = true, defaultValue = "1") int cpage,
			HttpServletRequest request,
			Model model) {
	    Fan loginMember = (Fan) authentication.getPrincipal();
		
		final int limit = 5;
		final int offset = (cpage - 1) * limit;;
		Map<String, Object> param = new HashMap<>();
		param.put("limit", limit);
		param.put("offset", offset);
		
		//????????? ??????
		List<Idol> idolList = agencyService.selectIdolList(loginMember.getFanNo(),param);	
		int totalContents = agencyService.selectIdolTotalContents(loginMember.getFanNo());
		
		
		String url = request.getRequestURI();
		log.info("totalContents = {}, url = {}", totalContents, url);
		log.info("idolList={}",idolList);

		//1.???????????? : pageBar?????? 
		String pageBar = HelloSpringUtils.getPageBar(totalContents, cpage, limit, url);

		model.addAttribute("pageBar", pageBar);
		model.addAttribute("idolList", idolList);
		return "agency/agencyArtist/agencyArtist";
	}
	
	
	@GetMapping("/agencyArtistDetail/{idolNo}")
	public String agencyArtistDetail(
			@PathVariable String idolNo,
			Model model
			) { 
		log.info("idolNo={}",idolNo);
		int no = Integer.parseInt(idolNo);
		
		//????????? ??????
		Idol idol = agencyService.selectIdol(no);
		log.info("idol={}",idol);
		
		//???????????? ?????? ??????
		int pdCnt = agencyService.selectPdCnt(no);
		log.info("pdCnt={}",pdCnt);
		model.addAttribute("idol", idol);
		model.addAttribute("pdCnt", pdCnt);
		return "agency/agencyArtist/agencyArtistDetail";
	}

	@GetMapping("/agencyArtistEnroll")
	public String agencyArtistEnroll() { return "agency/agencyArtist/agencyArtistEnroll";}
	


	@PostMapping("/agencyArtistEnroll")
	public String artistEnroll(
			@RequestParam(name="idolName") String idolName,
			@RequestParam(name="idolImg") MultipartFile idolImg,
			@RequestParam(name="idolMv", required = false) String[] idolMvList,
			Authentication authentication,
			RedirectAttributes redirectAttr
			) throws IllegalStateException, IOException{

	    Fan loginMember = (Fan) authentication.getPrincipal();
		Agency agency = agencyService.selectAgency(loginMember.getFanNo());

		
		
		//b. img ?????? ??????
		IdolImg idol_img = ImgUpload(idolImg);

		
		
		//c. idol ??????????????? idol_img, idolName ????????????
		Idol idol = new Idol();
		idol.setIdolName(idolName);
		idol.setIdolImg(idol_img);
		idol.setAgencyNo(agency.getAgencyNo());
		

		List<IdolMv> mvList = idolMvUpload(idolMvList);
		log.info("mvList={}",mvList.toString());
		idol.setIdolMv(mvList);
		
		
		//2. ????????????????????? : db ????????????
		int result = agencyService.insertIdol(idol);
		redirectAttr.addFlashAttribute("msg","???????????? ?????? ??????");
		return "redirect:agencyArtist";
	}
	
	
	/**
	 * ????????? ???????????? 
	 */
	@GetMapping("/agencyArtistEnroll/checkIdolName")
	@ResponseBody
	public Map<String, Object> artistEnroll(@RequestParam String idolName){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			//?????? ?????? => ???????????? toUpperCase??? ????????? ??????
			boolean b = Pattern.matches("^[a-z]*$", idolName); //???????????? trure
			
			if(b) {
				//???????????? ??????
				idolName = idolName.toUpperCase();
			}


			log.info("idolName = {}",idolName);
			Idol idol = agencyService.selectOneIdol(idolName);
			log.info("idol={}", idol);

			boolean exist = idol !=null ? true : false;
			map.put("exist",exist);
			
			log.info("exist= {}", exist);
		}catch (Exception e) {
			throw e;
		}
		return map;
	}
	
	@GetMapping("/agencyArtistUpdate/{idolNo}")
	public String agencyArtistUpdate(
			@PathVariable String idolNo,
			Model model
	) { 
		log.info("idolNo={}",idolNo);
		int no = Integer.parseInt(idolNo);
		
		//????????? ??????
		Idol idol = agencyService.selectIdol(no);
		log.info("idol={}",idol);
		
		//???????????? ?????? ??????
		int pdCnt = agencyService.selectPdCnt(no);
		log.info("pdCnt={}",pdCnt);
		model.addAttribute("idol", idol);
		model.addAttribute("pdCnt", pdCnt);
		
		return "agency/agencyArtist/agencyArtistUpdate";
	}
	
	
	
	@PostMapping("/agencyArtistUpdate")
	public String artistUpdate(			
			int idolNo,
			@RequestParam(name="idolName") String idolName,
			@RequestParam(name="idolImg", required = false ) MultipartFile idolImg,
			@RequestParam(name="idolMv", required = false) String[] idolMvList,
			@RequestParam(name="idolMvInsert", required = false) String[] idolMvInsert,
			Authentication authentication,
			RedirectAttributes redirectAttr,
			Model model
			) throws IllegalStateException, IOException {
		log.info("idolNo@update={}",idolNo);
		log.info("idolName@update={}",idolName);
		log.info("idolImg@update={}",idolImg);
		log.info("idolMvList@update={}",Arrays.toString(idolMvList));

	    Fan loginMember = (Fan) authentication.getPrincipal();
		Agency agency = agencyService.selectAgency(loginMember.getFanNo());

		Idol idol = new Idol();
		idol.setIdolNo(idolNo);
		idol.setIdolName(idolName);
		idol.setAgencyNo(agency.getAgencyNo());
		
		int result = 0;
		//????????? ??????
		if(!idolImg.isEmpty()) {
			IdolImg idol_img = ImgUpload(idolImg);
			idol.setIdolImg(idol_img);
			if(idolMvList.length>0) {
				List<IdolMv> mvList =  new ArrayList<IdolMv>();;
				for(String mv : idolMvList) {
					if(!mv.equals("")) {
						String[] arr = mv.split("-");
						IdolMv idol_mv = new IdolMv();
						idol_mv.setMvNo(Integer.parseInt(arr[0]));
						idol_mv.setMvLink(arr[1]);
						mvList.add(idol_mv);
					}
				}
				log.info("mvList={}",mvList.toString());
				idol.setIdolMv(mvList);
				agencyService.updateIdol(idol);
			}	
			if(idolMvInsert.length>0) {
				List<IdolMv> idolMvInsertList = new ArrayList<IdolMv>();;
				for(String mv : idolMvInsert) {
					if(!mv.equals("")) {
						IdolMv idol_mv = new IdolMv();
						idol_mv.setMvLink(mv);
						idol_mv.setIdolNo(idolNo);
						idolMvInsertList.add(idol_mv);
					}
				}
				agencyService.insertMvLink(idolMvInsertList);
			}	
		}
		//????????? ?????? x
		else {
			if(idolMvList.length>0) {
				List<IdolMv> mvList = idolMvUpload(idolMvList);
				log.info("mvList={}",mvList.toString());
				idol.setIdolMv(mvList);
				agencyService.updateIdol(idol);
			}	
			if(idolMvInsert.length>0) {
				List<IdolMv> idolMvInsertList = new ArrayList<IdolMv>();;
				for(String mv : idolMvInsert) {
					if(!mv.equals("")) {
						IdolMv idol_mv = new IdolMv();
						idol_mv.setMvLink(mv);
						idol_mv.setIdolNo(idolNo);
						idolMvInsertList.add(idol_mv);
					}
				}
				agencyService.insertMvLink(idolMvInsertList);
			}	
		}

		log.info("idol@update={}",idol);
		
		
		
		redirectAttr.addFlashAttribute("msg", "?????? ??????");
		model.addAttribute("agency", agency);
		return "redirect:agencyArtistDetail/"+idolNo;
	}


	public IdolImg ImgUpload( MultipartFile img) throws IllegalStateException, IOException {
		String saveDir = application.getRealPath("/resources/upload/idol");
		
		File dir = new File(saveDir);
		if(!dir.exists())
			dir.mkdirs();
		
		String renamedFilename = HelloSpringUtils.getRenamedFilename(img.getOriginalFilename());
		
		//a. ???????????? ????????????????????? ????????????
		File dest = new File(saveDir,renamedFilename);
		img.transferTo(dest);
		
		IdolImg idol_img = new IdolImg();
		idol_img.setOriginalFilename(img.getOriginalFilename());
		idol_img.setRenamedFilename(renamedFilename);
		
		return idol_img;
	}
	public List<IdolMv> idolMvUpload(String[] idolMvList){
		List<IdolMv> mvList = new ArrayList<IdolMv>();
		//d. idol mv ??????
		for(String mv : idolMvList) {
			if(!mv.equals("")) {
				IdolMv idol_mv = new IdolMv();
				idol_mv.setMvLink(mv);
				mvList.add(idol_mv);
			}
		}
		return mvList;
	}
	
	
	
}
