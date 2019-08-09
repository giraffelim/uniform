package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uni.domain.Criteria;
import com.uni.domain.uni_JoinReviewVO;

public interface uni_reviewMapper {
   
   //임대테이블 ino로 리스트 조회하기
   public List<uni_JoinReviewVO> getListWithPagingI(@Param("ino") int ino,@Param("cri") Criteria cri);
   //임대테이블 총 댓글갯수 가져오기
   public int getCountByIno(int ino);
   
 //임대테이블 ino로 리스트 조회하기
   public List<uni_JoinReviewVO> getListWithPagingS(@Param("sno") int sno,@Param("cri") Criteria cri);
   
   //임대테이블 총 댓글갯수 가져오기
   public int getCountBySno(int sno);
   
   //공유테이블 sno로 리스트 조회하기
   public List<uni_JoinReviewVO> readReviewListS(int sno);
   
   public uni_JoinReviewVO readReview(int hno);
   
   public boolean removeReview(int hno);
   
   public boolean updateReview(@Param("content") String content, @Param("star") int star, @Param("hno") int hno);
   
}