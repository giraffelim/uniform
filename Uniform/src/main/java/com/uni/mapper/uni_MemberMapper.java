package com.uni.mapper;


import org.apache.ibatis.annotations.Param;

import com.uni.domain.uni_MemberVO;

public interface uni_MemberMapper {
	
	//  select
	public uni_MemberVO read(String userID);

	public uni_MemberVO getByNaver(String snsID);
	
	public uni_MemberVO getByGoogle(String snsID);
	
	public uni_MemberVO find_id(@Param("name") String name, @Param("email") String email);
	
	public boolean find_pw(@Param("userPW") String userPW, @Param("userID") String userID, @Param("email") String email);
	
	//추가 정보 입력
	public void insertInfoMember(uni_MemberVO member);
	
	//회원가입
   public void insertSelectKey(uni_MemberVO member);
	//auth테이블 insert
	public void insert(int mno);
	//id중복체크
	public uni_MemberVO checkID(String userID);
	
	public uni_MemberVO confirm(@Param("name") String name, @Param("phone") String phone);
	
	public void mergeGoogle(uni_MemberVO vo);
	
	public void mergeNaver(uni_MemberVO vo);
	
}
