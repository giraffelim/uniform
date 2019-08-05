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
import com.uni.domain.uni_confirmVO;
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

	// 주소 키워드를 사용한 임대 작업실 검색
	@Override
	public List<IWorkPlaceVO> workPlaceList_i(String location, String type) {
		return mapper.workPlaceList_i(location);

	}

	// 주소와 날짜를 사용한 공유 작업실 검색
	@Override
	public List<SWorkPlaceVO> workPlaceList_s(String location, String type, String SfirstDate, String SlastDate) {
		List<SWorkPlaceVO> list = mapper.workPlaceList_s(location);
		List<SWorkPlaceVO> resultList = new ArrayList<>();

		System.out.println("workplaceList_s list : " + list);

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

			System.out.println("workplace_s date : " + firstDate + " : " + lastDate);

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
							System.out.println("workplace_s list.get : " + list.get(j));
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

	// 작업실에 등록된 review에 평균 별점 검색
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

		/*
		 * for (int i = 0; i < unionSinchungList.size(); i++) {
		 * System.out.println("split 전 :" + unionSinchungList); String[] arr =
		 * unionSinchungList.get(i).getReservation().split("/");
		 * unionSinchungList.get(i).setReservation(arr[1]);
		 * 
		 * }
		 */

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

		/*
		 * for (int i = 0; i < unionSinchungList.size(); i++) {
		 * System.out.println("split 전 :" + unionSinchungList); String[] arr =
		 * unionSinchungList.get(i).getReservation().split("/");
		 * unionSinchungList.get(i).setReservation(arr[1]);
		 * 
		 * }
		 */

		/* System.out.println("split 후:" + unionSinchungList); */
		return unionSinchungList;
	}

	// 로그인 한 사람의 신청 정보를 검색
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

	@Override
	public List<uni_confirmVO> IConfirmList(Long mno) {
		System.out.println("service confirm : " + mapper.IConfirmList(mno));
		List<uni_confirmVO> resultList = mapper.IConfirmList(mno);

		for (int i = 0; i < resultList.size(); i++) {
			String[] mnoList = resultList.get(i).getMno().split(",");
			String[] reservationList = resultList.get(i).getReservation().split(",");

			for (int j = 0; j < mnoList.length; j++) {
				Long mno_index = Long.parseLong(mnoList[j]);
				System.out.println(mno_index + " : " + mno);
				if (mno == mno_index) {
					String mno_str = mno_index.toString();
					resultList.get(i).setMno(mno_str);
					resultList.get(i).setReservation(reservationList[j]);
					break;
				} else {
					resultList.get(i).setReservation("사용하지 않음");
				}
			}
		}
		System.out.println("service confirm update : " + resultList);
		return resultList;
	}

	@Override
	public List<uni_confirmVO> SConfirmList(Long mno) {
		System.out.println("service confirm : " + mapper.SConfirmList(mno));
		List<uni_confirmVO> resultList = mapper.SConfirmList(mno);

		for (int i = 0; i < resultList.size(); i++) {
			String[] mnoList = resultList.get(i).getMno().split(",");
			String[] reservationList = resultList.get(i).getReservation().split(",");

			for (int j = 0; j < mnoList.length; j++) {
				Long mno_index = Long.parseLong(mnoList[j]);
				System.out.println(mno_index + " : " + mno);
				if (mno == mno_index) {
					String mno_str = mno_index.toString();
					resultList.get(i).setMno(mno_str);
					resultList.get(i).setReservation(reservationList[j]);
					break;
				} else {
					resultList.get(i).setReservation(resultList.get(i).getMyTime());
				}
			}
		}
		System.out.println("service confirm update : " + resultList);
		return resultList;
	}

	@Override
	public List<uni_confirmVO> confirm(Long cno, Long mno, String flag) {
		System.out.println(flag + " : service all Iconfirm : " + mapper.Iconfirm(cno, mno));
		System.out.println(flag + " : service all Sconfirm : " + mapper.Sconfirm(cno, mno));

		List<uni_confirmVO> resultList = new ArrayList<uni_confirmVO>();

		List<uni_confirmVO> list;

		if (flag.equals("1")) {
			list = mapper.Sconfirm(cno, mno);
		} else {
			list = mapper.Iconfirm(cno, mno);
		}

		String[] mnoList = list.get(0).getMno().split(",");
		String[] nameList = list.get(0).getCname().split(",");
		String[] phoneList = list.get(0).getCphone().split(",");
		String[] reservationList = list.get(0).getReservation().split(",");

		for (int i = 0; i < mnoList.length; i++) {
			uni_confirmVO selectConfirm = new uni_confirmVO();
			selectConfirm.setCno(list.get(0).getCno());
			if (list.get(0).getIno() != null) {
				selectConfirm.setIno(list.get(0).getIno());
			} else {
				selectConfirm.setSno(list.get(0).getSno());
			}
			selectConfirm.setTitle(list.get(0).getTitle());
			selectConfirm.setLocation(list.get(0).getLocation());
			selectConfirm.setThumbnail(list.get(0).getThumbnail());
			selectConfirm.setPrice(list.get(0).getPrice());
			selectConfirm.setCname(nameList[i]);
			selectConfirm.setCphone(phoneList[i]);
			selectConfirm.setReservation(reservationList[i]);
			selectConfirm.setName(list.get(0).getName());
			selectConfirm.setPhone(list.get(0).getPhone());
			if (list.get(0).getMyTime() != null) {
				selectConfirm.setMyTime(list.get(0).getMyTime());
				selectConfirm.setMyDate(list.get(0).getMyDate());
			} else {
				selectConfirm.setMyTime("사용하지 않음");
				selectConfirm.setMyDate(CurrentDate());
			}
			selectConfirm.setMno(mnoList[i]);
			resultList.add(selectConfirm);
		}

		System.out.println("service confirm update : " + resultList);
		return resultList;
	}

	@Override
	public boolean review_insert(String content, int star, Long mno, Long ino, Long sno, Long cno, String flag) {
		System.out.println(
				"service review : " + content + " : " + star + " : " + mno + " : " + ino + " : " + sno + " : " + cno + " : " + flag);
		if (flag.equals("sno")) {
			return mapper.Sreview_insert(content, star, mno, sno, cno);
		} else {
			return mapper.Ireview_insert(content, star, mno, ino, cno);
		}

	}

	@Override
	public int getWorkplaceCount() {
		return mapper.getWorkplaceCount();
	}

}
