package com.uni.controller;


/*
 *  작성자 : 임태양
 *  공통 컨트롤러
 *  OAuth2 인증 & 로그인
 *  */

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;
import com.uni.service.CommonService;
import com.uni.swp.auth.SNSLogin;
import com.uni.swp.auth.SnsValue;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@Autowired
	private uni_MemberMapper mapper;
	
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue googleSns;
	
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Inject
	private CommonService service;
	
	@RequestMapping(value = "/auth/{snsService}/callback", method= {RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallBack(@PathVariable String snsService, Model model, @RequestParam String code)  throws Exception{
		log.info("snsLoginCallBack: service="+snsService);
		
		SnsValue sns = null;
		
		if(StringUtils.equals("naver", snsService)) {
			sns = naverSns;
		}else {
			sns = googleSns;
		}
		
		boolean flag = service.readOAuthMember(sns, code);

		return "redirect:/";
	}
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/login")
	public void login(HttpServletRequest request, String error, Model model) {
		// 인증 페이지로 이동하기 전 URL 기억
		log.warn("error: "+ error);
		if(error != null) {
			model.addAttribute("error", "비밀번호를 확인해주세요");
		}
		log.info("--- get login ---");
		
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		model.addAttribute("google_url", url);
	}

	@PostMapping("/logout")
	public void logout() {
		log.info("logout");
	}
	
	// end user가 로그인화면에서 input id에 아이디를 입력했을 경우
	// 아이디의 존재 유무를 확인해주는 컨트롤러
	@GetMapping(value = "/member/{id}", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String confirmID(@PathVariable("id") String id){
		uni_MemberVO vo = mapper.read(id);
		log.info("uni_Membr: "+ vo);
		return vo == null ? "입력하신 아이디가 존재하지 않습니다" : "";
		
	}
	
	@GetMapping("/list")
	public void list() {
		
		log.warn("listasdasdas");
	}
	
	@GetMapping("/addInfo")
	public void addInfo() {
		
	}
	
	@GetMapping("/dummy")
	public void callLogout() {
		
	}
	
}
