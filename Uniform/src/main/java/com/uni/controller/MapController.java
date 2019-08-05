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
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_confirmVO;
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
		log.info("getStar : " + location + " : " + type);
		return service.avg_star(location, type);
	}

	@RequestMapping(value = "SConfirmList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public ResponseEntity<List<uni_confirmVO>> SConfirmList(Long mno) {
		log.info("sinchung : " + service.SConfirmList(mno));
		return new ResponseEntity<List<uni_confirmVO>>(service.SConfirmList(mno), HttpStatus.OK);
	}

	@RequestMapping(value = "IConfirmList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public ResponseEntity<List<uni_confirmVO>> IConfirmList(Long mno) {
		log.info("sinchung : " + service.IConfirmList(mno));
		return new ResponseEntity<List<uni_confirmVO>>(service.IConfirmList(mno), HttpStatus.OK);
	}

	@RequestMapping(value = "confirm", produces = MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.GET)
	public ResponseEntity<List<uni_confirmVO>> Scofirm(Long cno, Long mno, String flag) {
		log.info("sinchung : " + service.confirm(cno, mno, flag));
		return new ResponseEntity<List<uni_confirmVO>>(service.confirm(cno, mno, flag), HttpStatus.OK);
	}

	@RequestMapping(value = "new_review", produces = MediaType.TEXT_PLAIN_VALUE, method = RequestMethod.POST)
	public ResponseEntity<String> new_review(String content, String star, Long mno, Long ino, Long sno, Long cno,
			String flag) {
		log.info(content + " : " + star + " : " + mno + " : " + ino + " : " + sno + " : " + cno + " : " + flag);
		int int_star = Integer.parseInt(star);
		log.info("review : " + service.review_insert(content, int_star, mno, ino, sno, cno, flag));

		return new ResponseEntity<String>("true", HttpStatus.OK);

	}

}
