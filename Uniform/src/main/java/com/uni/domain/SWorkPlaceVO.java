package com.uni.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SWorkPlaceVO {
	
	// 공유 테이블의 VO (regDate가 String 타입이니까 잘 보고 사용하시길)
	
	private int sno;
	private String title;
	private String location;
	private String thumbnail;
	private String comforts;
	private int price;
	private String context;
	private Date  rDate;
	private int pCount;
	private String myTime;
	private String myDate;

	private int mno;
	private int readCount;
	
	// 첨부파일 List
	private List<uni_PhotoVO> attachList;

}
