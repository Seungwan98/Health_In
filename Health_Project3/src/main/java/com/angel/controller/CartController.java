package com.angel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.angel.model.CartDTO;
import com.angel.model.MemberVO;
import com.angel.service.CartService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) throws Exception{
		
		//로그인 체크
		log.info("장바구니 상품 추가");
	
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		log.info("장바구니로 전달된 데이터 : " + cart);
		
		if(vo == null) {
			return "5";
		}
		
		//카트 등록
		int result = cartService.addCart(cart);
		
		log.info(result);
		return result + "";
	}
	
	@GetMapping("/cart/{memberId}")
	public String cartPageGET(@PathVariable("memberId") String memberId, Model model) {
		List<CartDTO> cartList=cartService.getCartList(memberId);
		
		
		System.out.println("하이");
		System.out.println(cartList);
		model.addAttribute("cartInfo", cartList);
		
//		log.info("전달된 데이터 : " + model);
		
		return "/cart";
	}
	
	
}



