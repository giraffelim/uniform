package com.uni.domain;

import java.util.Date;

import lombok.Data;

@Data
public class IWorkPlaceVO {
	
	// 임대 테이블의 VO (regDate가 String 타입이니까 잘 보고 사용하시길)

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
