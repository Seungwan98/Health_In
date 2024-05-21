package com.angel.service;

import java.util.List;

import com.angel.model.Criteria;
import com.angel.model.ProductVO;


public interface ProductService {
	public int crwaling();

	public List<ProductVO> select();

	public ProductVO selectOne(Long pno);

	public List<ProductVO> getToCategory(String category);
	
	public List<ProductVO> getToPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri); 
	
}
