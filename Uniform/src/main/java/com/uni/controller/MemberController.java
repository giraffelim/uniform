package com.uni.controller;

import org.springframework.stereotype.Controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uni.domain.uni_MemberVO;
import com.uni.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/uniform/*")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String find_id(String name, String email, Model model) {
		log.info(name + " : " + email);
		uni_MemberVO member = service.find_id(name, email);
		model.addAttribute("find_id", member);
		return "login";
	}

	@RequestMapping(value = "find_pw", method = RequestMethod.POST)
	public String find_pw(String userPW, String userID, String email, Model model) {
		log.info(userPW + " : " + userID + " : " + email);
		model.addAttribute("find_pw", service.find_pw(userPW, userID, email));
		return "login";
	}

}
