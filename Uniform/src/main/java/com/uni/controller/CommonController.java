package com.uni.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@Autowired
	private uni_MemberMapper mapper;
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/login")
	public void login(HttpServletRequest request, String error, Model model) {
		// 인증 페이지로 이동하기 전 URL 기억
		log.warn("error: "+ error);
		if(error != null) {
			model.addAttribute("error", "비밀번호를 확인해주세요");
		}
		log.info("--- get login ---");

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
	

}
