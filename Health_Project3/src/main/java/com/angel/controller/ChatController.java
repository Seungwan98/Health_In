package com.angel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.angel.model.MemberVO;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping(value = "/chat")
public class ChatController {

	@GetMapping("/chatting")
	public String chat(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO member=(MemberVO) session.getAttribute("member");
		
		
		
		
		
		model.addAttribute("userid", member.getMemberId());
		return "/chat/chat";
		
	}
}