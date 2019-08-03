package com.uni.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.security.access.prepost.PreAuthorize;


/*
 *  작성자 : 임태양
 *  작업실 컨트롤러
 *  
 *  */

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.domain.SinchungVO;
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_ShinChungVO;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uni.domain.uni_hotTopicVO;
import com.uni.domain.uni_workplace_iVO;
import com.uni.service.WorkPlaceService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/uniform/*")
public class WorkPlaceController {

	@Autowired
	private WorkPlaceService service;

	@GetMapping("/leaseInsert")
	public void leaseInsert() {
		log.info("leaseInsert");
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

	@Transactional
	@RequestMapping(value = "workplaceList", method = RequestMethod.GET)
	public void listG(@RequestParam("location") String location, @RequestParam("SfirstDate") String SfirstDate,
			@RequestParam("SlastDate") String SlastDate, @RequestParam("selectChoice") String type, Model model) {
		log.info("get : " + type + " : " + location + " : " + SfirstDate + " : " + SlastDate);
		if (SfirstDate == null && SlastDate == null) {
			SfirstDate = "fail";
			SlastDate = "fail";
		}
		if (type.equals("imde")) {
			log.info("get : " + type + " : " + location);
			log.info("get list : " + service.workPlaceList_i(location, type));
			model.addAttribute("workplace", service.workPlaceList_i(location, type));
		} else {
			log.info("get : " + type + " : " + location);
			log.info("get list : " + service.workPlaceList_s(location, type, SfirstDate, SlastDate));
			model.addAttribute("workplace", service.workPlaceList_s(location, type, SfirstDate, SlastDate));
		}
		log.info("get avg : " + service.avg_star(location, type));
		model.addAttribute("avg_star", service.avg_star(location, type));
		model.addAttribute("type", type);
		model.addAttribute("location", location);
		model.addAttribute("SfirstDate", SfirstDate);
		model.addAttribute("SlastDate", SlastDate);
	}

	@Transactional
	@RequestMapping(value = "workplaceList", method = RequestMethod.POST)
	public void listP(String location, String SfirstDate, String SlastDate, String type, Model model) {
		log.info("post : " + type + " : " + location + " : " + SfirstDate + " : " + SlastDate);
		if (SfirstDate == null && SlastDate == null) {
			SfirstDate = "fail";
			SlastDate = "fail";
		}
		if (type.equals("imde")) {
			log.info("post : " + type + " : " + location);
			log.info(" post list : " + service.workPlaceList_i(location, type));
			model.addAttribute("workplace", service.workPlaceList_i(location, type));
		} else {
			log.info("post : " + type + " : " + location + " : " + SfirstDate + " : " + SlastDate);
			log.info("post list : " + service.workPlaceList_s(location, type, SfirstDate, SlastDate));
			model.addAttribute("workplace", service.workPlaceList_s(location, type, SfirstDate, SlastDate));
		}
		log.info("post avg : " + service.avg_star(location, type));
		model.addAttribute("avg_star", service.avg_star(location, type));
		model.addAttribute("type", type);
		model.addAttribute("location", location);
		model.addAttribute("SfirstDate", SfirstDate);
		model.addAttribute("SlastDate", SlastDate);
	}
	
	@RequestMapping(value = "sinchung", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public ResponseEntity<List<SinchungVO>> sinchung(Long no) {
		log.info("sinchung : " + service.sinchungList(no));
		return new ResponseEntity<List<SinchungVO>>(service.sinchungList(no), HttpStatus.OK);
	}
	
	// 임대 작업실 데이터베이스 Crud
	@PostMapping(value="/workplaceI")
	public String insertWorkSpace(uni_workplace_iVO vo) {
		log.info("workplaceI Insert"+vo);
		service.insertWorkPlace_i(vo);
		return null;
	}
	
	// 임대 작업실 데이터베이스 crUd
	@PostMapping(value="/updateWorkplace")
	public String updateWorkSpace(uni_workplace_iVO vo) {
		log.warn("workplaceI update"+vo);
		service.updateWorkPlace_i(vo);
		return null;
	}
	
	// 작업실 수정 Form
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/leaseUpdate")
	public void getUpdate(@RequestParam("ino") int ino ,Model model) {
		log.info("updateForm: "+ino);
		log.warn("update previous: "+service.read(ino));
		model.addAttribute("workplaceVO", service.read(ino));
	}
	
	// rentDetail get
	@GetMapping(value = "/rentDetail")
	public void getRentDetail(@RequestParam("type") String type, @RequestParam("no") int no, Model model) {
		log.warn("get Rent Detail");
		
		if(type.equals("share")) {
			// TODO 아직 미완성
		}
		
		if(type.equals("imde")) {
			
			//TODO 서버에서 시간 받아오기
			Calendar cal = Calendar.getInstance();
			int hourback = cal.get(Calendar.HOUR_OF_DAY);
			int hourfront = hourback;
			log.warn("this hour: "+hourback);
			if(hourback %2 != 0) {
				hourback += 1;
			}
			if(hourback == 24) {
				hourback = 0;
			}
			model.addAttribute("hourback", hourback);
			model.addAttribute("hourfront", hourfront);
			
			//TODO ino값으로 sinchung table에서 신청 내역이 있는지 체크
			List<uni_ShinChungVO> shinChungList = service.getShinChung(no);
			model.addAttribute("shinChungList", shinChungList);
			
			// TODO ino 값으로 workplace_i에서 필요한 정보 추출, 첨부파일 테이블에서 ino 값으로 정보 추출
			uni_workplace_iVO vo = service.read(no);
			String thumbnail = vo.getThumbnail();
			thumbnail.replace("Is_", "");
			log.info(thumbnail);
			vo.setThumbnail(thumbnail);
			model.addAttribute("workplaceVO",vo);
		}
		
	}
	
	
	@PostMapping("/insertShinChung")
	public String insertShinChung(uni_ShinChungVO vo) {
		//TODO 데이터 넘어오나 확인
		log.info(vo);
		// DB Insert 할 때 중복비교
		service.insertShinChung(vo);
		return "redirect:/uniform/myPage?mno="+vo.getMno();
	}



}
