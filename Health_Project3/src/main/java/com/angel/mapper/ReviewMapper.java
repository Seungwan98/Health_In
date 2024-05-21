package com.angel.mapper;

import java.util.List;

import com.angel.model.Criteria;
import com.angel.model.ReviewVO;

public interface ReviewMapper {
	
	public int insert(ReviewVO vo);

	public List<ReviewVO> selectAll();

	public int delete(Long rno);

	public int getTotalCount(Criteria cri);
	
	public List<ReviewVO> selectWithPaging(Criteria cri);
	

	
	

}
