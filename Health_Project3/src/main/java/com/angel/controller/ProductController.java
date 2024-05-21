package com.angel.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.angel.model.Criteria;
import com.angel.model.PageDTO;
import com.angel.model.ProductVO;
import com.angel.service.ProductService;
import com.angel.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	ProductService service;

	@Autowired
	ReviewService reviewservice;

	private List<ProductVO> list = new ArrayList<>();

	@GetMapping("/productList")
	public void getProductList(Model model, Criteria cri) {
		cri.setAmount(8);
		list = service.getToPaging(cri);
		int count = service.getTotalCount(cri);
		model.addAttribute("list", list);
		model.addAttribute("category", cri.getCategory());
		model.addAttribute("pageMaker", new PageDTO(cri, count));
	}

	@GetMapping("/productList/{category}")
	public String getProductListCategory(@PathVariable("category") String category, Model model, Criteria cri) {
		cri.setAmount(8);
		cri.setCategory(category);
		list = service.getToPaging(cri);

		int count = service.getTotalCount(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, count));
		model.addAttribute("category", category);
		return "/product/productList";

	}

	@GetMapping("/productDetail")
	public void getDetailPage(Model model, @RequestParam("pno") Long pno, Criteria cri) {

		// 다른 페이지에서 상품 클릭 시 받아온 pno로 하나의 컬럼을 받아옴 -> 객체화(productVO)
		ProductVO vo = service.selectOne(pno);

		String dExplain = vo.getDetailExplain();
		String dExplain2 = vo.getDetailExplain2();
		String dExplain3 = vo.getDetailExplain3();

		// 이미지 src들과 상세 설명들을 담은 모든 문자열들 합쳐줌.

		dExplain = dExplain + dExplain2 + dExplain3;

		// varchar2 최대 byte 수가 4000임으로 이를 넘기 때문에 각각 2개,3개의 컬럼을 사용했음.
		String dImage = vo.getDetailImage();
		String dImage2 = vo.getDetailImage2();

		dImage = dImage + dImage2;

		List<String> srcList = new ArrayList<>();

		// 상세페이지 이미지가 존재 할 경우에 하나의 문자열로 합쳐져 있는 다수의 src들을 서로 구분 해주기 위해 애초에 +를 중간에 삽입 하였음.
		// 떄문에 이를
		// 판단하여 src들을 구분하여줌.
		if (dImage != null) {
			int findIndex = dImage.indexOf("+");

			int firstIndex = 0;

			while (findIndex >= 0) {

				srcList.add(dImage.substring(firstIndex, findIndex));
				firstIndex = findIndex + 1;

				findIndex = dImage.indexOf("+", findIndex + 1);

				model.addAttribute("srcList", srcList);

			}

		}

		// 상세설명중 각각의 번호와 질문,답변을 중괄호로 판별시켜 놓았기에 이를 구분하여주기 위함.
		int findFirstIndex = dExplain.indexOf("{");
		int findSecondIndex = dExplain.indexOf("}");

		int count = 0;
		String detailExplain = "<ul>";
		String div = "";
		while (findFirstIndex >= 0) {
			// 첫번째 중괄호 일 시에 숫자가 들어옴으로 number class의 css를 사용해야 함으로 li와 div태그를 추가하여 새로운 문자열
			// 생성.
			if (count == 0) {
				div = "<li><div class='number'>";

			}

			// 두번째 중괄호 일 시 질문임으로 txt1 class 의 css로 사용하기 위해 div추가,
			else if (count == 1) {
				div = "<div class='txt1'>";
			}

			// 세번째(마지막)중괄호 일 시 대답임으로 위와 같이 txt2번 class의 div 추가.
			else {
				div = "<div class='info'><div class='txt2'>";
			}
			System.out.println(dExplain);

			detailExplain += div + dExplain.substring(findFirstIndex + 1, findSecondIndex) + "</div><br>";
			dExplain = dExplain.substring(findSecondIndex + 1);
			findFirstIndex = dExplain.indexOf("{");
			findSecondIndex = dExplain.indexOf("}");
			count++;
			// 마지막 중괄호 까지 끝나면 태그를 닫아주어야 함으로 닫은 후 count변수 초기화.
			if (count > 2) {
				detailExplain += "</div></li>";
				count = 0;
			}
		}
		// 모든 데이터들을 html화 후 ul을 닫아줌으로써 하나의 ul 태그 문자열 완성.
		detailExplain += "</ul>";
		vo.setDetailExplain(detailExplain);
		// pno 판단 후 하나의 객체 jsp 로 add
		model.addAttribute("vo", vo);

		// 포인트 문자열 숫자로 변환
		String integerPrice = vo.getPrice();
		integerPrice = integerPrice.replace(",", "");
		integerPrice = integerPrice.replace(" ", "");
		integerPrice = integerPrice.replace("원", "");

		System.out.println("가격 : " + Integer.parseInt(integerPrice));
		int totalIntegerPrice = Integer.parseInt(integerPrice);

		model.addAttribute("integerPrice", totalIntegerPrice);

	}

}
