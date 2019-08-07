package com.uni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.domain.uni_JoinReviewVO;
import com.uni.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/uniform/*")
@AllArgsConstructor
public class ReviewController {

   private ReviewService service;

   @GetMapping(value = "/readReviewList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   @ResponseBody
   public ResponseEntity<List<uni_JoinReviewVO>> readReviewList(int ino) {
      log.info("========readReview======= 호출됨 ino = " + ino);

      List<uni_JoinReviewVO> list = service.readReviewListByino(ino);

      log.info("========readReview======= 호출됨 댓글리스트 = " + list);

      return new ResponseEntity<List<uni_JoinReviewVO>>(list, HttpStatus.OK);
   }
   
   @PostMapping(value = "updateReview", produces = "text/plain")
   public ResponseEntity<String> updateReview(uni_JoinReviewVO vo) {
      log.info("수정");
      if (service.updateReview(vo.getContent(), vo.getStar(), vo.getHno())) {
         return new ResponseEntity<String>("수정완료", HttpStatus.OK);
      } else {
         return new ResponseEntity<String>("수정실패", HttpStatus.OK);
      }
   }
   
   @GetMapping(value = "removeReview", produces = "text/plain")
   public ResponseEntity<String> removeReview(int hno) {
      log.info("삭제");
      if (service.removeReview(hno)) {
         return new ResponseEntity<String>("삭제완료", HttpStatus.OK);
      } else {
         return new ResponseEntity<String>("삭제실패", HttpStatus.OK);
      }
   }
   
   @GetMapping(value = "/readReview", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   @ResponseBody
   public ResponseEntity<uni_JoinReviewVO> readReview(int hno){
      log.info("1건조회 리뷰!!!");
      
      uni_JoinReviewVO vo = service.readReview(hno);
      log.info("1건조회 리뷰!!!" + vo);
      
      return new ResponseEntity<uni_JoinReviewVO>(vo, HttpStatus.OK);
   }

}