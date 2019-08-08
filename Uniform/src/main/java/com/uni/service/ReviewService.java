package com.uni.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.uni.domain.Criteria;
import com.uni.domain.ReviewPageDTO;
import com.uni.domain.uni_JoinReviewVO;

@Service
public interface ReviewService {

   //ino로 reviewList 조회
   public ReviewPageDTO readReviewListByino(int ino, Criteria cri);
   
 //ino로 reviewList 조회
   public ReviewPageDTO readReviewListBysno(int sno, Criteria cri);
   
   public boolean removeReview(int hno);
   
   public boolean updateReview(String content, int star, int hno);
   
   public uni_JoinReviewVO readReview(int hno);
}