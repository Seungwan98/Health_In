package com.angel.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.angel.model.Criteria;
import com.angel.model.ReviewPageDTO;
import com.angel.model.ReviewVO;
import com.angel.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	
	private List<ReviewVO>rlist=new ArrayList<>();
	@Autowired
	ReviewService reviewservice;
	
	

	@GetMapping(value="/list" , produces =   MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ReviewPageDTO getGetAll(Criteria cri) {
	
		
		return reviewservice.selectWithPaging(cri);
	}
	
	@PostMapping(value="/add")
	public String addReview(ReviewVO vo,Long pno) {
		reviewservice.insert(vo);
		
		
		
		return "redirect:/product/productDetail?pno="+pno;
	}
	
	@PostMapping(value="/delete")
	@ResponseBody
	public void deleteReview(Long rno,Long pno) {
		 reviewservice.delete(rno);
		
	}
	
	
	

}
