package com.simpson.kisen.member.controller;

import java.beans.PropertyEditor;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.member.Config;
import com.simpson.kisen.member.MailService;
import com.simpson.kisen.member.model.KakaoProfile;
import com.simpson.kisen.member.model.OAuthToken;
import com.simpson.kisen.member.model.service.MemberService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({ "loginMember", "socialMember", "loginMemberAuthorities" })
public class MemberController {

	private String pwdKey = "pwd1234";

	@Autowired
	private MemberService memberService;

	private MailService mailService;

	// 암호화 처리
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("/login.do")
	// @RequestHeader를 통해 Referer를 가져옴, referer가 없는 경우를 대비해 required는 false로 설정
	public void memberLogin(Model model) throws Exception {

		// 구글 로그인 URL 생성
		String googleUrl = "https://accounts.google.com/o/oauth2/v2/auth?" + "scope=email profile openid"
				+ "&response_type=code"
				+ "&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oauth2.example.com/token" + "&client_id="
				+ "641021112982-qigvjsrvvjorg2dojtiqbu98gfbto16t.apps.googleusercontent.com" + "&redirect_uri="
				+ "http%3A%2F%2Flocalhost%3A9090%2Fkisen%2Fmember%2Flogin%2Fgoogle" + "&access_type=offline";

		model.addAttribute("googleUrl", googleUrl);

	}

	@GetMapping("/signupTerm.do")
	public void signupTerm() {
	}

	@GetMapping("/signup.do")
	public void signup() {
	}

	@GetMapping("/signupAgency.do")
	public void signupAgency() {
	}

	@GetMapping("/searchId.do")
	public void searchId() {
	}

	@GetMapping("/searchPwd.do")
	public void searchPwd() {
	}

	@GetMapping("/signupSocialAgency.do")
	public void signupSocialAgency() {
	}

	@GetMapping("/signupSocial.do")
	public void signupSocial() {
	}

