package com.angel.mapper;

import java.util.List;

import com.angel.model.OrderDTO;
import com.angel.model.OrderItemDTO;
import com.angel.model.OrderPageItemDTO;

public interface OrderMapper {
	public OrderPageItemDTO getListToOrder(Long pno);

	

	public void insertItems(OrderItemDTO item);



	public void insertOrder(OrderDTO dto);
}
