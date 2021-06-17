package com.simpson.kisen.member.controller;

import java.beans.PropertyEditor;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.agency.model.vo.Agency;
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
	// @RequestHeader를 통해 Referer를 가져옴, referer가 없는 경우를 대비해 required는 false로 설정
	public void memberLogin() {
	}
	
	@GetMapping("/signupTerm.do")
	public void signupTerm() {}
	
	@GetMapping("/signup.do")
	public void signup() {}

	@GetMapping("/signupAgency.do")
	public void signupAgency() {}
	
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
	
	/**
	 * java.sql.Date, java.util.Date 필드에 값대입시
	 * 사용자 입력값이 ""인 경우, null로 처리될 수 있도록 설정
	 * @param binder
	 */
	// initBinder - 커맨드 객체 관련 설정을 담당
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// [특정 타입에 대해 형변환해주는 editor를 등록]
		// 1. editor에서 필요한 형식 지정
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// 2. editor객체 생성
		// CustomDateEditor(DateFormat dateFormat, boolean allowEmpty)
		// allowEmpty여부를 true로 바꾸기 : 빈문자열이 들어오는 것을 허용함
		PropertyEditor editor = new CustomDateEditor(format, true);
		// 3. binder에 editor 등록
		// 형변환이 필요하다면 이 editor를 사용하라
		binder.registerCustomEditor(Date.class, editor);
	}
	
	
	/**
	 * 회원가입 처리
	 */
	@PostMapping("/signup.do")
	public String memberEnroll(
			@ModelAttribute Fan member,
			@RequestParam String selectEmail,
			@RequestParam String addressExt1,
			@RequestParam String addressExt2,
			@RequestParam String addressExt3,
			RedirectAttributes redirectAttr
			) {
		log.info("member = {}", member);
		try {
			member.setAddress(member.getAddress() + ") " + addressExt1 + addressExt2 + " " + addressExt3);
			// member에 모든 주소 다시 세팅
			member.setAddress(member.getAddress() + ") " + addressExt1 + addressExt2 + " " + addressExt3);
			// member에 선택여부에 따른 이메일 세팅
			if("1".equals(selectEmail) == false) {
				member.setEmail(member.getEmail() + "@" + selectEmail);
			}
			
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
	
	@PostMapping("/signupAgency.do")
	public String memberAgencyEnroll(
			@ModelAttribute Fan member,
			@RequestParam String selectEmail,
			@RequestParam String addressExt1,
			@RequestParam String addressExt2,
			@RequestParam String addressExt3,
			@ModelAttribute Agency agency,
			@RequestParam String fanNoExt1,
			@RequestParam String fanNoExt2,
			RedirectAttributes redirectAttr
			) {
		log.info("member = {}", member);
		try {
			// member에 모든 주소 다시 세팅
			member.setAddress(member.getAddress() + ") " + addressExt1 + addressExt2 + " " + addressExt3);
			// member에 선택여부에 따른 이메일 세팅
			if("1".equals(selectEmail) == false) {
				member.setEmail(member.getEmail() + "@" + selectEmail);
			}
			
			// agency에 모든 사업자번호 다시 세팅
			member.setFanNo("agcy_" + agency.getFanNo() + fanNoExt1 + fanNoExt2);
			
			// 0. 비밀번호 암호화처리
			String rawPassword = member.getPassword();
			String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
			// member에 암호화된 비밀번호 다시 세팅
			member.setPassword(encodedPassword);
			log.info("member(암호화처리 이후) = {}", member);
			// 1. 업무로직
			// 1.1. fan테이블에 세팅
			int result = memberService.insertMemberAgency(member, agency);
			// 2. 사용자피드백 및 리다이렉트
			redirectAttr.addFlashAttribute("msg", "기획사 회원가입성공");
			// redirect:/ - 인덱스페이지(welcome file)로 이동
			// welcome file로 바로 찾게 되면 redirectAttr을 처리할 수 없음
		} catch (Exception e) {
			log.error("회원가입 오류!", e);
			throw e;
		}
		return "redirect:/";
	}
	
	// 방법2. handler mapping한테 security 인증된 사용자 authentication 요청하기
	@GetMapping("/memberTest.do")
	public void memberTest(Authentication authentication, Model model) {
		Fan principal = (Fan) authentication.getPrincipal();
		model.addAttribute("loginMember", principal);
		
		log.debug("authentication = {}", authentication);
		// authentication = org.springframework.security.authentication.UsernamePasswordAuthenticationToken@23abe407: Principal: Member(id=honggd, password=$2a$10$qHHeJGgQ9teamJyIJFXbyOBtl7nIsQ37VP2jrz89dnDA7LgzS.nYi, name=카길동, gender=M, birthday=2021-05-04, email=honggd@naver.com, phone=01012341234, address=서울시 강남구, hobby=[운동,  등산], enrollDate=2021-05-20, authorities=[ROLE_USER], enabled=true); Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@166c8: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: B95C1041773474D93729781512D4490A; Granted Authorities: ROLE_USER
		log.debug("principal = {}", principal);
	}
}