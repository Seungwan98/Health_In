package com.angel.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.angel.model.CartDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartServiceTests {

	@Autowired
	private CartService service;
	
	//등록 테스트
	@Test
	public void addCart() {
		
		String memberId = "지현";
		Long product_num = 104L;
		int amount = 10;
		
		CartDTO dto = new CartDTO();
		dto.setMemberId(memberId);
		//dto.setProduct_num(product_num);
		dto.setAmount(amount);
		
		int result = service.addCart(dto);
		
		log.info("결과 : " + result);
		
	}
	
	
	
}
