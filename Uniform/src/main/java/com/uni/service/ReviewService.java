package com.uni.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.uni.domain.uni_JoinReviewVO;

@Service
public interface ReviewService {

	//ino로 review테이블 조회
	public List<uni_JoinReviewVO> readReviewByino(int ino);
	
	public boolean removeReview(int hno);
	
	public boolean updateReview(String content, int star, int hno);
}
