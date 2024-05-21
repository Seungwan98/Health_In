package com.angel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.angel.mapper.ReviewMapper;
import com.angel.model.Criteria;
import com.angel.model.PageDTO;
import com.angel.model.ReviewPageDTO;
import com.angel.model.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewMapper mapper;

	public int insert(ReviewVO vo) {
		return mapper.insert(vo);
		
		
		
	}
	public List<ReviewVO> selectAll() {

		
		return  mapper.selectAll();
	}
	@Override
	public int delete(Long rno) {
		return mapper.delete(rno);
		
	}
	@Override
	public int getTotalCount(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public ReviewPageDTO selectWithPaging(Criteria cri){
		ReviewPageDTO dto =new ReviewPageDTO();
		dto.setList(mapper.selectWithPaging(cri));
		
		
		
		dto.setPageInfo(new PageDTO(cri,mapper.getTotalCount(cri)));
		return dto;
	
	}
	
	
}
