package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uni.domain.uni_JoinReviewVO;

public interface uni_reviewMapper {
	
	//임대테이블 ino로 리뷰 조회하기
	public List<uni_JoinReviewVO> readReview(int ino);
	
	public boolean removeReview(int hno);
	
	public boolean updateReview(@Param("content") String content, @Param("star") int star, @Param("hno") int hno);
	
}
