package com.uni.service;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private uni_MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder pwencoder;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Override
	public uni_MemberVO find_id(String name, String email) {
		return mapper.find_id(name, email);
	}

	@Override
	public boolean find_pw(String userPW, String userID, String email) {
		UUID uuid = UUID.randomUUID();
		String str = Long.toString(uuid.getLeastSignificantBits(), 16);
		userPW = str.substring(9);
		
		String encoding_userPW = pwencoder.encode(userPW);

		if (mapper.find_pw(encoding_userPW, userID, email)) {

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
		
		return mapper.find_pw(encoding_userPW, userID, email) == true ? true : false;
	}
}
