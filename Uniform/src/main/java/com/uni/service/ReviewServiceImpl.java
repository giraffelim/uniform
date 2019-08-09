package com.uni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.domain.Criteria;
import com.uni.domain.ReviewPageDTO;
import com.uni.domain.uni_JoinReviewVO;
import com.uni.mapper.uni_reviewMapper;

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
   public ReviewPageDTO readReviewListByino(int ino, Criteria cri) {
      System.out.println(mapper.getListWithPagingI(ino,cri));
      return new ReviewPageDTO(mapper.getCountByIno(ino), mapper.getListWithPagingI(ino, cri));
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

@Override
public ReviewPageDTO readReviewListBysno(int sno, Criteria cri) {
	// TODO Auto-generated method stub
	return new ReviewPageDTO(mapper.getCountBySno(sno), mapper.getListWithPagingS(sno, cri));
}


}