<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<title>장바구니</title>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
				<link rel="stylesheet" href="/resources/css/cart/cart.css">
				<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
			</head>

			<body>
				<%@ include file="includes/header.jsp" %>


					<div class="container">
						<h2>${member.memberName}님의장바구니 리스트</h2>
						<table class="table" align="center">
							<thead>
								<tr>
								<th></th>
									<th>번호</th>
									<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>합계</th>
								</tr>
							</thead>

							<c:forEach var="cart" items="${cartInfo}">
								<tbody>
									<tr class="">
									<td><a href="cart/${member.memberId}/${cart.pno}" class="deleteCart">삭제</a></td>
										<td class="cart_num"><span>${cart.cart_num}</span></td>
										<td class=""><a
												href="/product/productDetail?pno=${cart.pno}">${cart.product_name}</a>
										</td>
										<td class=""><span>${cart.product_price}</span></td>
										<td class=""><span>${cart.amount}</span></td>
										<td class=""><span>${cart.totalPrice}원</span></td>
										


									</tr>

									<tr class="cart_info_td">
										<input type="hidden" class="cart_num" value="${cart.cart_num}">
										<input type="hidden" class="product_name" value="${cart.product_name}">
										<input type="hidden" class="product_price" value="${cart.product_price}">
										<input type="hidden" class="amount" value="${cart.amount}">
										<input type="hidden" class="totalPrice" value="${cart.totalPrice}">
										<input type="hidden" class="pno" value="${cart.pno}">
									<tr>
								</tbody>
							</c:forEach>
						</table>

						<div class="text-right">

							<c:forEach var="cart" items="${cartInfo}">
								<input type="hidden" class="finalTotalPrice" value="${cart.totalPrice}">
								<c:set var="total" value="${total + cart.totalPrice}" />

							</c:forEach>
							<c:out value="주문금액 : ${total}원"></c:out>
							<button type="button" class="buyBtn">주문하기</button>
						</div>
					</div>

					<form action="/order/${member.memberId}" method="get" class="order_form"></form>


					<script>



						$(document).ready(function () {
							$(".buyBtn").on("click", function () {
								let form_contents = '';
								let orderNumber = 0;
								$(".cart_info_td").each(function (index, element) {

									let pno = $(element).find(".pno").val();
									let amount = $(element).find(".amount").val();

									let pno_input = "<input name='orders["+orderNumber+"].pno' type='hidden' value='" + pno + "'>";
									form_contents += pno_input;

									let amount_input = "<input name='orders["+orderNumber+"].amount' type='hidden' value='" + amount + "'>";
									form_contents += amount_input;
									orderNumber += 1;
									console.log(amount_input);

								});
								$(".order_form").html(form_contents);
								$(".order_form").submit();
							});
							
							
							
							
							
							
							
							$(".deleteCart").on("click",function(){
								alert("삭제되었습니다");
							});
							





							let totalPrice = 0; // 총 가격
							let finalTotalPrice = 0; // 최종 가격



							finalTotalPrice = totalPrice; //모든 상품들의 합을 구해야되는뎅 

							$(".finalTotalPrice").text(finalTotalPrice);

							console.log("최종가격" + finalTotalPrice);

						});
					</script>
			</body>

			</html>