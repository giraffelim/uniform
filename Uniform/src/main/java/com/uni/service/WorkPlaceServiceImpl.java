package com.uni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_workplace_iVO;
import com.uni.mapper.uni_workplaceMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class WorkPlaceServiceImpl implements WorkPlaceService {
	
	@Setter(onMethod_ = @Autowired)
	private uni_workplaceMapper mapper;

	@Override
	public List<uni_workplace_iVO> workPlaceList() {
		return mapper.workPlaceList();
	}

	@Override
	public List<StarAvgVO> avg_star() {
		return mapper.avg_star();
	}

}
