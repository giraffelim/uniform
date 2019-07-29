package com.uni.controller;

/*
 *  작성자 : 임태양
 *  작업실 컨트롤러
 *  
 *  */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/uniform/*")
public class WorkPlaceController {
	
	@GetMapping("/leaseInsert")
	public void leaseInsert() {
		log.info("leaseInsert,jsp");
	}
}
