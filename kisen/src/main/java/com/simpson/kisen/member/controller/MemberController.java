package com.simpson.kisen.member.controller;

import java.beans.PropertyEditor;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.member.model.KakaoProfile;
import com.simpson.kisen.member.model.OAuthToken;
import com.simpson.kisen.member.model.KakaoProfile.KakaoAccount.Profile;
import com.simpson.kisen.member.model.service.MemberService;

import lombok.Builder;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
@SessionAttributes({"loginMember", "kakaoMember"})
public class MemberController {
   
   private String pwdKey = "pwd1234";
   
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
   
   @GetMapping("/searchPwd.do")
   public void searchPwd() {}
   
   
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

   @GetMapping("/kakao/callback")
   public String kakaoCallback(@RequestParam String code, Model model, RedirectAttributes redirectAttr) { // data를 리턴해주는 컨트롤러 함수
      // POST방식으로 key=value 데이터를 카카오쪽으로 요청
      
      // HttpHeader 오브젝트 생성
      RestTemplate rt = new RestTemplate();
      HttpHeaders headers = new HttpHeaders();
      headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
      
      // HttpBody 오브젝트 생성
      MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
      params.add("grant_type", "authorization_code");
      params.add("client_id", "fd88614f9ea0303ee10198eee2c817e1");
      params.add("redirect_uri", "http://localhost:9090/kisen/member/kakao/callback");
      params.add("code", code); // 받아온 인증 코드 동적으로 넣기
      
      // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
      // body 데이터(params)와 header값(headers)을 가진 entity 만들기
      // why? exchange메소드에 HttpEntity<?> 오브젝트를 넣어야 하기 때문
      HttpEntity<MultiValueMap<String, String>> kakaoTalkRequest =
            new HttpEntity<>(params, headers);
      
      // Http 요청하기 - POST방식으로 - response변수의 응답을 받음
      ResponseEntity<String> response = rt.exchange(
         "https://kauth.kakao.com/oauth/token", // 토큰발급 요청주소
         HttpMethod.POST, // 요청메소드
         kakaoTalkRequest, // httpEntity (body, header)
         String.class // response의 응답이 string 데이터로 될 것!
      );
      
      // json data -> java에서 처리하기 위해 java Object로 변환
      ObjectMapper objectMapper = new ObjectMapper();
      OAuthToken oauthToken = null;
      try {
         oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
      } catch (JsonParseException e) {
         e.printStackTrace();
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      System.out.println("kakao access token : " + oauthToken.getAccess_token());
      // kakao access token : dvkkT0-g31B9SQTKx9ijLZNKLcThYkRz_7-42Qo9dZwAAAF6Kf0GXA
      
      // HttpHeader 오브젝트 생성
      RestTemplate rt2 = new RestTemplate();
      HttpHeaders headers2 = new HttpHeaders();
      headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
      headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
      
      // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
      // body 데이터(params)와 header값(headers)을 가진 entity 만들기
      // why? exchange메소드에 HttpEntity<?> 오브젝트를 넣어야 하기 때문
      HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
            new HttpEntity<>(headers2);
      
      // Http 요청하기 - POST방식으로 - response변수의 응답을 받음
      ResponseEntity<String> response2 = rt2.exchange(
         "https://kapi.kakao.com/v2/user/me", 
         HttpMethod.POST, // 요청메소드
         kakaoProfileRequest2, // httpEntity (body, header)
         String.class // response의 응답이 string 데이터로 될 것!
      );
      
      ObjectMapper objectMapper2 = new ObjectMapper();
      KakaoProfile kakaoProfile = null;
      try {
         kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
      } catch (JsonParseException e) {
         e.printStackTrace();
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      // user 오브젝트 : username, password, email
      System.out.println("카카오 아이디 (번호) : " + kakaoProfile.getId()); // 카카오 아이디 (번호) : 1776027704
      System.out.println("카카오 이메일 : " + kakaoProfile.getKakao_account().getEmail()); // 카카오 이메일 : dbs7wl7@naver.com
      System.out.println("kisen 서버 유저네임 : " + kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId()); // kisen 서버 유저네임 : dbs7wl7@naver.com_1776027704
      System.out.println("kisen 서버 이메일 : " + kakaoProfile.getKakao_account().getEmail()); // kisen 서버 이메일 : dbs7wl7@naver.com
      // UUID garbagePassword = UUID.randomUUID();
      System.out.println("kisen 서버 패스워드 : " + pwdKey); // kisen 서버 패스워드 : 6d3bd309-88cc-4c18-88a0-78fea82e2c50
      
      String gender = (String)kakaoProfile.getKakao_account().getGender();
      
      System.out.println("카카오 이름, 성별, 폰, 생년월일 : " + 
               gender + 
               kakaoProfile.getProperties().getNickname() + 
               kakaoProfile.getKakao_account().getBirthday());
      
      String kakaoBirthday = kakaoProfile.getKakao_account().getBirthday();
      String birth1 = kakaoBirthday.substring(0, 2);
      String birth2 = kakaoBirthday.substring(2, 4);
      String bday = "1900-" + birth1 + "-" + birth2;
      java.sql.Date birthday = java.sql.Date.valueOf(bday);
      
      // user object
      Fan kakaoMember = Fan.builder()
            .fanId(kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId())
            .password(pwdKey)
            .email(kakaoProfile.getKakao_account().getEmail())
            .oauth("kakao")
            .gender(kakaoProfile.getKakao_account().getGender())
            .phone(kakaoProfile.getKakao_account().getPhone_number())
            .fanName(kakaoProfile.getProperties().getNickname())
            .birthday(birthday)
            .build();
      

      // 가입자 혹은 비가입자 체크해서 처리
      Fan originMember = memberService.selectOneMember(kakaoMember.getFanId());
      if(originMember == null) {
         // 비가입자 -> 회원가입 -> 로그인처리
         log.info("기존 회원이 아닙니다. 자동 회원가입을 진행합니다.");
         // memberService.insertMember(kakaoMember);
         // model.addAttribute("kakaoMember", kakaoMember);
         redirectAttr.addFlashAttribute("kakaoMember", kakaoMember);
         return "redirect:/member/signup.do";
      } else {
         // 가입자 -> 로그인처리
         model.addAttribute("kakaoMember", kakaoMember);
         return "/member/login";
      }
   }


}