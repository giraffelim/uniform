package com.uni.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.SinchungVO;
import com.uni.domain.Sinchung_ListVO;
import com.uni.domain.StarAvgVO;

import com.uni.domain.uni_PhotoVO;

import com.uni.domain.uni_hotTopicVO;

import com.uni.domain.uni_workplace_iVO;
import com.uni.mapper.uni_workplaceMapper;
import com.uni.service.WorkPlaceService;

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

	@Transactional
	@Override
	public List<Sinchung_ListVO> sinchung_list(Long mno) {

		ArrayList<Sinchung_ListVO> unionSinchungList = new ArrayList<Sinchung_ListVO>();

		unionSinchungList.addAll(mapper.sinchung_list_d(mno));
		unionSinchungList.addAll(mapper.sinchung_list_s(mno));

		/* System.out.println("=======================마이페이지 mno :" + mno); */

		for (int i = 0; i < unionSinchungList.size(); i++) {
			/* System.out.println("split 전 :" + unionSinchungList); */
			String[] arr = unionSinchungList.get(i).getReservation().split("/");
			unionSinchungList.get(i).setReservation(arr[1]);

		}
		System.out.println("split 후:" + unionSinchungList);
		return unionSinchungList;
	}

	@Transactional
	@Override
	public List<Sinchung_ListVO> Isinchung_list(Long mno) {
		/*
		 * ArrayList<Sinchung_ListVO> unionSinchungList = new
		 * ArrayList<Sinchung_ListVO>();
		 */
		System.out.println(mapper.Isinchung_list(mno));

		return mapper.Isinchung_list(mno);
	}

	public List<Sinchung_ListVO> Isinchung_list_ajax(Long mno) {
		return mapper.Isinchung_list_ajax(mno);
	}

	@Transactional
	@Override
	public List<Sinchung_ListVO> sinchung_list_ajax(Long mno) {

		ArrayList<Sinchung_ListVO> unionSinchungList = new ArrayList<Sinchung_ListVO>();

		unionSinchungList.addAll(mapper.sinchung_list_d_ajax(mno));
		unionSinchungList.addAll(mapper.sinchung_list_s_ajax(mno));

		/* System.out.println("=======================마이페이지 mno :" + mno); */

		for (int i = 0; i < unionSinchungList.size(); i++) {
			/* System.out.println("split 전 :" + unionSinchungList); */
			String[] arr = unionSinchungList.get(i).getReservation().split("/");
			unionSinchungList.get(i).setReservation(arr[1]);

		}

		/* System.out.println("split 후:" + unionSinchungList); */
		return unionSinchungList;
	}

	@Override
    public List<SinchungVO> sinchungList(Long no) {
        System.out.println("service sinchung : " + mapper.sinchungList(no));
        return mapper.sinchungList(no);
    }

	@Transactional
	@Override
	public void insertWorkPlace_i(uni_workplace_iVO vo) {
		// TODO Auto-generated method stub
		// workplace_i에 insert
		mapper.insertWorkPlace_i(vo);
		// 첨부파일 insert
		for (int i = 0; i < vo.getAttachList().size(); i++) {
			uni_PhotoVO pVo = new uni_PhotoVO();
			pVo.setIno(vo.getIno());
			pVo.setFileName(vo.getAttachList().get(i).getFileName());
			pVo.setUuid(vo.getAttachList().get(i).getUuid());
			pVo.setPath(vo.getAttachList().get(i).getPath());
			mapper.insertAttach(pVo);
		}
	}

	@Override
	public uni_workplace_iVO read(int ino) {
		// TODO Auto-generated method stub
		return mapper.read(ino);
	}

	@Transactional
	@Override
	public int updateWorkPlace_i(uni_workplace_iVO vo) {
		// TODO Auto-generated method stub
		int result = 0;
		// update uni_workPlace_i
		result = mapper.updateWorkPlace_i(vo);

		// delete Photo
		mapper.deletePhoto(vo.getIno());

		// update uni_PhotoVO
		vo.getAttachList().forEach(photo -> {
			photo.setIno(vo.getIno());
			mapper.insertAttach(photo);
		});

		return result;
	}

}
