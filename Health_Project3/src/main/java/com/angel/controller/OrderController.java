package com.angel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.angel.model.OrderDTO;
import com.angel.model.OrderItemDTO;
import com.angel.model.OrderPageDTO;
import com.angel.service.MemberService;
import com.angel.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	MemberService memberService;
	@GetMapping("/order/{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId,OrderPageDTO orders,Model model) {
		//System.out.println(orders.getOrders());
		
	
		System.out.println(memberId);
		
		model.addAttribute("orderList",orderService.getListToOrder(orders.getOrders()));
		model.addAttribute("memberInfo" ,memberService.getMemberToOrder(memberId));
		
		
		return "/order";
	}
	
	@PostMapping("/order/{memberId}")
	public String orderPagePost(String memberId,OrderDTO dto,Model model) {
		
		
		orderService.setOrders(dto);
		
		
		
		
		
		
	
		
		return "";
		
	}
	

}
