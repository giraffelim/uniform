package com.uni.domain;

import java.util.Date;

import lombok.Data;

@Data
public class uni_workplace_iVO {
	private int ino;
	private String title;
	private String location;
	private String thumbnail;
	private String comforts;
	private int price;
	private String context;
	private Date regDate;

	private int mno;
	private int readCount;
}
