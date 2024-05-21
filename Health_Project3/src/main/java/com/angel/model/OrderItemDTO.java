package com.angel.model;

import lombok.Data;

@Data
public class OrderItemDTO {
	private int OrderItemId;
	private String orderId;
	private int pno;
	private int amount;
	private String product_price;

	private String product_discount;

	

}
