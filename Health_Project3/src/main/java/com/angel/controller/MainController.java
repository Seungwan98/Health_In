package com.angel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.angel.model.MemberVO;
import com.angel.model.ProductVO;
import com.angel.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	
	@Autowired
	ProductService service;
	
	//메인 페이지 이동
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void mainPageGET(Model model ,HttpServletRequest request) {
	
		List<ProductVO>list=service.select();
		List<ProductVO>rankList1=new ArrayList<>();
		List<ProductVO>rankList2=new ArrayList<>();
		List<ProductVO>rankList3=new ArrayList<>();
		for(int i=0;i<3;i++) {
			rankList1.add(list.get(i));
			rankList2.add(list.get(i+3));
			rankList3.add(list.get(i+6));
		}
		rankList3.add(list.get(12));
		
		
		model.addAttribute("rankList1",rankList1);
		model.addAttribute("rankList2",rankList2);
		model.addAttribute("rankList3",rankList3);
		
		
		/*채팅관련 --------------------------------------------------------*/
	
		
		log.info("메인 페이지 진입");
	}
}
