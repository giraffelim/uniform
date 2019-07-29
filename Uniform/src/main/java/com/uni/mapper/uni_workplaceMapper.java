package com.uni.mapper;

import java.util.List;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_hotTopicVO;
import com.uni.domain.uni_workplace_iVO;

public interface uni_workplaceMapper {

	public List<uni_workplace_iVO> workPlaceList();

	public List<StarAvgVO> avg_star();

	// 핫토픽 리스트 select(공유)
	public List<uni_hotTopicVO> readHotTopic();

	// 핫토픽 리스트 select(임대)
	public List<uni_hotTopicVO> readHotTopicImde();

	public List<IWorkPlaceVO> workPlaceList_i(String location);

	public List<SWorkPlaceVO> workPlaceList_s(String location);

	public List<StarAvgVO> avg_star_i(String location);

	public List<StarAvgVO> avg_star_s(String location);

}