	/**
	 * 아이디 중복검사
	 */
	@GetMapping("/checkIdDuplicate.do")
	// ResponseEntity에서 처리해주기 때문에 responseBody 필요없음
	// ResponseEntity의 요소로 Map을 리턴
	public ResponseEntity<Map<String, Object>> checkIdDuplicate(@RequestParam String id) {
		// 1. 업무로직
		// 저 아이디로 기존회원이 있는가 확인
		Fan member = memberService.selectOneMember(id);
		// member가 null인지의 여부를 변수에 담아둠 (null이어야 true)
		boolean available = member == null;

		// 2. map에 요소 저장 후 리턴
		// model필요 없음
		Map<String, Object> map = new HashMap<>();
		map.put("available", available);
		map.put("id", id);

		// ResponseEntity객체를 만들어서 전달
		return ResponseEntity.ok() // 응답헤더 200번
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE) // "application/json;charset=UTF-8"
				.body(map); // body에 map담기
	}

	/**
	 * java.sql.Date, java.util.Date 필드에 값대입시 사용자 입력값이 ""인 경우, null로 처리될 수 있도록 설정
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
	public String memberEnroll(@ModelAttribute Fan member, @RequestParam String selectEmail,
			@RequestParam String addressExt1, @RequestParam String addressExt2, @RequestParam String addressExt3,
			RedirectAttributes redirectAttr) {
		log.info("member = {}", member);
		try {
			// member에 모든 주소 다시 세팅
			member.setAddress(member.getAddress() + "-" + addressExt1 + "-" + addressExt2 + "-" + addressExt3);
			// member에 선택여부에 따른 이메일 세팅
			if ("1".equals(selectEmail) == false) {
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
			redirectAttr.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인 후 사용하실 수 있습니다.");
		} catch (Exception e) {
			log.error("회원가입 오류!", e);
			throw e;
		}
		return "redirect:/";
	}

	@PostMapping("/signupAgency.do")
	public String memberAgencyEnroll(@ModelAttribute Fan member, @RequestParam String selectEmail,
			@RequestParam String addressExt1, @RequestParam String addressExt2, @RequestParam String addressExt3,
			@ModelAttribute Agency agency, @RequestParam String fanNoExt1, @RequestParam String fanNoExt2,
			RedirectAttributes redirectAttr) {
		log.info("member = {}", member);
		try {
			// member에 모든 주소 다시 세팅
			member.setAddress(member.getAddress() + "-" + addressExt1 + "-" + addressExt2 + "-" + addressExt3);
			// member에 선택여부에 따른 이메일 세팅
			if ("1".equals(selectEmail) == false) {
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
			redirectAttr.addFlashAttribute("msg", "기획사 회원가입 신청이 완료되었습니다. 관리자가 승인 후 기획사 권한으로 이용하실 수 있습니다. 그 이전에는 일반 사용자 권한으로만 이용 가능합니다.");
			// redirect:/ - 인덱스페이지(welcome file)로 이동
			// welcome file로 바로 찾게 되면 redirectAttr을 처리할 수 없음
		} catch (Exception e) {
			log.error("회원가입 오류!", e);
			throw e;
		}
		return "redirect:/";
	}

	/**
	 * 카카오 로그인
	 */
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
		HttpEntity<MultiValueMap<String, String>> kakaoTalkRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 - POST방식으로 - response변수의 응답을 받음
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", // 토큰발급 요청주소
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
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		// Http 요청하기 - POST방식으로 - response변수의 응답을 받음
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, // 요청메소드
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
		System.out
				.println("kisen 서버 유저네임 : " + kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId()); // kisen
																														// 서버
																														// 유저네임
																														// :
																														// dbs7wl7@naver.com_1776027704
		System.out.println("kisen 서버 이메일 : " + kakaoProfile.getKakao_account().getEmail()); // kisen 서버 이메일 :
																							// dbs7wl7@naver.com
		// UUID garbagePassword = UUID.randomUUID();
		System.out.println("kisen 서버 패스워드 : " + pwdKey); // kisen 서버 패스워드 : 6d3bd309-88cc-4c18-88a0-78fea82e2c50

		String gender = (String) kakaoProfile.getKakao_account().getGender();

		System.out.println("카카오 이름, 성별, 폰, 생년월일 : " + gender + kakaoProfile.getProperties().getNickname()
				+ kakaoProfile.getKakao_account().getBirthday());

		String kakaoBirthday = kakaoProfile.getKakao_account().getBirthday();
		String birth1 = kakaoBirthday.substring(0, 2);
		String birth2 = kakaoBirthday.substring(2, 4);
		String bday = "1900-" + birth1 + "-" + birth2;
		java.sql.Date birthday = java.sql.Date.valueOf(bday);
		String fanId = "k_" + kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId();

		// user object
		Fan kakaoMember = Fan.builder().fanId(fanId).password(pwdKey).email(kakaoProfile.getKakao_account().getEmail())
				.oauth("kakao").gender(kakaoProfile.getKakao_account().getGender())
				.phone(kakaoProfile.getKakao_account().getPhone_number())
				.fanName(kakaoProfile.getProperties().getNickname()).birthday(birthday).build();

		// 가입자 혹은 비가입자 체크해서 처리
		Fan originMember = memberService.selectOneMember(kakaoMember.getFanId());
		if (originMember == null) {
			// 비가입자 -> 회원가입 -> 로그인처리
			model.addAttribute("socialMember", kakaoMember);
			redirectAttr.addFlashAttribute("msg", "기존 회원이 아닙니다. 회원가입을 진행해주세요.");
			return "redirect:/member/signupTerm.do";
		} else {
			// 가입자 -> 로그인처리
			model.addAttribute("loginMember", kakaoMember);

			List<Authority> loginMemberAuthorities = memberService.selectOneAuthoriy(fanId);
			log.info("list = {}", loginMemberAuthorities);
			model.addAttribute("loginMemberAuthorities", loginMemberAuthorities);
			return "redirect:/";
		}
	}

	// 구글 로그인 콜백
	@RequestMapping(value = "/login/google")
	public String googleLogin(@RequestParam("code") String code, HttpSession session, Model model,
			RedirectAttributes redirectAttr) throws Exception {

		// 코드 확인
		System.out.println("code : " + code);

		// Access Token 발급
		JsonNode jsonToken = MemberController.getAccessToken(code);
		String accessToken = jsonToken.get("access_token").toString();
		String refreshToken = "";
		if (jsonToken.has("refresh_token")) {
			refreshToken = jsonToken.get("refresh_token").toString();
		}
		String expiresTime = jsonToken.get("expires_in").toString();
		System.out.println("Access Token : " + accessToken);
		System.out.println("Refresh Token : " + refreshToken);
		System.out.println("Expires Time : " + expiresTime);

		// Access Token으로 사용자 정보 반환
		JsonNode userInfo = MemberController.getGoogleUserInfo(accessToken);
		System.out.println(userInfo.toString());

		String email = userInfo.get("email").asText();
		String fanName = userInfo.get("name").asText();
		String fanId = "g_" + email + "_" + (userInfo.get("id").asText()).substring(0, 10);

		// user object
		Fan googleMember = Fan.builder().fanId("g_" + email + "_" + (userInfo.get("id").asText()).substring(0, 10))
				.password(pwdKey).email(email).oauth("google").fanName(fanName).build();

		// 가입자 혹은 비가입자 체크해서 처리
		Fan originMember = memberService.selectOneMember(googleMember.getFanId());
		if (originMember == null) {
			// 비가입자 -> 회원가입 -> 로그인처리
			log.info("기존 회원이 아닙니다. 자동 회원가입을 진행합니다.");
			model.addAttribute("socialMember", googleMember);
			redirectAttr.addFlashAttribute("msg", "기존 회원이 아닙니다. 회원가입을 진행해주세요.");
			return "redirect:/member/signupTerm.do";
		} else {
			// 가입자 -> 로그인처리
			model.addAttribute("loginMember", googleMember);

			List<Authority> loginMemberAuthorities = memberService.selectOneAuthoriy(fanId);
			log.info("list = {}", loginMemberAuthorities);
			model.addAttribute("loginMemberAuthorities", loginMemberAuthorities);
			return "redirect:/";
		}
	}

	public static JsonNode getAccessToken(String autorize_code) {

		final String RequestUrl = "https://www.googleapis.com/oauth2/v4/token";

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id",
				"641021112982-qigvjsrvvjorg2dojtiqbu98gfbto16t.apps.googleusercontent.com"));
		postParams.add(new BasicNameValuePair("client_secret", "asd_jNrIPXxXujNqf2JlyCVL"));
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:9090/kisen/member/login/google")); // 리다이렉트
																													// URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}

		return returnNode;

	}

	public static JsonNode getGoogleUserInfo(String autorize_code) {

		final String RequestUrl = "https://www.googleapis.com/oauth2/v2/userinfo";

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpGet get = new HttpGet(RequestUrl);

		JsonNode returnNode = null;

		// add header
		get.addHeader("Authorization", "Bearer " + autorize_code);

		try {
			final HttpResponse response = client.execute(get);
			final int responseCode = response.getStatusLine().getStatusCode();

			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

			System.out.println("\nSending 'GET' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;
	}

	@GetMapping("/searchIdSendMail.do")
	public String sendMail(HttpServletRequest req, @RequestParam String email, @RequestParam String selectEmail) {
//	   Config.gmailId = req.getServletContext().getInitParameter("gmailId");
//	   Config.gmailPw = req.getServletContext().getInitParameter("gmailPw");
		mailService = new MailService(Config.gmailId, Config.gmailPw, Config.mailFrom, Config.mailFromName);

		if ("1".equals(selectEmail) == false) {
			email = email + "@" + selectEmail;
		}
		Fan member = memberService.selectOneMemberByEmail(email);
		if (member != null) {
			String fanId = member.getFanId();

			// send(email, title, content)
			mailService.send(email, "[(주)kisen] 아이디찾기 안내메일입니다.",
					"<div style=\"background-color: rgb(241, 241, 241); width: 900px; text-align: center; margin: 20px; padding: 20px;\">\r\n"
							+ "    <img src=\"https://blogfiles.pstatic.net/MjAyMTA2MjVfMjk4/MDAxNjI0NjA5ODQzMDQx.LJecEdDc183KLHTb-4MIJZd0b3Wih7dquRSJaqLYc2Mg.4hjwxApg9j2nPHj9erBQn_gw6hJP86v3rIaNdi5bwgEg.PNG.dbs7wl7/kisen_logo.png\" style=\"width: 300px;\">\r\n"
							+ "    <p style=\"font-size: large; margin-bottom: 10px;\">안녕하세요. K-POP 굿즈 종합쇼핑몰 kisen입니다.</p>\r\n"
							+ "    <p style=\"font-size: large; margin-bottom: 10px;\">고객님의 아이디는 <span style=\"font-weight: bolder;\">"
							+ fanId + "</span>입니다.</p>\r\n"
							+ "    <p style=\"font-size: large; margin-bottom: 10px;\">해당 아이디로 로그인을 진행해주세요.</p>\r\n"
							+ "    <div style=\"background-color: rgb(109, 51, 104); width: 300px; height: 40px; margin: 30px auto; line-height: 40px; border-radius: 20px;\">\r\n"
							+ "    <a href=\"http://localhost:9090/kisen/member/login.do\" style=\"color: white; text-decoration: none; font-size: large; \">로그인하러 가기</a>\r\n"
							+ "    </div>\r\n" + "</div>");
		}
		return "redirect:/member/searchId.do";
	}

	@GetMapping("/checkInfoEmail.do")
	public ResponseEntity<Map<String, Object>> checkInfoEmail(@RequestParam String name, @RequestParam String email) {
		Map<String, Object> param = new HashMap<>();
		param.put("name", name);
		param.put("email", email);
		// 1. 업무로직
		Fan member = memberService.searchOneMember(param);
		boolean available = member != null;
		log.info("available = {}", available);
		// 2. map에 요소 저장 후 리턴
		// model필요 없음
		Map<String, Object> map = new HashMap<>();
		map.put("available", available);
		map.put("name", name);

		// ResponseEntity객체를 만들어서 전달
		return ResponseEntity.ok() // 응답헤더 200번
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE) // "application/json;charset=UTF-8"
																							// -> header값으로 json이라는 것을
																							// 알림
				.body(map); // body에 map담기
	}

	@GetMapping("/checkInfoPhone.do")
	public ResponseEntity<Map<String, Object>> checkInfoPhone(@RequestParam String name, @RequestParam String phone) {
		log.info("phone = {}", phone);
		Map<String, Object> param = new HashMap<>();
		param.put("name", name);
		param.put("phone", phone);
		// 1. 업무로직
		Fan member = memberService.selectOneMemberByPhoneGet(param);
		boolean available = member != null;
		log.info("available = {}", available);

		String fanId = null;
		if (member != null) {
			fanId = member.getFanId();
		}
		log.info(fanId);
		// 2. map에 요소 저장 후 리턴
		// model필요 없음
		Map<String, Object> map = new HashMap<>();
		map.put("available", available);
		map.put("fanId", fanId);

		// ResponseEntity객체를 만들어서 전달
		return ResponseEntity.ok() // 응답헤더 200번
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE) // "application/json;charset=UTF-8"
																							// -> header값으로 json이라는 것을
																							// 알림
				.body(map); // body에 map담기
	}

	@GetMapping("/searchPwdSendMail.do")
	public String sendMailPwd(HttpServletRequest req, @RequestParam String email, @RequestParam String selectEmail) {
//	   Config.gmailId = req.getServletContext().getInitParameter("gmailId");
//	   Config.gmailPw = req.getServletContext().getInitParameter("gmailPw");
		mailService = new MailService(Config.gmailId, Config.gmailPw, Config.mailFrom, Config.mailFromName);

		if ("1".equals(selectEmail) == false) {
			email = email + "@" + selectEmail;
		}
		Fan member = memberService.selectOneMemberByEmail(email);
		if (member != null) {
			String tempPwd = excuteGenerate();
			member.setPassword(tempPwd);
			log.info(tempPwd);

			updatePwdToTempPwd(member);

			// send(email, title, content)
			mailService.send(email, "[(주)kisen] 비밀번호찾기 안내메일입니다.",
					"<div style=\"background-color: rgb(241, 241, 241); width: 900px; text-align: center; margin: 20px; padding: 20px;\">\r\n"
							+ "    <img src=\"https://blogfiles.pstatic.net/MjAyMTA2MjVfMjk4/MDAxNjI0NjA5ODQzMDQx.LJecEdDc183KLHTb-4MIJZd0b3Wih7dquRSJaqLYc2Mg.4hjwxApg9j2nPHj9erBQn_gw6hJP86v3rIaNdi5bwgEg.PNG.dbs7wl7/kisen_logo.png\" style=\"width: 300px;\">\r\n"
							+ "    <p style=\"font-size: large; margin-bottom: 10px;\">안녕하세요. K-POP 굿즈 종합쇼핑몰 kisen입니다.</p>\r\n"
							+ "    <p style=\"font-size: large; margin-bottom: 10px;\">고객님의 임시비밀번호는 <span style=\"font-weight: bolder;\">"
							+ tempPwd + "</span>입니다.</p>\r\n"
							+ "    <p style=\"font-size: large; margin-bottom: 10px;\">해당 비밀번호로 로그인 한 후 비밀번호를 변경하세요.</p>\r\n"
							+ "    <div style=\"background-color: rgb(109, 51, 104); width: 300px; height: 40px; margin: 30px auto; line-height: 40px; border-radius: 20px;\">\r\n"
							+ "    <a href=\"http://localhost:9090/kisen/member/login.do\" style=\"color: white; text-decoration: none; font-size: large; \">로그인하러 가기</a>\r\n"
							+ "    </div>\r\n" + "</div>");
		}
		return "redirect:/member/searchPwd.do";
	}

	// 임시비밀번호 생성
	private String excuteGenerate() {

		int pwdLength = 8;
		final char[] passwordTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
				'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
				'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^',
				'&', '*', '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };

		Random random = new Random(System.currentTimeMillis());
		int tablelength = passwordTable.length;
		StringBuffer buf = new StringBuffer();

		for (int i = 0; i < pwdLength; i++) {
			buf.append(passwordTable[random.nextInt(tablelength)]);
		}
		return buf.toString();
	}

	// 임시비밀번호롤 수정
	private int updatePwdToTempPwd(Fan member) {
		// 0. 비밀번호 암호화처리
		String rawPassword = member.getPassword();
		log.info("rawPassword = {}", rawPassword);
		String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
		// member에 암호화된 비밀번호 다시 세팅
		member.setPassword(encodedPassword);

		log.info("member(암호화처리 이후) = {}", member);
		int result = memberService.updatePwdToTempPwd(member);
		return result;
	}

	@PostMapping("/checkInfoPhoneForPwd.do")
	public String checkInfoPhoneForPwd(
			@ModelAttribute Fan fan,
			RedirectAttributes redirectAttr) {
		// 1. 업무로직
		Fan member = memberService.selectOneMemberByPhone(fan);

		String msg = null;
		String tempPwd = null;
		if (member != null) {
			tempPwd = excuteGenerate();
			member.setPassword(tempPwd);
			log.info(tempPwd);

			updatePwdToTempPwd(member);
			// 2. map에 요소 저장 후 리턴
			// model필요 없음
			log.info("tempPwd = {}", tempPwd);
			msg = "고객님의 임시 비밀번호는 [ " + tempPwd + " ] 입니다. 해당 비밀번호로 로그인 한 뒤 비밀번호를 변경해주세요.";
		} else {
			msg = "입력된 정보로 정확한 회원정보가 조회되지 않습니다. 정보를 다시 입력하거나 이메일로 찾기를 이용하세요.";			
		}

		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/member/searchPwd.do";
	}
	
	@GetMapping("/sendSMS.do")
	ResponseEntity<Map<String, Object>> sendSms(@RequestParam String phone, @RequestParam String rndStr) throws Exception { 
		
		  log.info("phone = {}", phone);
		  log.info("rndStr = {}", rndStr);
	      String hostNameUrl = "https://sens.apigw.ntruss.com";           // 호스트 URL
	      String requestUrl= "/sms/v2/services/";                         // 요청 URL
	      String requestUrlType = "/messages";                            // 요청 URL
	      String accessKey = "rw5OvvURFyufoFN9ATNF";                                       // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
	      String secretKey = "n7M14qzuy9WAe31IFBZYGkBSXNqnfmPWfIsK8upB";                                // 2차 인증을 위해 서비스마다 할당되는 service secret
	      String serviceId = "ncp:sms:kr:268856574555:kisen";                                   // 프로젝트에 할당된 SMS 서비스 ID
	      String method = "POST";                                 // 요청 method
	      String timestamp = Long.toString(System.currentTimeMillis());    // current timestamp (epoch)
	      requestUrl += serviceId + requestUrlType;
	      String apiUrl = hostNameUrl + requestUrl;
	      
	      // JSON 을 활용한 body data 생성
	      
	      org.json.simple.JSONObject bodyJson = new org.json.simple.JSONObject();
	      org.json.simple.JSONObject toJson = new org.json.simple.JSONObject();
	      org.json.simple.JSONArray  toArr = new org.json.simple.JSONArray();

	       toJson.put("subject","");            // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
	       toJson.put("content","[(주)kisen] 본인인증 번호는 [ " + rndStr + " ] 입니다. 정확히 입력해주세요."); // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
	       toJson.put("to", phone);               // 수신번호 목록  * 최대 50개까지 한번에 전송할 수 있습니다.
	       toArr.add(toJson);
	       
	       bodyJson.put("type","SMS");            // 메시지 Type (sms | lms)
	       bodyJson.put("contentType","COMM");         // 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
	       bodyJson.put("countryCode","82");      // 국가 전화번호
	       bodyJson.put("from","01089959705");            // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.      
	       bodyJson.put("subject","");            // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
	       bodyJson.put("content", "[(주)kisen] 본인인증 번호는 [" + rndStr + " ] 입니다. 정확히 입력해주세요.");            // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
	       bodyJson.put("messages", toArr);      
	       
	       String body = bodyJson.toJSONString();
	       log.info(body);
	       
	        try {
	            URL url = new URL(apiUrl);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setUseCaches(false);
	            con.setDoOutput(true);
	            con.setDoInput(true);
	            con.setRequestProperty("content-type", "application/json");
	            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
	            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
	            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
	            con.setRequestMethod(method);
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            
	            wr.write(body.getBytes());
	            wr.flush();
	            wr.close();

	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            System.out.println("responseCode" +" " + responseCode);
	            if(responseCode==202) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }

	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            log.info(response.toString());
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        
	        // 성공
	        Map<String, Object> map = new HashMap<>();	       
	        map.put("success", "success");

	        // ResponseEntity객체를 만들어서 전달
			return ResponseEntity.ok() // 응답헤더 200번
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE) // "application/json;charset=UTF-8"
					.body(map); // body에 map담기
	    }
	
	   public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
	       String space = " ";                    // one space
	       String newLine = "\n";                 // new line
	       
	       String message = new StringBuilder()
	           .append(method)
	           .append(space)
	           .append(url)
	           .append(newLine)
	           .append(timestamp)
	           .append(newLine)
	           .append(accessKey)
	           .toString();

	       SecretKeySpec signingKey;
	       String encodeBase64String;
	      try {
	         
	         signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
	         Mac mac = Mac.getInstance("HmacSHA256");
	         mac.init(signingKey);
	         byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
	          encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
	      } catch (UnsupportedEncodingException e) {
	         encodeBase64String = e.toString();
	      }
	     return encodeBase64String;
	   }
	  

}