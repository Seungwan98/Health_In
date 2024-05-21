package com.angel.model;

import javax.annotation.Generated;

import lombok.Data;


@Data
public class Criteria {
	
	private int pageNum;
	private int amount;
	private String category;
	private String rno;
	private String pno;
	
	public Criteria() {
		this(1,10,"vitamin");
	}
	
	public Criteria(int pageNum , int amount ,String category) {
		this.pageNum=pageNum;
		this.amount=amount;
		this.category=category;
		
	}
}
