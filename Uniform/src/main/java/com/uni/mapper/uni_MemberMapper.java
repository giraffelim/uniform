package com.uni.mapper;

import org.apache.ibatis.annotations.Param;

import com.uni.domain.uni_MemberVO;

public interface uni_MemberMapper {
	
	// 회원의 정보를 select
	public uni_MemberVO read(String userID);
	
	// ID 찾기 select
	public uni_MemberVO find_id(@Param("name") String name, @Param("email") String email);
	
	// PW 찾기 update (임시 비밀번호 발급하여 update)
	public boolean find_pw(@Param("userPW") String userPW, @Param("userID") String userID, @Param("email") String email);
	
	//회원의 정보를 update
	public int updateMember(uni_MemberVO vo);
	
	
}
