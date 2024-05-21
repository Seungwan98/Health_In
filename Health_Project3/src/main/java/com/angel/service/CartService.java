package com.angel.service;

import java.util.List;

import com.angel.model.CartDTO;

public interface CartService {

	//장바구니 추가
	public int addCart(CartDTO cart);
	
	//장바구니 정보 리스트
	public List<CartDTO> getCartList(String memberId);
	
	
	
	
}
