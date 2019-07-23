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
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Autowired
	private PasswordEncoder pwencoder;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String find_id(String name, String email, Model model) {
		log.info(name + " : " + email);
		uni_MemberVO member = service.find_id(name, email);
		model.addAttribute("find_id", member);
		return "login";
	}

	@RequestMapping(value = "find_pw", method = RequestMethod.POST)
	public String find_pw(String userPW, String userID, String email, Model model) {
		UUID uuid = UUID.randomUUID();
		String str = Long.toString(uuid.getLeastSignificantBits(), 16);
		userPW = str.substring(9);

		log.info(userPW + " : " + userID + " : " + email);

		String encoding_userPW = pwencoder.encode(userPW);

		if (service.find_pw(encoding_userPW, userID, email)) {

			String subject = "UNIFORM 임시 비밀번호";
			final String msg = "<div align='center' style='border: 1px solid black'>"
					+ "<h3 style='color: blue'>임시 비밀번호 <h3>" + "<div style='font-size: 130%'> 임시 비밀번호 : <strong>"
					+ userPW + "<strong> 입니다.";

			final MimeMessagePreparator preparator = new MimeMessagePreparator() {

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {

					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("uniform@gmail.com");
					helper.setTo(email);
					helper.setSubject(subject);
					helper.setText(msg, true);
				}
			};
			mailSender.send(preparator);
		}
		model.addAttribute("find_pw", service.find_pw(encoding_userPW, userID, email));
		return "login";
	}

}
