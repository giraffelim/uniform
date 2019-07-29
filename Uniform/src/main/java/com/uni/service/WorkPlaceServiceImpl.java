package com.uni.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_hotTopicVO;
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

	public List<uni_hotTopicVO> list() {
		return mapper.readHotTopic();
	}

	@Override
	public List<uni_hotTopicVO> listImde() {
		return mapper.readHotTopicImde();
	}

	@Override
	public String CurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		Date date = new Date();
		String CurrentDate = sdf.format(date);

		System.out.println(CurrentDate);

		return CurrentDate;
	}

	@Override
	public List<IWorkPlaceVO> workPlaceList_i(String location, String type) {
		return mapper.workPlaceList_i(location);

	}

	@Override
	public List<SWorkPlaceVO> workPlaceList_s(String location, String type, String SfirstDate, String SlastDate) {
		List<SWorkPlaceVO> list = mapper.workPlaceList_s(location);
		List<SWorkPlaceVO> resultList = new ArrayList<>();

		if (SfirstDate == null || SfirstDate.equals("fail") || SfirstDate.equals("")) {
			SfirstDate = CurrentDate();
		}
		if (SlastDate == null || SfirstDate.equals("fail") || SfirstDate.equals("")) {
			SlastDate = CurrentDate();
		}

		try {

			// 검색한 날짜
			Date firstDate = new SimpleDateFormat("yyyy-MM-dd").parse(SfirstDate);
			Date lastDate = new SimpleDateFormat("yyyy-MM-dd").parse(SfirstDate);

			for (int j = 0; j < list.size(); j++) {
				String[] dateList = list.get(j).getMyDate().split("~");
				for (int i = 0; i < dateList.length; i++) {

					Date dbDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateList[i]);

					int result = firstDate.compareTo(dbDate);
					if (result >= 0) {
						i++;
						dbDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateList[i]);
						result = lastDate.compareTo(dbDate);
						if (result <= 0) {
							resultList.add(list.get(j));
							System.out.println(list.get(j));
						}
					} else {
						break;
					}
				}
			}

			System.out.println("str : " + resultList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultList;
	}

	@Override
	public List<StarAvgVO> avg_star(String location, String type) {
		if (type.equals("share")) {
			return mapper.avg_star_s(location);
		} else {
			return mapper.avg_star_i(location);
		}
	}


}
