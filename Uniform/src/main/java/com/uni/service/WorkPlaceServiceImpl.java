package com.uni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.domain.StarAvgVO;
import com.uni.domain.uni_PhotoVO;
import com.uni.domain.uni_workplace_iVO;
import com.uni.mapper.uni_workplaceMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
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
	
	@Transactional
	@Override
	public void insertWorkPlace_i(uni_workplace_iVO vo) {
		// TODO Auto-generated method stub
		// workplace_i에 insert
		mapper.insertWorkPlace_i(vo);
		// 첨부파일 insert
		for(int i=0; i<vo.getAttachList().size(); i++) {
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
