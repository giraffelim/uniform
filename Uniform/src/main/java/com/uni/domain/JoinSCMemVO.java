package com.uni.domain;

import lombok.Data;

// 신청 + 멤버

@Data
public class JoinSCMemVO {
	private String reservation;
	private String photo;
	private int mno;
	private String name;
	private String userID;
	private String phone;
}
