package com.uni.domain;

import java.util.Date;

import lombok.Data;

@Data
public class uni_reviewVO {
	
	private Long hno;
	private String content;
	private Date regDate;
	private int star;
	private Long cno;
	private Long ino;
	private Long sno;
	private Long mno;
	private String flag;
}
