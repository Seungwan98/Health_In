package com.angel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Log4j
@Builder
public class ProductVO {
	
	private Long pno;
	private Long product_num;
	private String name;
	private String category;
	private String img;
	private String tagContent;
	private Long count;
	private String price;
	private String country;
	private String discount;
	private String detailExplain;
	private String detailExplain2;
	private String detailExplain3;
	private String detailImage;
	private String detailImage2;
	
	private int amount;
	
	
	
	
    
}
