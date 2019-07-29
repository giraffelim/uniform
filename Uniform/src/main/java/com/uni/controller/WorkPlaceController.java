package com.uni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

/*
 *  작성자 : 임태양
 *  작업실 컨트롤러
 *  
 *  */

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

}
