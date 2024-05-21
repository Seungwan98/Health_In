package com.angel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Log4j
@Builder
public class FoodVO {
	private Long Fno;
	private String name;

	private Float totalVolume;

	private Float kcal;
	private Float carbohydrate;
	private Float protein;
	private Float sugar;
	private Float natrium;
	private Float cholesterol;
	private Float fattyAcid;
	private Float transFattyAcid;

}
