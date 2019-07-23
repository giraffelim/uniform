package com.uni.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class uni_MemberVO {
	private int mno;
	private String userID;
	private String userPW;
	private String name;
	private String phone;
	private String email;
	private String photo;
	private Date regDate;
	private List<uni_member_authVO> authList;
}
