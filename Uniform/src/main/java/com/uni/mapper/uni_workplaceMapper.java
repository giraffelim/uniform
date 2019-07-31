package com.uni.mapper;

import java.util.List;

import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_PhotoVO;
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
	public int updateWorkPlace_i (uni_workplace_iVO vo);

	// photo delete
	public void deletePhoto(int ino);


}
