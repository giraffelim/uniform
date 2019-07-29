package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_hotTopicVO;

public interface uni_MemberMapper {
	
	// �쉶�썝�쓽 �젙蹂대�� select
	public uni_MemberVO read(String userID);
	
	// ID 李얘린 select
	public uni_MemberVO find_id(@Param("name") String name, @Param("email") String email);
	
	// PW 李얘린 update (�엫�떆 鍮꾨�踰덊샇 諛쒓툒�븯�뿬 update)
	public boolean find_pw(@Param("userPW") String userPW, @Param("userID") String userID, @Param("email") String email);
	
	//회원가입
   public void insertSelectKey(uni_MemberVO member);
	//auth테이블 insert
	public void insert(int mno);
	//id중복체크
	public uni_MemberVO checkID(String userID);
	
	//핫토픽 리스트 select(공유)	
	public List<uni_hotTopicVO> readHotTopic();
	
	//핫토픽 리스트 select(임대)
	public List<uni_hotTopicVO> readHotTopicImde();
	
	
}
