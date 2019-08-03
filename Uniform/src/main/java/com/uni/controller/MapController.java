package com.uni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.StarAvgVO;
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

	
	// 검색한 작업실에 주소를 가져와서 지도에 띄워주는 메소드
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

	// 무한 스크롤을 이용해서 페이징하기 위해 작업실 가져오는 메소드
	@RequestMapping(value = "scroll_result", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE }, method = RequestMethod.GET)
	public ResponseEntity<?> scroll(String location, String type, String SfirstDate, String SlastDate) {
		log.info("scroll workPlaceList : " + location + " : " + type + " : " + SfirstDate + " : " + SlastDate);

		List<SWorkPlaceVO> list = service.workPlaceList_s(location, type, SfirstDate, SlastDate);
		log.info("regDate: " + list.get(0).getRegDate());

		if (type.equals("imde")) {
			return new ResponseEntity<List<IWorkPlaceVO>>(service.workPlaceList_i(location, type), HttpStatus.OK);
		} else {
			return new ResponseEntity<List<SWorkPlaceVO>>(
					service.workPlaceList_s(location, type, SfirstDate, SlastDate), HttpStatus.OK);
		}

	}

	// 검색한 작업실에 대한 별점 가져오는 메소드
	@RequestMapping(value = "/getStar", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE }, method = RequestMethod.GET)
	public List<StarAvgVO> getStars(String location, String type) {
		return service.avg_star(location, type);
	}

}
