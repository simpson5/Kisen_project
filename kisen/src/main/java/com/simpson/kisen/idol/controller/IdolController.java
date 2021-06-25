package com.simpson.kisen.idol.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.service.IdolService;
import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.payment.model.service.PaymentService;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/mypage")
@Slf4j
public class IdolController {
	
	@Autowired
	private IdolService idolService;
	
		
	@GetMapping("/mypageArtist.do")
	public void selectOneIdolCollection(Authentication authentication, Model model
			) {
		
		try {
			Fan principal = (Fan) authentication.getPrincipal();
				log.info("fanNo ={}", principal.getFanNo());
			List<Idol> idolList = idolService.selectAllIdole();
			List<DipIdol> dipList = idolService.selectOneCollection(principal.getFanNo());
			model.addAttribute("loginMember", principal);
			model.addAttribute("idolList", idolList);
			model.addAttribute("dipList", dipList);
			log.info("idolList = {}", idolList);
			log.info("dipList = {}", dipList);
		} catch (Exception e) {
			log.error("회원 정보 불러오기 오류!", e);
			throw e;
		}
	
	}		
	
	
	@PostMapping("/dip")
		public Map<String, Object> insertIdol(@RequestBody DipIdol dip){
			try {
				log.info("dip = {}", dip);
			
			int result = idolService.insertIdol(dip);			
			
				Map<String, Object> map = new HashMap<>();
				map.put("msg", "찜하기 성공!");
				
				log.info("result = {}", result);
				return map;
			} catch (Exception e) {
				log.error("찜하기 실패!",e);
				throw e;
			}
		}
	
	
	@DeleteMapping("/delIdol/{idolNo}")
	public ResponseEntity<?> deleteMenu(@PathVariable int idolNo){
		try {
			log.info("idolNo = {}", idolNo);
			int result = idolService.deleteidol(idolNo);
			if(result > 0) {
				Map<String, Object> map = new HashMap<>();
				map.put("msg", "찜한 아이돌 삭제 성공!");
				
				return  new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
			
			}
			else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);			
			}
		} catch (Exception e) {
			log.error("아이돌 삭제 실패!", e);
			throw e;
		}
	}
}
