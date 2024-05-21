package com.angel.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.angel.mapper.MemberMapper;
import com.angel.mapper.OrderMapper;
import com.angel.model.MemberVO;
import com.angel.model.OrderDTO;
import com.angel.model.OrderItemDTO;
import com.angel.model.OrderPageItemDTO;
@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderMapper mapper;
	@Autowired
	MemberMapper membermapper;
	


	@Override
	public List<OrderPageItemDTO> getListToOrder(List<OrderPageItemDTO> orders) {
		List<OrderPageItemDTO> result=new ArrayList<>();
		
		
		for(OrderPageItemDTO ord:orders) {
			OrderPageItemDTO pItemInfo=mapper.getListToOrder(ord.getPno());
			System.out.println(pItemInfo);
			pItemInfo.setAmount(ord.getAmount());
			
			pItemInfo.initIntegerPrice();
			pItemInfo.initdiscountPrice();
			pItemInfo.initTotalPrice();
			
			result.add(pItemInfo);
			
		}
		//System.out.println(result);
		
		return result;
		
	}




	@Override
	public void setOrders(OrderDTO dto) {
		MemberVO mvo=membermapper.getMemberToOrder(dto.getMemberId());
		
		
		System.out.println("OrderDto");
		System.out.println(dto);
		
		Date date=new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId=mvo.getMemberId()+format.format(date);
		
		System.out.println(format.format(date));
		
		dto.setOrderId(orderId);
		dto.setOrderDate(date);
		mapper.insertOrder(dto);
		
		for(OrderItemDTO item:dto.getOrders()) {

			item.setOrderId(orderId);
			mapper.insertItems(item);
		}
		
		
		
		
	}	


}
