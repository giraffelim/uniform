package com.uni.mapper;

import com.uni.domain.uni_MemberVO;

public interface uni_MemberMapper {
	
	// 회원의 정보를 select
	public uni_MemberVO read(String userID);
	
}
