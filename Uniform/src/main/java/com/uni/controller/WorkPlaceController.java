package com.uni.controller;

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
	
	
	@Transactional
	@RequestMapping(value = "workPlaceList", method = RequestMethod.GET)
	public void list(Model model) {
		log.info("list : " + service.workPlaceList());
		log.info("avg : " + service.avg_star());
		model.addAttribute("workplace", service.workPlaceList());
		model.addAttribute("avg_star", service.avg_star());
	}
	
	@RequestMapping(value = "map_list", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE }, method = RequestMethod.GET)
	public ResponseEntity<List<uni_workplace_iVO>> workPlaceList() {
		log.info("workPlaceList");
		return new ResponseEntity<>(service.workPlaceList(), HttpStatus.OK);
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
			// TODO ino 값으로 workplace_i에서 필요한 정보 추출, 첨부파일 테이블에서 ino 값으로 정보 추출
			uni_workplace_iVO vo = service.read(no);
			String thumbnail = vo.getThumbnail();
			thumbnail.replace("Is_", "");
			log.info(thumbnail);
			vo.setThumbnail(thumbnail);
			model.addAttribute("workplaceVO",vo);
		}
		
	}


}
