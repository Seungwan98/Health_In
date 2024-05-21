package com.angel.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	
	private String orderId;
	private String memberName;
	private String memberId;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private String orderState;
	private List<OrderItemDTO> orders;
	private int deliveryCost;
	private int usePoint;
	private Date OrderDate;

}
