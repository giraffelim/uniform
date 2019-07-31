package com.uni.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_hotTopicVO;
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

	@Transactional
	@Override
	public void insertSelectKey(uni_MemberVO member) {
		mapper.insertSelectKey(member);
		mapper.insert(member.getMno());
		
		
		
	}

	@Override
	public uni_MemberVO checkID(String userID) {

		log.info("--------------- userid : " + mapper.checkID(userID));
		return mapper.checkID(userID);
	}
	
	@Transactional
	@Override
	public void insertInfoMember(uni_MemberVO member) {
		// TODO Auto-generated method stub
		mapper.insertInfoMember(member);
		mapper.insert(member.getMno());
	}

	@Override
	public uni_MemberVO confirm(String name, String phone) {
		// TODO Auto-generated method stub
		return mapper.confirm(name, phone);
	}

	@Override
	public void mergeGoogle(uni_MemberVO vo) {
		// TODO Auto-generated method stub
		 mapper.mergeGoogle(vo);
	}

	@Override
	public void mergeNaver(uni_MemberVO vo) {
		// TODO Auto-generated method stub
		mapper.mergeNaver(vo);
	}

	
	@Override
	public String CurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		Date date = new Date();
		String CurrentDate = sdf.format(date);

		System.out.println(CurrentDate);

		return CurrentDate;
	}

	@Override

	public boolean updateMember(uni_MemberVO vo) {
		
		boolean resultUpdate = mapper.updateMember(vo)== 1;
		
		return resultUpdate;
	}

	public List<uni_hotTopicVO> list() {
		return mapper.readHotTopic();
	}

	@Override
	public List<uni_hotTopicVO> listImde() {
		return	mapper.readHotTopicImde();
	}

	@Override
	public uni_MemberVO getMember(int mno) {
		// TODO Auto-generated method stub
		return mapper.readMember(mno);
	}

}
