package com.angel.model;

import lombok.Data;

@Data
public class CartDTO {

	// DB에 있는 변수
	private int cart_num;
	private String memberId;
	private Long pno;
	private int amount;
	private String product_name;
	private String product_price;
	private double product_discount;
	private int totalPrice;
	private int integerPrice; // 정수로 변환된 가격
	private String finaltotalprice;

	// totalPrice 초기화
	public void initTotalPrice() {
		this.totalPrice = this.integerPrice * this.amount;
	}

	public void initDiscount() {
		this.product_discount = (int) (Math.floor(this.integerPrice * 0.05));
	}

	public void initFinalTotalPrice() {
//		String stringPrice =  Integer.toString(integerPrice);
//		String forPrice="";
//		if (stringPrice.length() <= 3) {
//			this.finaltotalprice =  stringPrice;
//		} else {
//			for (int i = 0; i < stringPrice.length()-1 / 3; i++) {
//				forPrice=stringPrice.substring(i * 3, (i + 1) * 3);
//				this.finaltotalprice = this.finaltotalprice + forPrice + ",";
//
//			}
//		}

	}

}
