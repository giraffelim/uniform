package com.uni.mapper;

import java.util.List;

import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_workplace_iVO;

public interface uni_workplaceMapper {
	
	public List<uni_workplace_iVO> workPlaceList();
	
	public List<StarAvgVO> avg_star();

}
