package com.uni.domain;

import lombok.Data;

@Data
public class SinchungVO {
	
	// 신청 정보를 가져오는 VO
	
	private Long ino;
	private String title;
	private String location;
	private int price;
	private String hname;
	private String hphone;
	private String reservation;
	private Long mno;

}
