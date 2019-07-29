package com.uni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.service.WorkPlaceService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/uniform/*")
public class MapController {

	@Autowired
	private WorkPlaceService service;

	@RequestMapping(value = "map_list", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE }, method = RequestMethod.GET)
	public ResponseEntity<?> workPlaceList(String location, String type, String SfirstDate, String SlastDate) {
		log.info("workPlaceList : " + location + " : " + type + " : " + SfirstDate + " : " + SlastDate);
		if (type.equals("imde")) {
			return new ResponseEntity<List<IWorkPlaceVO>>(service.workPlaceList_i(location, type), HttpStatus.OK);
		} else {
			return new ResponseEntity<List<SWorkPlaceVO>>(
					service.workPlaceList_s(location, type, SfirstDate, SlastDate), HttpStatus.OK);
		}
	}

}
