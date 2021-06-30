package com.simpson.kisen.artist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simpson.kisen.artist.model.service.ArtistService;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/artist")
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	
	
	@GetMapping("/artistInfo")
	public void artistInfo(
				@RequestParam(name="no") int no,
				Authentication authentication,
				Model model
			) {
		if(authentication != null) {
			Fan loginMember = (Fan) authentication.getPrincipal();				
			model.addAttribute("loginMember",loginMember);
		}
		List<Idol> idol = artistService.selectArtistOne(no);
		log.info("idol = {}",idol);
		model.addAttribute("idol", idol);
	}


	@GetMapping("/allArtist")
	@ResponseBody
	public List<Idol>  allArtist() {
		List<Idol> idolList = null;
		try {
			idolList =artistService.selectAllIdolName();
			log.info("idolList@artistController = {}",idolList);
		} catch (Exception e) {
			log.error("error ={} ",e);
			throw e;
		}
		
		return idolList;
	}
}
