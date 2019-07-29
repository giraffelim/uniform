package com.uni.controller;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;
import com.uni.service.CommonService;
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
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Inject
	private uni_MemberMapper mapper;

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
	
	@GetMapping("/join")
	public void join() {
		log.info("join");
	}
	
	@PostMapping("/join")
	public String join(uni_MemberVO member) {
		log.info("join");
		log.info(member);
		if(member.getUserPW() == null) {
			// 임의의 ID, PW 지정
			member.setUserID(pwencoder.encode("uniform"));
			member.setUserPW(pwencoder.encode("uniform"));
			log.warn("addInfo ======"+member);
			service.insertInfoMember(member);
			return "redirect:/dummy";
		}else {
			 member.setUserPW(pwencoder.encode(member.getUserPW()));
			service.insertSelectKey(member);
		}
		
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
    
 // end user가 로그인화면에서 input id에 아이디를 입력했을 경우
    // 아이디의 존재 유무를 확인해주는 컨트롤러
    @GetMapping(value = "/confirm/{name}/{phone}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public uni_MemberVO confirmSnsID(@PathVariable("name") String name, @PathVariable("phone") String phone){
    	log.warn(name+","+phone);
        uni_MemberVO vo = service.confirm(name,phone);
        log.info("uni_Membr: "+ vo);
        return vo;
        
    }
    
    @PutMapping(value="/mergeMember", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
	public uni_MemberVO mergeMember(@RequestBody uni_MemberVO vo) {
    	log.warn("mergeMember ==== VO ==>"+ vo);
    	uni_MemberVO returnVO = null;
		if(vo.getGoogleId() != null) {
			// vo 넘겨서 update
			log.info("googleId Merge");
			service.mergeGoogle(vo);
			returnVO = mapper.getByGoogle(vo.getGoogleId());
		}else {
			log.info("naver Merge");
			service.mergeNaver(vo);
			returnVO = mapper.getByNaver(vo.getNaverId());
		}
		
		return returnVO;
		
	}

}
