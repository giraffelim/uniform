package com.uni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.domain.uni_JoinReviewVO;
import com.uni.mapper.uni_reviewMapper;
import com.uni.mapper.uni_workplaceMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

   @Setter(onMethod_ = @Autowired)
   private uni_reviewMapper mapper;

   @Override
   public List<uni_JoinReviewVO> readReviewListByino(int ino) {
      System.out.println(mapper.readReviewList(ino));
      return mapper.readReviewList(ino);
   }

   @Override
   public boolean removeReview(int hno) {
      return mapper.removeReview(hno);
   }

   @Override
   public boolean updateReview(String content, int star, int hno) {
      return mapper.updateReview(content, star, hno);
   }

   @Override
   public uni_JoinReviewVO readReview(int hno) {
      
      return mapper.readReview(hno);
   }

}