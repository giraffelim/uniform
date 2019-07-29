package com.uni.domain;

import java.util.Date;

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
	private Date regDate;
	private int pCount;
	private String myTime;
	private String myDate;

	private int mno;
	private int readCount;

}
