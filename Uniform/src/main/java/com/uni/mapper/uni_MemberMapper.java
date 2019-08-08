package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_hotTopicVO;

public interface uni_MemberMapper {

	// select
	public uni_MemberVO read(String userID);

	public uni_MemberVO getByNaver(String snsID);

	public uni_MemberVO getByGoogle(String snsID);

	// 아이디 찾기 select
	public uni_MemberVO find_id(@Param("name") String name, @Param("email") String email);

	// 비밀번호 찾기 update
	public boolean find_pw(@Param("userPW") String userPW, @Param("userID") String userID,
			@Param("email") String email);

	// 추가 정보 입력
	public void insertInfoMember(uni_MemberVO member);

	// 회원의 정보를 update
	public int updateMember(uni_MemberVO vo);

	// 회원가입
	public void insertSelectKey(uni_MemberVO member);

	// auth테이블 insert
	public void insert(int mno);

	// id중복체크
	public uni_MemberVO checkID(String userID);

	public uni_MemberVO confirm(@Param("name") String name, @Param("phone") String phone);

	public void mergeGoogle(uni_MemberVO vo);

	public void mergeNaver(uni_MemberVO vo);
	// 핫토픽 리스트 select(공유)
	public List<uni_hotTopicVO> readHotTopic();

	// 핫토픽 리스트 select(임대)
	public List<uni_hotTopicVO> readHotTopicImde();

	public uni_MemberVO readMember(int mno);
	
	public int getMemberCount();

}
