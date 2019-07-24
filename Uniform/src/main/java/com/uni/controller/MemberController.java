package com.uni.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
<<<<<<< .merge_file_a09772
		model.addAttribute("find_pw", service.find_pw(userPW, userID, email));
=======

		String encoding_userPW = pwencoder.encode(userPW);

		if (service.find_pw(encoding_userPW, userID, email)) {

			String subject = "UNIFORM �엫�떆 鍮꾨�踰덊샇";
			final String msg = "<div align='center' style='border: 1px solid black'>"
					+ "<h3 style='color: blue'>�엫�떆 鍮꾨�踰덊샇 <h3>" + "<div style='font-size: 130%'> �엫�떆 鍮꾨�踰덊샇 : <strong>"
					+ userPW + "<strong> �엯�땲�떎.";

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
>>>>>>> .merge_file_a11128
		return "login";
	}
	@GetMapping("/join")
	public void join() {
		log.info("join");
	}
	
	@PostMapping("/join")
	public String join(uni_MemberVO member) {
		 member.setUserPW(pwencoder.encode(member.getUserPW()));
		service.insertSelectKey(member);
	
		
		 log.info("==========================이것은인코딩후패스워드:" +member.getUserPW());
		return "redirect:/uniform/index";
	}
	
	@GetMapping("/uniform/index")
	public void index() {
		
	}
	
	// end user가 로그인화면에서 input id에 아이디를 입력했을 경우
    // 아이디의 존재 유무를 확인해주는 컨트롤러
    @GetMapping(value = "/idcheck/{id}", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String confirmID(@PathVariable("id") String id){
        uni_MemberVO vo = service.checkID(id);
        log.info("uni_Membr: "+ vo);
        return vo == null ? "okay" : "";
        
    }
	

}
