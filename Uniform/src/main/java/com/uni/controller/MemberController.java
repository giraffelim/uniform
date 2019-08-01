package com.uni.controller;


import javax.inject.Inject;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;
import com.uni.service.CommonService;
import com.uni.domain.uni_hotTopicVO;
import com.uni.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

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
	/*
	 * @GetMapping("/MemberModify") public void memberModify() {
	 * log.info("=======================memberModify컨트롤러=========================");
	 * }
	 */

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

	//회원정보수정으로 이동
	@GetMapping("/uniform/updateMember")
	public void memberUpdate() {
		log.info("==get!!!! updateMember 호출됨=========================");
	}
	//회원정보수정
	
	@PostMapping("/uniform/updateMember")
	public String memberUpdate(RedirectAttributes rttr, uni_MemberVO vo) {
		log.info("==post!!!! updateMember 호출됨=========================" + vo);
		
		vo.setUserPW(pwencoder.encode(vo.getUserPW()));
		service.updateMember(vo);

		return "redirect:/";
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
		
	
	// 프로필사진 업로드
	@PostMapping(value = "/uploadProfile", produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> uploadProfile(MultipartFile[] uploadFile) {
		log.info("===============uploadPhoto 호출됨 =======================");

		return service.uploadProfile(uploadFile);
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("getFile 호출됨=============================" + fileName);
		return service.getFile(fileName);
	}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("deleteFile 호출됨=============================" + fileName);

		return service.deleteFile(fileName);
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
	
	// member return by mno
	@GetMapping(value = "/memberByMno", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public uni_MemberVO getMember(int mno) {
		log.info("memberByMno: "+mno);
		return service.getMember(mno);
	}


}
