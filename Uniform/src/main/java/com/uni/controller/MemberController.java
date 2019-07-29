package com.uni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_hotTopicVO;
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
		member.setUserPW(pwencoder.encode(member.getUserPW()));
		service.insertSelectKey(member);

		log.info("==========================이것은인코딩후패스워드:" + member.getUserPW());
		return "redirect:/uniform/index";
	}

	@GetMapping("/uniform/index")
	public void index() {

	}

	// end user가 로그인화면에서 input id에 아이디를 입력했을 경우
	// 아이디의 존재 유무를 확인해주는 컨트롤러
	@GetMapping(value = "/idcheck/{id}", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String confirmID(@PathVariable("id") String id) {
		uni_MemberVO vo = service.checkID(id);
		log.info("uni_Membr: " + vo);
		return vo == null ? "okay" : "";

	}

	// index에서 마이페이지 클릭시 이동
	@GetMapping("/mypage")
	public void mypage() {
		log.info("=======================mypage 컨트롤러==============================");
	}

	// 마이페이지에서 profile 수정버튼 클릭시 회원정보 수정 페이지로 이동
	@GetMapping("/MemberModify")
	public void memberModify() {
		log.info("=======================memberModify컨트롤러=========================");
	}

	// index에서 작업실 share클릭시 핫토핏 리스트로 이동
	@GetMapping("/hotTopicList")
	public void hotTopicList(Model model) {
		log.info("=======================hotTopicList컨트롤러============================");
		String CurrentDate = service.CurrentDate();
		model.addAttribute("currentDate", CurrentDate);
		log.info("=======================" + CurrentDate);

		List<uni_hotTopicVO> hotTopicListImde = service.listImde();
		List<uni_hotTopicVO> hotTopicList = service.list();
		for (int i = 0; i < hotTopicList.size(); i++) {
			log.info(i + "번째 인덱스 값" + hotTopicList.get(i));

		}
		model.addAttribute("hotTopicList", hotTopicList);
		model.addAttribute("hotTopicListImde", hotTopicListImde);

	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	// 핫토픽에서 검색 시 값(지역, 시작, 끝 날짜, 타입) 을 보내주는 컨트롤러
	@GetMapping("/workplaceList")
	public void workplaceList(@RequestParam("location") String location, @RequestParam("firstDate") String firstDate,
			@RequestParam("lastDate") String lastDate, @RequestParam("selectChoice") String selectChoice, Model model) {
		model.addAttribute("location", location);
		model.addAttribute("firstDate", firstDate);
		model.addAttribute("lastDate", lastDate);
		model.addAttribute("selectChoice", selectChoice);

	}

	@GetMapping("/goShare")
	public void goShare() {

	}

	@GetMapping("/goImde")
	public void goImde() {

	}

}
