package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.JoinSCMemVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.SinchungVO;
import com.uni.domain.Sinchung_ListVO;
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_PhotoVO;
import com.uni.domain.uni_ShinChungVO;
import com.uni.domain.uni_confirmVO;
import com.uni.domain.uni_hotTopicVO;
import com.uni.domain.uni_workplace_iVO;

public interface uni_workplaceMapper {

	public List<uni_workplace_iVO> workPlaceList();

	public List<StarAvgVO> avg_star();
	
	
	// 임대 게시글 등록
	public void insertWorkPlace_i(uni_workplace_iVO vo);
	
	// 공유 게시글 등록
	public void insertWorkplace_s(SWorkPlaceVO vo);
	
	// 첨부 파일 등록
	public void insertAttach(uni_PhotoVO vo);
	
	// workPlace cRud
	public uni_workplace_iVO read(int ino);
	
	public SWorkPlaceVO readShare(int sno);
	
	// workPlace crUd
	public int updateWorkPlace_i (uni_workplace_iVO vo);

	// photo delete
	public void deletePhoto(int ino);


	// 핫토픽 리스트 select(공유)
	public List<uni_hotTopicVO> readHotTopic();

	// 핫토픽 리스트 select(임대)
	public List<uni_hotTopicVO> readHotTopicImde();
	
	public List<Sinchung_ListVO> sinchung_list_s(Long mno);

	public List<Sinchung_ListVO> sinchung_list_d(Long mno);

	public List<Sinchung_ListVO> Isinchung_list(Long mno);

	public List<Sinchung_ListVO> sinchung_list_s_ajax(Long mno);

	public List<Sinchung_ListVO> sinchung_list_d_ajax(Long mno);

	public List<Sinchung_ListVO> Isinchung_list_ajax(Long mno);
	
	public List<SinchungVO> sinchungList(Long no);

	public List<IWorkPlaceVO> workPlaceList_i(String location);

	public List<SWorkPlaceVO> workPlaceList_s(String location);

	public List<StarAvgVO> avg_star_i(String location);

	public List<StarAvgVO> avg_star_s(String location);
	
	// 배치 프로그램 쿼리
	public List<uni_PhotoVO> getOldFiles();
	
	// shinchung List get
	public List<uni_ShinChungVO> getShinChung(int ino);
	
	// like shinchung
	public uni_ShinChungVO getShinChungLike(@Param("ino") int ino, @Param("reservation") String reservation);
	
	public void insertShinChung(uni_ShinChungVO vo);
	
	public void updateWorkplace_s(SWorkPlaceVO vo);
	
	public void deletePhotoS(int sno);
	
	// 공유게시글 당 신청 조회
	public List<JoinSCMemVO> getSinchungBySno(int sno);
	
	public int duplicateCheckTime(@Param("firstTime") int firstTime, @Param("toLastTime") int toLastTime, @Param("lastTime") int lastTime, @Param("toFirstTime") int toFirstTime);
	
	public void insertShinChungS(uni_ShinChungVO vo);
	
	public int deleteSinchung(@Param("mno") int mno, @Param("sno") int sno);
	
	public void deleteLeaseS(int ino);
	
	public void insertConfirm(uni_confirmVO vo);
	
	// readCount update
	public void updateReadCount(@Param("ino") int ino, @Param("sno") int sno);
	
	// leaseConfirm -> select today leaseInsert
	public List<Integer> getTodayLeaseList();
	
	public List<uni_ShinChungVO> getTodaySinchungList(int ino);
}
