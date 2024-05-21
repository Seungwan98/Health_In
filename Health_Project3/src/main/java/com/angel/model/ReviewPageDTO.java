package com.angel.model;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
public class ReviewPageDTO {
	
	private List<ReviewVO>list;
	private PageDTO pageInfo;
	

}
