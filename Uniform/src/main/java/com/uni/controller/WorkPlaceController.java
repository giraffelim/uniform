package com.uni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uni.domain.uni_workplace_iVO;
import com.uni.service.WorkPlaceService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/uniform/*")
public class WorkPlaceController {
	
	@Autowired
	private WorkPlaceService service;
	
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

}
