<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<title>장바구니</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/cart/cart.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>


<%@ include file="includes/header.jsp"%>
<body>


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<div class="container">
		<h2>주문자 정보</h2>

		<div class="subjecet">
			<div class="form-group">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="form-control" name="memberName" id="user_input"
						placeholder="이름을 입력해주세요.">
				</div>
				<span class="final_name_ck"></span>
			</div>
			<div class="form-group">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="form-control" name="memberAddr1" readonly="readonly"
							id="address_input_1">
					</div>
					<div>
						<button type="button" class="btn-control" onclick="daum_address()">주소
							찾기</button>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="form-control" name="memberAddr2" readonly="readonly"
							id="address_input_2">
					</div>
				</div>
				<div class="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="form-control" name="memberAddr3" readonly="readonly"
							id="address_input_3" placeholder="">
					</div>
				</div>
				<span class="final_addr_ck"></span>
			</div>
		</div>
		<h2>주문 목록</h2>
		<table class="table" align="center">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>할인률</th>
					<th>합계</th>
				</tr>
			</thead>

			<c:forEach var="orderList" items="${orderList}">
				<tbody>
					<tr class="">
						<td class=""><span>${orderList.pno}</span></td>
						<td class=""><a
							href="/product/productDetail?pno=${orderList.pno}">${orderList.name}</a>
						</td>
						<td class=""><span>${orderList.price}</span></td>
						<td class=""><span>${orderList.amount}</span></td>
						<td class=""><span>${orderList.discounted}원</span></td>
						<td class=""><span>${orderList.totalPrice}원</span></td>


					</tr>

					<tr class="cart_info_td">

						<input type="hidden" class="product_name"
							value="${orderList.name}">
						<input type="hidden" class="product_price"
							value="${orderList.price}">
						<input type="hidden" class="amount" value="${orderList.amount}">
							<input type="hidden" class=discounted value="${orderList.discounted}">
						<input type="hidden" class="totalPrice"
							value="${orderList.totalPrice}">
						<input type="hidden" class="pno" value="${orderList.pno}">
						
					</tr>
				</tbody>
			</c:forEach>
			<input type="hidden" name="memberId" value="${member.memberId}">
			
			


		</table>






		<div class="text-right">

			<c:forEach var="orderList" items="${orderList}">
				<input type="hidden" class="finalTotalPrice"
					value="${orderList.totalPrice}">
				<c:set var="total" value="${total + orderList.totalPrice}" />

			</c:forEach>
			<c:out value="주문금액 : ${total}원"></c:out>

			<form action="/order/${member.memberId}" method="post"
				class="order_form">
				<button type="button" class="buyBtn">주문하기</button>
			</form>

		</div>
	</div>




	<script>
				
					
					

					function daum_address() {
		                new daum.Postcode({
		                    oncomplete: function (data) {
		                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                        var addr = ''; // 주소 변수
		                        var extraAddr = ''; // 참고항목 변수

		                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                            addr = data.roadAddress;
		                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                            addr = data.jibunAddress;
		                        }

		                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                        if (data.userSelectedType === 'R') {
		                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
		                                extraAddr += data.bname;
		                            }
		                            // 건물명이 있고, 공동주택일 경우 추가한다.
		                            if (data.buildingName !== '' && data.apartment === 'Y') {
		                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                            }
		                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                            if (extraAddr !== '') {
		                                extraAddr = ' (' + extraAddr + ')';
		                            }
		                            //주소변수 문자열과 참고항목 문자열 합치기
		                            addr += extraAddr;

		                        } else {
		                            addr += ' ';
		                        }

		                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                        $("#address_input_1").val(data.zonecode);
		                        $("#address_input_2").val(addr);
		                        // 커서를 상세주소 필드로 이동한다.
		                        $("#address_input_3").attr("readonly", false);
		                        $("#address_input_3").attr("placeholder","상세주소를 입력해주세요.");
		                        $("#address_input_3").focus();

		                    }
		                }).open();
		            }
					
					
					
			$(document).ready(function () {
				$(".buyBtn").on("click", function () {
					let form_contents = '';
					let orderNumber = 0;
					$(".cart_info_td").each(function (index, element) {

						let pno = $(element).find(".pno").val();
						let amount = $(element).find(".amount").val();
						let price = $(element).find(".product_price").val();
						let discounted = $(element).find(".discounted").val();
						
						

						let pno_input = "<input name='orders["+orderNumber+"].pno' type='hidden' value='" + pno + "'>";
						form_contents += pno_input;

						let amount_input = "<input name='orders["+orderNumber+"].amount' type='hidden' value='" + amount + "'>";
						form_contents += amount_input;
						
						let product_price = "<input name='orders["+orderNumber+"].product_price' type='hidden' value='" + price + "'>";
						form_contents += product_price;
						
						let product_discount = "<input name='orders["+orderNumber+"].product_discount' type='hidden' value='" + discounted + "'>";
						form_contents += product_discount;
						
						
						orderNumber += 1;
						console.log(amount_input);
						
						

					});
					let memberAddr1=$("#address_input_1").val();
					let memberAddr2=$("#address_input_2").val();
					let memberAddr3=$("#address_input_3").val();
					let memberName=$("#user_input").val();
					let addr1_input = "<input name='memberAddr1' type='hidden' value='" + memberAddr1 + "'>";
					form_contents += addr1_input;
					
					let addr2_input = "<input name='memberAddr2' type='hidden' value='" + memberAddr2 + "'>";
					form_contents += addr2_input;
					
					let addr3_input = "<input name='memberAddr3' type='hidden' value='" + memberAddr3 + "'>";
					form_contents += addr3_input;
					
					let user_input = "<input name='memberName' type='hidden' value='" + memberName + "'>";
					form_contents += user_input;
					
					
					$(".order_form").html(form_contents);
					$(".order_form").submit();
				});	
					});
						
					</script>
</body>

</html>