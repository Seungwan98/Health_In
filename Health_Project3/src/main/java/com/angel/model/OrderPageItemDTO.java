package com.angel.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Log4j
public class OrderPageItemDTO {
	private Long pno;
	private int amount;

	private String name;
	private String price;
	private String discount;
	private double discounted;

	private double totalPrice;
	private int integerPrice;

	public void initTotalPrice() {
		this.totalPrice = this.amount * this.integerPrice - this.discounted;

	}

	public void initIntegerPrice() {
		String integerPrice = this.price;
		integerPrice = integerPrice.replace(",", "");
		integerPrice = integerPrice.replace(" ", "");
		integerPrice = integerPrice.replace("원", "");
		this.integerPrice = Integer.parseInt(integerPrice);
	}

	public void initdiscountPrice() {
		if (this.discount != null) {
			String integerPrice = this.discount;
			integerPrice = integerPrice.replace(",", "");
			integerPrice = integerPrice.replace(" ", "");
			integerPrice = integerPrice.replace("원", "");
			this.discounted = (Integer.parseInt(integerPrice) - this.integerPrice);
		}
	}

}
