package com.uni.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.JoinSCMemVO;
import com.uni.domain.Join_ConfirmVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.SinchungVO;
import com.uni.domain.Sinchung_ListVO;
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_PhotoVO;
import com.uni.domain.uni_ShinChungVO;
import com.uni.domain.uni_confirmVO;
import com.uni.domain.uni_hotTopicVO;
import com.uni.domain.uni_reviewVO;
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

	@Override
	public List<Sinchung_ListVO> sinchung_list(Long mno) {

		ArrayList<Sinchung_ListVO> unionSinchungList = new ArrayList<Sinchung_ListVO>();

		unionSinchungList.addAll(mapper.sinchung_list(mno));

		return unionSinchungList;
	}

	@Transactional
	@Override
	public List<Sinchung_ListVO> Isinchung_list(Long mno) {


		return mapper.Isinchung_list(mno);
	}

	public List<Sinchung_ListVO> Isinchung_list_ajax(Long mno) {
		return mapper.Isinchung_list_ajax(mno);
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
	public List<Join_ConfirmVO> IConfirmList(Long mno) {
		System.out.println("service confirm : " + mapper.IConfirmList(mno));
		List<Join_ConfirmVO> list = mapper.IConfirmList(mno);
		List<Join_ConfirmVO> resultList = new ArrayList<Join_ConfirmVO>();
		String mnoStr = mno.toString();

		for (int i = 0; i < list.size(); i++) {
			String[] mnoList = list.get(i).getMno().split(",");
			String[] nameList = list.get(i).getCname().split(",");
			String[] phoneList = list.get(i).getCphone().split(",");
			String[] reservationList = list.get(i).getReservation().split(",");
			for (int j = 0; j < mnoList.length; j++) {
				log.info(mnoList[j] + " : " + mno);
				if (mnoList[j].equals(mnoStr)) {
					Join_ConfirmVO confirmList = new Join_ConfirmVO();
					confirmList.setCno(list.get(i).getCno());
					confirmList.setIno(list.get(i).getIno());
					confirmList.setTitle(list.get(i).getTitle());
					confirmList.setLocation(list.get(i).getLocation());
					confirmList.setThumbnail(list.get(i).getThumbnail());
					confirmList.setPrice(list.get(i).getPrice());
					confirmList.setCname(nameList[j]);
					confirmList.setCphone(phoneList[j]);
					confirmList.setName(list.get(i).getName());
					confirmList.setPhone(list.get(i).getPhone());
					if (list.get(i).getDno().equals(mnoStr)) {
						confirmList.setReservation(list.get(i).getMyTime());
						confirmList.setMyTime(list.get(i).getMyTime());
						confirmList.setMyDate(list.get(i).getMyDate());
					} else {
						confirmList.setReservation(reservationList[j]);
						confirmList.setMyTime("사용하지 않음");
						confirmList.setMyDate(CurrentDate());
					}
					confirmList.setMno(mnoList[j]);
					resultList.add(confirmList);
				}
			}

		}
		System.out.println("service confirm update : " + resultList);
		return resultList;
	}

	@Override
	public List<Join_ConfirmVO> SConfirmList(Long mno) {
		System.out.println("service confirm : " + mapper.SConfirmList(mno));
		List<Join_ConfirmVO> list = mapper.SConfirmList(mno);
		List<Join_ConfirmVO> resultList = new ArrayList<Join_ConfirmVO>();
		String mnoStr = mno.toString();

		for (int i = 0; i < list.size(); i++) {
			String[] mnoList = list.get(i).getMno().split(",");
			String[] nameList = list.get(i).getCname().split(",");
			String[] phoneList = list.get(i).getCphone().split(",");
			String[] reservationList = list.get(i).getReservation().split(",");
			for (int j = 0; j < mnoList.length; j++) {
				log.info(mnoList[j] + " : " + mnoStr + " : " + list.get(i).getDno());
				if (mnoList[j].equals(mnoStr)) {
					Join_ConfirmVO confirmList = new Join_ConfirmVO();
					confirmList.setCno(list.get(i).getCno());
					confirmList.setSno(list.get(i).getSno());
					confirmList.setTitle(list.get(i).getTitle());
					confirmList.setLocation(list.get(i).getLocation());
					confirmList.setThumbnail(list.get(i).getThumbnail());
					confirmList.setPrice(list.get(i).getPrice());
					confirmList.setCname(nameList[j]);
					confirmList.setCphone(phoneList[j]);
					confirmList.setReservation(reservationList[j]);
					confirmList.setName(list.get(i).getName());
					confirmList.setPhone(list.get(i).getPhone());
					confirmList.setMyTime(list.get(i).getMyTime());
					confirmList.setReservation(reservationList[j]);
					confirmList.setMyDate(CurrentDate());
					confirmList.setMno(mnoList[j]);
					resultList.add(confirmList);
				} else if (list.get(i).getDno().equals(mnoStr)) {
					Join_ConfirmVO confirmList = new Join_ConfirmVO();
					confirmList.setCno(list.get(i).getCno());
					confirmList.setSno(list.get(i).getSno());
					confirmList.setTitle(list.get(i).getTitle());
					confirmList.setLocation(list.get(i).getLocation());
					confirmList.setThumbnail(list.get(i).getThumbnail());
					confirmList.setPrice(list.get(i).getPrice());
					confirmList.setCname(nameList[j]);
					confirmList.setCphone(phoneList[j]);
					confirmList.setReservation(reservationList[j]);
					confirmList.setName(list.get(i).getName());
					confirmList.setPhone(list.get(i).getPhone());
					confirmList.setReservation(list.get(i).getMyTime());
					confirmList.setMyDate(list.get(i).getMyDate());
					resultList.add(confirmList);
					j++;
				}
			}

		}
		System.out.println("service confirm update : " + resultList);
		return resultList;
	}

	@Override
	public List<Join_ConfirmVO> confirm(Long cno, Long mno, String flag) {
		System.out.println(cno + " : " + mno + " : " + flag + " : service all Iconfirm : " + mapper.Iconfirm(cno, mno));
		System.out.println(cno + " : " + mno + " : " + flag + " : service all Sconfirm : " + mapper.Sconfirm(cno, mno));

		List<Join_ConfirmVO> resultList = new ArrayList<Join_ConfirmVO>();

		List<Join_ConfirmVO> list;

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
			Join_ConfirmVO selectConfirm = new Join_ConfirmVO();
			log.info("service all list : " + list.get(0).getMyDate() + " : " + list.get(0).getMyTime());
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
	public boolean review_insert(uni_reviewVO vo) {
		System.out.println("service review : " + vo);
		if (vo.getFlag().equals("sno")) {
			return mapper.Sreview_insert(vo.getContent(), vo.getStar(), vo.getMno(), vo.getSno(), vo.getCno());
		} else {
			return mapper.Ireview_insert(vo.getContent(), vo.getStar(), vo.getMno(), vo.getIno(), vo.getCno());
		}

	}

	@Override
	public int getWorkplaceCount() {
		return mapper.getWorkplaceCount();
	}

	public List<uni_ShinChungVO> getShinChung(int ino) {
		// TODO Auto-generated method stub
		return mapper.getShinChung(ino);
	}

	@Transactional
	@Override
	public void insertShinChung(uni_ShinChungVO vo) {
		// TODO split 배열로 하나씩 넣어서 검증
		String[] validate = vo.getReservation().split(",");
		for (int i = 0; i < validate.length; i++) {
			uni_ShinChungVO confirmVO = mapper.getShinChungLike(vo.getIno(), validate[i]);
			if (confirmVO != null) {
				return;
			}
		}

		mapper.insertShinChung(vo);
	}
	
	@Transactional
	@Override
	public void insertWorkPlace_s(SWorkPlaceVO vo) {
		// TODO Auto-generated method stub
		mapper.insertWorkplace_s(vo);
		vo.getAttachList().forEach(attach -> {
			uni_PhotoVO pVo = new uni_PhotoVO();
			pVo.setFileName(attach.getFileName());
			pVo.setPath(attach.getPath());
			pVo.setSno(vo.getSno());
			pVo.setUuid(attach.getUuid());
			mapper.insertAttach(pVo);
		});
	}
	
	@Override
	public SWorkPlaceVO readShare(int sno) {
		// TODO Auto-generated method stub
		return mapper.readShare(sno);
	}
	
	@Transactional
	@Override
	public void updateWorkplace_s(SWorkPlaceVO vo) {
		// TODO Auto-generated method stub
		mapper.updateWorkplace_s(vo);
		mapper.deletePhotoS(vo.getSno());
		vo.getAttachList().forEach(attach -> {
			attach.setSno(vo.getSno());
			mapper.insertAttach(attach);
		});
	}

	@Override
	public List<JoinSCMemVO> getSinchungBySno(int sno) {
		// TODO Auto-generated method stub
		return mapper.getSinchungBySno(sno);
	}

	@Override
	@Transactional
	public int insertShareSinchung(uni_ShinChungVO vo) {
		// 신청 테이블 비교
		// 1. 신청 정보를 가져온다
		List<JoinSCMemVO> joinVO = mapper.getSinchungBySno(vo.getSno());
		// 2. 신청자가 등록한 시간을 split 한다.
		String[] toReservation = 	vo.getReservation().split(",");
		// 3. 신청자가 신청한 시간을 가져온다.
		int toFirstTime = Integer.parseInt(toReservation[0]);
		int toLastTime = Integer.parseInt(toReservation[1]);
		
		// 등록자 시간 비교
		SWorkPlaceVO originVO = mapper.readShare(vo.getSno());
		// 등록자가 작성한 시간을 구해온다.
		String masterTime = originVO.getMyTime();
		String[] masterTimes = masterTime.split("~");
		for(int i=0; i<masterTimes.length; i++) {
			masterTimes[i] = masterTimes[i].replace(":00", "");
		}
		int mFirstTime = Integer.parseInt(masterTimes[0]);
		int mLastTime = Integer.parseInt(masterTimes[1]);
		int flag = mapper.duplicateCheckTime(mFirstTime, toLastTime, mLastTime, toFirstTime);
		
		if(flag == 1) {
			return 1;
		}
		
		for(int i=0; i<joinVO.size(); i++) {
			// 4. 신청 테이블에 담긴 시간을 split한다
			String [] reservation = joinVO.get(i).getReservation().split("~");
			
			// 5. 신청 테이블과 사용자가 신청한 시간을 비교한다.
			int firstTime = 0;
			int lastTime = 0;
			for(int j=0; j<reservation.length; j++) {
				String res = reservation[j].replace(":00", "");
				if(j == 0) {
					firstTime = Integer.parseInt(res);
				}
				if(j == 1) {
					lastTime = Integer.parseInt(res);
				}
			}
			flag = mapper.duplicateCheckTime(firstTime, toLastTime, lastTime, toFirstTime);
			
			if(flag == 1) {
				return 1;
			}
			
		}
		
		//INSERT
		String reservation2 = toFirstTime +":00~"+toLastTime+":00";
		vo.setReservation(reservation2);
		mapper.insertShinChungS(vo);
		return 0;
	}

	// 신청 삭제
	@Override
	public int deleteSinchung(int mno, int sno) {
		// TODO Auto-generated method stub
		return mapper.deleteSinchung(mno, sno);
	}
	
	// share Confirm
	@Transactional
	@Override
	public int shareConfirm(int sno) {
		int count = 0;
		
		//Confirm VO 생성
		uni_confirmVO cVo = new uni_confirmVO();
		
		cVo.setSno(sno);
		
		// TODO sno로 신청 테이블 정보 가져오기
		List<JoinSCMemVO>sinchungList = mapper.getSinchungBySno(sno);
		StringBuilder nameSB = new StringBuilder();
		StringBuilder phoneSB = new StringBuilder();
		StringBuilder reservationSB = new StringBuilder();
		StringBuilder mnoSB = new StringBuilder();
		for (JoinSCMemVO joinSCMemVO : sinchungList) {
			nameSB.append(joinSCMemVO.getName());
			phoneSB.append(joinSCMemVO.getPhone());
			reservationSB.append(joinSCMemVO.getReservation());
			mnoSB.append(joinSCMemVO.getMno());
			
			if(count < sinchungList.size()-1) {
				nameSB.append(",");
				phoneSB.append(",");
				reservationSB.append(",");
				mnoSB.append(",");
			}
			count++;
		}
		
		cVo.setCName(nameSB.toString());
		cVo.setCPhone(phoneSB.toString());
		cVo.setReservation(reservationSB.toString());
		cVo.setMno(mnoSB.toString());
		
		// TODO sno로 등록자 정보 가져오기
		SWorkPlaceVO sVo = mapper.readShare(sno);
		cVo.setMyTime(sVo.getMyTime());
		
		System.out.println(cVo);
		
		// insert Confirm
		mapper.insertConfirm(cVo);
		
		// sinchung table delete
		mapper.deleteSinchung(0, cVo.getSno());
		
		return 1;
	}

	@Override
	public void updateReadCount(int ino, int sno) {
		// TODO Auto-generated method stub
		if(sno != 0) {
			mapper.updateReadCount(0, sno);
		}else {
			mapper.updateReadCount(ino, 0);
		}
	}
}
