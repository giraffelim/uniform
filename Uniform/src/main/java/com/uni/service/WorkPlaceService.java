package com.uni.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.uni.domain.uni_workplace_iVO;
import com.uni.domain.StarAvgVO;

@Service
public interface WorkPlaceService {

	public List<uni_workplace_iVO> workPlaceList();
	
	public List<StarAvgVO> avg_star();
	
	
}
