package com.uni.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.uni.domain.uni_MemberVO;

@Service
public interface MemberService {

	public uni_MemberVO find_id(String name, String email);

	public boolean find_pw(String userPW, String userID, String email);

	public void insertSelectKey(uni_MemberVO member);

	public void insertInfoMember(uni_MemberVO member);

	public uni_MemberVO checkID(String userID);

	public uni_MemberVO confirm(String name, String phone);
	
	public void mergeGoogle(uni_MemberVO vo);

	public void mergeNaver(uni_MemberVO vo);

}
