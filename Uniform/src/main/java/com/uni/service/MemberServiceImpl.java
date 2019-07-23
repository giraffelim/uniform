package com.uni.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.domain.uni_MemberVO;
import com.uni.mapper.uni_MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private uni_MemberMapper mapper;

	@Override
	public uni_MemberVO find_id(String name, String email) {
		return mapper.find_id(name, email);
	}

	@Override
	public boolean find_pw(String userPW, String userID, String email) {
		return mapper.find_pw(userPW, userID, email);
	}
}
