package com.uni.service;

import org.springframework.stereotype.Service;

import com.uni.domain.uni_MemberVO;

@Service
public interface MemberService {

	public uni_MemberVO find_id(String name, String email);

	public boolean find_pw(String userPW, String userID, String email);

}
