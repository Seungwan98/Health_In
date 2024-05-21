package com.angel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.angel.service.FoodService;
import com.angel.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/crawling/*")
@Log4j
public class CrawlingController {

	@Autowired
	private ProductService service;
	@Autowired
	private FoodService foodService;

	@GetMapping("/product")
	public void product() {
		int result = service.crwaling();
		System.out.println(result);


	}

	@GetMapping("/apicrawl")
	public void ApiCrawl() throws Exception {
		foodService.setDataBase();
		
	}


}
