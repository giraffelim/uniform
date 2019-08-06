package com.uni.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.JoinSCMemVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.SinchungVO;
import com.uni.domain.Sinchung_ListVO;
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_ShinChungVO;
import com.uni.domain.uni_hotTopicVO;
import com.uni.domain.uni_workplace_iVO;

@Service
public interface WorkPlaceService {

	public List<uni_workplace_iVO> workPlaceList();

	public List<IWorkPlaceVO> workPlaceList_i(String location, String type);

	public List<SWorkPlaceVO> workPlaceList_s(String location, String type, String SfirstDate, String SlastDate);
	
	public List<StarAvgVO> avg_star(String loaction, String type);
	
	public void insertWorkPlace_i(uni_workplace_iVO vo);
	
	public void insertWorkPlace_s(SWorkPlaceVO vo);
	
	public uni_workplace_iVO read(int ino);
	
	public SWorkPlaceVO readShare(int sno);
	
	// update
	public int updateWorkPlace_i(uni_workplace_iVO vo);

	public String CurrentDate();

	
	public List<uni_hotTopicVO> list();

	public List<uni_hotTopicVO> listImde();
	
	public List<uni_ShinChungVO> getShinChung(int ino);
	
	public void insertShinChung(uni_ShinChungVO vo);
	
	public List<Sinchung_ListVO> sinchung_list(Long mno);

	public List<Sinchung_ListVO> Isinchung_list(Long mno);

	public List<Sinchung_ListVO> sinchung_list_ajax(Long mno);

	public List<Sinchung_ListVO> Isinchung_list_ajax(Long mno);

	public List<SinchungVO> sinchungList(Long mno);
	
	public void updateWorkplace_s(SWorkPlaceVO vo);
	
	public List<JoinSCMemVO> getSinchungBySno(int sno);
	
	public int insertShareSinchung(uni_ShinChungVO vo);
	
	public int deleteSinchung(int mno, int sno);
	
	public int shareConfirm(int sno);
	
	public void updateReadCount(int ino, int sno);
}
