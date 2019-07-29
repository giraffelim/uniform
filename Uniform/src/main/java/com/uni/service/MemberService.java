package com.uni.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_hotTopicVO;

@Service
public interface MemberService {

	public uni_MemberVO find_id(String name, String email);

	public boolean find_pw(String userPW, String userID, String email);
	
	public void insertSelectKey(uni_MemberVO member);
	
	public uni_MemberVO checkID(String userID);
	
	public String CurrentDate();
	
	public List<uni_hotTopicVO> list();
	
	public List<uni_hotTopicVO>listImde();

}
