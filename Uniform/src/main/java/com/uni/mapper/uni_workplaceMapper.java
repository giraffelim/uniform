package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uni.domain.IWorkPlaceVO;
import com.uni.domain.SWorkPlaceVO;
import com.uni.domain.SinchungVO;
import com.uni.domain.Sinchung_ListVO;
import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_PhotoVO;
import com.uni.domain.Join_ConfirmVO;
import com.uni.domain.uni_ShinChungVO;
import com.uni.domain.uni_hotTopicVO;
import com.uni.domain.uni_workplace_iVO;

public interface uni_workplaceMapper {

	public List<uni_workplace_iVO> workPlaceList();

	public List<StarAvgVO> avg_star();

	// 임대 게시글 등록
	public void insertWorkPlace_i(uni_workplace_iVO vo);

	// 첨부 파일 등록
	public void insertAttach(uni_PhotoVO vo);

	// workPlace cRud
	public uni_workplace_iVO read(int ino);

	// workPlace crUd
	public int updateWorkPlace_i(uni_workplace_iVO vo);

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

	// 주소 키워드로 찾아오는 임대 테이블
	public List<IWorkPlaceVO> workPlaceList_i(String location);

	// 주소 키워드로 찾아오는 공유 테이블
	public List<SWorkPlaceVO> workPlaceList_s(String location);

	// 임대 작업실 review에 작성된 평균 별점
	public List<StarAvgVO> avg_star_i(String location);

	// 공유 작업실 review에 작성된 평균 별점
	public List<StarAvgVO> avg_star_s(String location);

	public List<Join_ConfirmVO> IConfirmList(Long mno);

	public List<Join_ConfirmVO> SConfirmList(Long mno);

	public List<Join_ConfirmVO> Sconfirm(@Param("cno") Long cno, @Param("mno") Long mno);

	public List<Join_ConfirmVO> Iconfirm(@Param("cno") Long cno, @Param("mno") Long mno);

	public boolean Ireview_insert(@Param("content") String content, @Param("star") int star, @Param("mno") Long mno,
			@Param("ino") Long ino, @Param("cno") Long cno);
	
	public boolean Sreview_insert(@Param("content") String content, @Param("star") int star, @Param("mno") Long mno,
			@Param("sno") Long sno, @Param("cno") Long cno);
	
	public int getWorkplaceCount();
	
	// 배치 프로그램 쿼리
	public List<uni_PhotoVO> getOldFiles();
	
	// shinchung List get
	public List<uni_ShinChungVO> getShinChung(int ino);
	
	// like shinchung
	public uni_ShinChungVO getShinChungLike(@Param("ino") int ino, @Param("reservation") String reservation);
	
	public void insertShinChung(uni_ShinChungVO vo);
}
