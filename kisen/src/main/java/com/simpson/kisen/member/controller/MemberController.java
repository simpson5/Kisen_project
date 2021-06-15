package com.simpson.kisen.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 암호화 처리
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/login.do")
	public void login() {}
	
	@GetMapping("/signupTerm.do")
	public void signupTerm() {}
	
	@GetMapping("/signup.do")
	public void signup() {}
	
	@GetMapping("/searchId.do")
	public void searchId() {}
	
	/**
	 * 아이디 중복검사
	 */
	@GetMapping("/checkIdDuplicate.do")
	// ResponseEntity에서 처리해주기 때문에 responseBody 필요없음
	// ResponseEntity의 요소로 Map을 리턴
	public ResponseEntity<Map<String, Object>> checkIdDuplicate3(@RequestParam String id) {
		// 1. 업무로직
		// 저 아이디로 기존회원이 있는가 확인
		Fan member = memberService.selectOneMember(id);
		// member가 null인지의 여부를 변수에 담아둠 (null이어야 true)
		boolean available = member == null ;
		
		// 2. map에 요소 저장 후 리턴
		// model필요 없음
		Map<String, Object> map = new HashMap<>();
		map.put("available", available);
		map.put("id", id);

		// ResponseEntity객체를 만들어서 전달
		return ResponseEntity
				.ok() // 응답헤더 200번
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE) // "application/json;charset=UTF-8" -> header값으로 json이라는 것을 알림
				.body(map); // body에 map담기
	}
	
	@PostMapping("/signup.do")
	public String memberEnroll(
			@ModelAttribute Fan member,
			@RequestParam String addressExt1,
			@RequestParam String addressExt2,
			@RequestParam String addressExt3,
			RedirectAttributes redirectAttr
			) {
		log.info("member = {}", member);
		try {
			member.setAddress(member.getAddress() + ") " + addressExt1 + addressExt2 + " " + addressExt3);
			// 0. 비밀번호 암호화처리
			String rawPassword = member.getPassword();
			String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
			// member에 암호화된 비밀번호 다시 세팅
			member.setPassword(encodedPassword);
			log.info("member(암호화처리 이후) = {}", member);
			// 1. 업무로직
			int result = memberService.insertMember(member);
			// 2. 사용자피드백 및 리다이렉트
			redirectAttr.addFlashAttribute("msg", "회원가입성공");
			// redirect:/ - 인덱스페이지(welcome file)로 이동
			// welcome file로 바로 찾게 되면 redirectAttr을 처리할 수 없음
		} catch (Exception e) {
			log.error("회원가입 오류!", e);
			throw e;
		}
		return "redirect:/";
	}
}