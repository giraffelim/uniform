package com.uni.domain;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class uni_JoinReviewVO {
	private int mno;
	private String content;
	private int star;
	private String name;
	private String photo;
	private String userID;
	private Date regDate;
	private int hno;
}
