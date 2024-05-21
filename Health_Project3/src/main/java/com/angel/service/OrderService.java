package com.angel.service;

import java.util.List;

import com.angel.model.OrderDTO;
import com.angel.model.OrderPageItemDTO;

public interface OrderService{	
	public List<OrderPageItemDTO> getListToOrder(List<OrderPageItemDTO> orders);

	public void setOrders(OrderDTO dto);
}
