package com.uni.domain;

import java.util.Date;

import lombok.Data;

@Data
public class IWorkPlaceVO {

	private int ino;
	private String title;
	private String location;
	private String thumbnail;
	private String comforts;
	private int price;
	private String context;
	private String regDate;

	private int mno;
	private int readCount;

}
