package com.angel.model;

import java.sql.Date;

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
public class ReviewVO {
	private Long rno;
	private Long pno;
	private String memberId;
	private String review;
	private String name;
	private String image;
	private Date replyDate;
	private Date updateDate;
}
