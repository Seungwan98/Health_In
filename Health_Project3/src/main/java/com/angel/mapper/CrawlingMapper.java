package com.angel.mapper;


import java.util.List;

import com.angel.model.ProductVO;



public interface CrawlingMapper {

	public int insert(List<ProductVO> list);
	public int deleteAll();
	

}