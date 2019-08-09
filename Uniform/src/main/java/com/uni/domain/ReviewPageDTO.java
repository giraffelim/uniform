package com.uni.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReviewPageDTO {

	private int replyCnt;
	private List<uni_JoinReviewVO> list;
}
