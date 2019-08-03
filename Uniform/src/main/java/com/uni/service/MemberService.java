package com.uni.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.uni.domain.uni_MemberVO;
import com.uni.domain.uni_hotTopicVO;

@Service
public interface MemberService {

	public uni_MemberVO find_id(String name, String email);

	public boolean find_pw(String userPW, String userID, String email);

	public boolean updateMember(uni_MemberVO vo);

	public void insertSelectKey(uni_MemberVO member);

	public void insertInfoMember(uni_MemberVO member);

	public uni_MemberVO checkID(String userID);

	public uni_MemberVO confirm(String name, String phone);

	public void mergeGoogle(uni_MemberVO vo);

	public void mergeNaver(uni_MemberVO vo);
	
	public uni_MemberVO getMember(int mno);
	
	public ResponseEntity<String> uploadProfile(MultipartFile[] uploadFile);
	
	public ResponseEntity<byte[]> getFile(String fileName);
	
	public ResponseEntity<String> deleteFile(String fileName);

	public List<uni_hotTopicVO> listImde();


}
