package com.angel.mapper;

import java.util.List;

import com.angel.model.Criteria;
import com.angel.model.ProductVO;

public interface ProductMapper {
	public List<ProductVO> selectAll();
	public ProductVO selectOne(Long pno);
	public List<ProductVO> selectWithPaging(Criteria cri);
	public List<ProductVO> getToCategory(String category);
	public int getTotalCount(Criteria cri);

}
