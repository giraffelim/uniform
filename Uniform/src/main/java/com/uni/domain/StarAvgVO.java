package com.uni.domain;

import lombok.Data;

@Data
public class StarAvgVO {
	
	// uno_review에서 가져온 평균 별점을 저장하는 VO

	private int avg;
	private Long ino;
	private Long sno;
	
}

