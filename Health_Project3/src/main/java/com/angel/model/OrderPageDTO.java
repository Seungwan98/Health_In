package com.angel.model;



import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Data
public class OrderPageDTO {
	
	private List<OrderPageItemDTO> orders;

}
