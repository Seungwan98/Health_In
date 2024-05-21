package com.angel.service;

import java.util.List;

import com.angel.model.Criteria;
import com.angel.model.ReviewPageDTO;
import com.angel.model.ReviewVO;

public interface ReviewService {
	public int insert(ReviewVO vo);

	public List<ReviewVO> selectAll();

	public int delete(Long rno);

	public int getTotalCount(Criteria cri);

	public ReviewPageDTO selectWithPaging(Criteria cri);
	
}
