package com.uni.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SWorkPlaceVO {
	
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
