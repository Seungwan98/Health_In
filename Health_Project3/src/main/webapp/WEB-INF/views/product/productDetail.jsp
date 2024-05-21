<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<title>쇼핑몰 홈페이지</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%@ include file="../includes/header.jsp"%>


<style>
@import url('/resources/css/product/productDetail.css');

.btn_cart {
	background-color: #eee;
	color: #fff;
	display: inline-block;
	margin-bottom: 0;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	border-radius: 4px;
	user-select: none;
}

.reply_button_wrap {
	padding: 10px;
}

.reply_button_wrap button {
	background-color: #365fdd;
	color: white;
	font-weight: bold;
	font-size: 15px;
	padding: 5px 12px;
	cursor: pointer;
}

.reply_button_wrap button:hover {
	background-color: #1347e7;
}

/* 리뷰 영역 */
.content_bottom {
	width: 80%;
	margin: auto;
}

.reply_content_ul {
	list-style: none;
}

.comment_wrap {
	position: relative;
	border-bottom: 1px dotted #d4d4d4;
	padding: 14px 0 10px 0;
	font-size: 12px;
}

/* 리뷰 머리 부분 */
.reply_top {
	padding-bottom: 10px;
}

.id_span {
	padding: 0 15px 0 3px;
	font-weight: bold;
}

.date_span {
	padding: 0 15px 0;
}

/* 리뷰 컨텐트 부분 */
.reply_bottom {
	padding-bottom: 10px;
}

/* 리뷰 선 */
.reply_line {
	width: 80%;
	margin: auto;
	border-top: 1px solid #c6c6cf;
}

/* 리뷰 제목 */
.reply_subject h2 {
	padding: 15px 0 5px 5px;
}

/* pageMaker */
.repy_pageInfo_div {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 40px;
}

.pageMaker {
	list-style: none;
	display: inline-block;
}

.pageMaker_btn {
	float: left;
	width: 25px;
	height: 25px;
	line-height: 25px;
	margin-left: 20px;
	font-size: 10px;
	cursor: pointer;
}

.active {
	border: 2px solid black;
	font-weight: 400;
}

.next, .prev {
	border: 1px solid #ccc;
	padding: 0 10px;
}

/* 리뷰 없는 경우 div */
.reply_not_div {
	text-align: center;
}

.reply_not_div span {
	display: block;
	margin-top: 30px;
	margin-bottom: 20px;
}

/* 리뷰 수정 삭제 버튼 */
.update_reply_btn {
	font-weight: bold;
	background-color: #1347e7;
	display: inline-block;
	width: 40px;
	text-align: center;
	height: 20px;
	line-height: 20px;
	margin: 0 5px 0 30px;
	border-radius: 6px;
	color: white;
	cursor: pointer;
}

.delete_reply_btn {
	font-weight: bold;
	background-color: #1347e7;
	display: inline-block;
	width: 40px;
	text-align: center;
	height: 20px;
	line-height: 20px;
	border-radius: 6px;
	color: white;
	cursor: pointer;
}
</style>

</head>

<body>




	<div class="container">

		<input type="hidden" name="memberId" value="${member.memberId}">
		<input type="hidden" name="pno" value="${vo.pno}"> <input
			type="hidden" name="amount" id="amount" value="${vo.amount}">
		<input type="hidden" name="product_num" value="${vo.product_num}">
		<input type="hidden" name="price" value="${vo.price}"> <input
			type="hidden" name="discount" value="${vo.discount}">
		<div class="row">
			<div class="col-md-6">
				<img src="${vo.img}" class="product-img" alt="Product Image">
			</div>
			<div class="col-md-6">
				<h2>${vo.name}</h2>
				<p class="product-info">구매</p>
				<h3>가격: ${vo.price}</h3>

				<div>
					적립 포인트 : <span>${Math.floor(integerPrice*0.05)}</span>원
				</div>

				<div>
					<!-- 장바구니 수량 변경 gpt -->
					<!-- <input type="number" min="1" max="10" value="1"> -->

					<!-- 장바구니 수량 변경.유미 -->
					<input type="text" class="quantity_input" value="1"> 
					<span class="plmn_buttons">
						<button class="plus_btn">+</button> <!-- style="background-color:#5cb85c" -->
						<button class="minus_btn">-</button>
					</span> 
					<br><br>

				</div>
				<button type="button" class="btn_cart">
					<a href="/cart/${member.memberId}">장바구니</a>
				</button>
				<button type="button" class="btn btn-success">구매하기</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<div class="storeMD">
					<div class="type_A">${vo.detailExplain}</div>

				</div>
				<div class="detail-images">
					<c:forEach items="${srcList}" var="src">

						<img src="${src}" class="detail-image" alt="Product Detail 1">

					</c:forEach>
				</div>
			</div>
		</div>
		<div class="span16">
			<div class=" last-type product-discussion">
				<h4 class="ml-product-view-block-title"
					id="content_discussion_block">
					
					상품후기<span class="reviewTotal"> </span>  <span class="average-rating"> <span
						class="ty-nowrap ty-stars"> <a class="cm-external-click"
							data-ca-scroll="content_discussion_block"
							data-ca-external-click-id="content_discussion_block"> <i
								class="ty-stars__icon ty-icon-star"></i> <i
								class="ty-stars__icon ty-icon-star"></i> <i
								class="ty-stars__icon ty-icon-star"></i> <i
								class="ty-stars__icon ty-icon-star"></i> <i
								class="ty-stars__icon ty-icon-star"></i> <span
								class="ty-stars-discussion-count"
								style="display: none; color: #1347e7; vertical-align: middle;">15</span>
						</a>

					</span>
					</span>
				</h4>
				<div class="discussion-block ml-collapsible is_collapsed">
					<div class="discussion-control">








						<div class="discussion-order">


							<select id="pagination-order" class="pagination-order"
								data-order-by="newest">
								<option value="newest" selected="selected">최신순</option>
								<option value="oldest">오래된순</option>
								<option value="highest">높은 평가순</option>
								<option value="lowest">낮은 평가순</option>
								<option value="most">추천 많은순</option>

							</select>
						</div>
					</div>

					<div class="test"></div>

					<div class="reply_not_div"></div>
					<ul class="reply_content_ul">

					</ul>
					<div class="repy_pageInfo_div">
						<ul class="pageMaker">

						</ul>

					</div>

					<br>





					<div id="posts_list">









						<input type="hidden" name="memberId" value="${member.memberId}" />
						<input type="hidden" name="memberName"
							value="${member.memberName}" /> <input type="hidden" name="pno"
							value="${vo.pno}" />


						<div class="card" id="comments">
							<div class="card-body">

								<div class="form-group">
									<label>댓글 작성</label>
									<div class="discussion-order">


										<select id="rank-order" class="" data-order-by="newest">
											<option value="1" selected="selected">★</option>
											<option value="2">★★</option>
											<option value="3">★★★</option>
											<option value="4">★★★★</option>
											<option value="5">★★★★★</option>

										</select>
									</div>
									<c:if test="${member!=null}">
										<textarea class="form-control" id="comment-content" rows="3"
											name="review"></textarea>
										<input type="hidden" id="comment-author" value="익명">
										<button type="submit" class="btn btn-primary"
											id="comment-create-btn">등록</button>
									</c:if>

									<c:if test="${member==null}">
										<textarea class="form-control" id="comment-content" rows="3"
											readonly placeholder="리뷰를 입력하려면 로그인을 해주세요."></textarea>
									</c:if>


								</div>


							</div>
						</div>


					</div>

				</div>





			</div>

		</div>



		<!--posts_list-->
	</div>




	</div>

	</div>




	<script>
					$(document).on('click', '.delete_reply_btn', function (e) {

						e.preventDefault();
						let rno = $(this).attr("id");
						
						$.ajax({
							data: {
								rno: rno

							},
							url: '/review/delete',
							type: 'POST',

							success: function (result) {
								console.log(result);
								alert('삭제가 완료되엇습니다.');
								location.reload();

							}
						});

					});
					$(document).on('click', '.update_reply_btn', function (e) {
				
						var rno=$(this).attr("id");
						console.log(rno);
						$("."+rno).css("display","block")
						
					})	


					$(".btn-primary").on("click", function (e) {
						const memberId = '${member.memberId}';
						const memberName = '${member.memberName}';
						const pno = '${vo.pno}';
						const review = $('#comment-content').val();
						const rank = $('.rank-order').val();


						const data = {
							pno: pno,
							memberId: memberId,
							name: memberName,
							review: review,
							rank:rank
						
						}

						$.ajax({
							data: data,
							type: 'POST',
							url: '/review/add',
							success: function (result) {
								document.location.reload();
							}
						})



					});
					function increaseQuantity(button) {
						var input = button.previousElementSibling;
						var value = parseInt(input.value);
						if (value < parseInt(input.max)) {
							input.value = value + 1;
						}
					}

					function decreaseQuantity(button) {
						var input = button.nextElementSibling;
						var value = parseInt(input.value);
						if (value > parseInt(input.min)) {
							input.value = value - 1;
						}
					}

					$(document)
						.ready(


							function makeReview() {
								var total =0;
								const pno = '${vo.pno}'
								$
									.getJSON(
										"/review/list",
										{
											pno: pno
										},
										function (data) {
											const list = data.list;
											
											console.log(total);
											const pf = data.pageInfo;
											
											
											var str = "<ul class='reply_content_ul'>";


											$(list)
												.each(
													function () {
														total=total+1;
														var buttons = "";

														if (this.memberId == '${ member.memberId }') {
															buttons = "<a  id='" + this.rno + "' class='update_reply_btn'>수정</a><a class='delete_reply_btn' id='" + this.rno + "' >삭제</a>"
														}




														var repDate = new Date(
															this.updateDate);
														repDate = repDate
															.toLocaleDateString("ko-US")


														str += "<li>"
															+ "<input type='hidden' id='rno' value='" + this.rno + "' />"
															+ "<div class='comment_wrap'>"
															+ "<div class='reply_top'>"
															+ "<span class='id_span'>"
															+ this.name
															+ "</span>"
															+ "<span class='date_span'>"
															+ repDate
															+ "</span>"
															+ buttons
															+ "</div>"
															+ "<div class='reply_bottom'>"

															+ "<div class='reply_bottom_txt'>"
															+ this.review
															+ "</div>"
															+ "</div>"
															+ "</div>"
															+"<div style='display:none' class="+this.rno+">"
															+"<textarea class='form-control' id='comment-update' rows='3'"
															+"name='review'></textarea><button type='submit' class='btn btn-primary'"
															+"id='comment-create-btn'>수정</button></div>"
															+ "</li>";


													});
											str += "</ul>"

											$(".test").html(str);
											var totals="("+total+")"
											$(".reviewTotal").text(totals);
											

											let reply_pageMaker = '';

											/* prev */
											if (pf.prev) {
												let prev_num = pf.startPage - 1;
												reply_pageMaker += '<li class="pageMaker_btn prev">';
												reply_pageMaker += '<a href="' + prev_num + '">이전</a>';
												reply_pageMaker += '</li>';
											}
											/* numbre btn */
											for (let i = pf.startPage; i < pf.endPage + 1; i++) {
												reply_pageMaker += '<li class="pageMaker_btn ';
												if (pf.cri.pageNum === i) {
													reply_pageMaker += 'active';
												}
												reply_pageMaker += '">';
												reply_pageMaker += '<a href="' + i + '">' + i + '</a>';
												reply_pageMaker += '</li>';
											}
											/* next */
											if (pf.next) {
												let next_num = pf.endPage + 1;
												reply_pageMaker += '<li class="pageMaker_btn next">';
												reply_pageMaker += '<a href="' + next_num + '">다음</a>';
												reply_pageMaker += '</li>';
											}

											$(".pageMaker").html(reply_pageMaker);


										});

							});
					

					//수량 버튼 조작
					let quantity = $(".quantity_input").val();
					let amount = $("#amount").val(); 
					
				/* 	$(".plus_btn").on("click", function(){
						$(".quantity_input").val(++quantity);
					}); */
					
					
					
					
					$(".plus_btn").on("click", function(){
						if(quantity <= amount){
						$(".quantity_input").val(++quantity);
						} else if (quantity > amount){
							alert("구매 가능한 최대 수량은 " + amount + "개 입니다.");
							$(".quantity_input").val(amount);
						}
					});
					
					console.log(amount);
					
					$(".minus_btn").on("click", function(){
							if(quantity > 1){
								$(".quantity_input").val(--quantity);
							}
					});

					//서버로 전송할 데이터
					const form = {
						memberId : '${member.memberId}',
						pno : '${vo.pno}',
						amount : '',
						product_name : '${vo.name}',
						product_price : '${vo.price}',
						totalPrice : '',
						integerPrice : '${integerPrice}'
						
					}
						console.log(form);	

				 	//장바구니 추가 버튼
				 	$(".btn_cart").on("click", function(e){
						var amount = $(".quantity_input").val();
						form.amount=amount;
						form.totalPrice = ${integerPrice*amount};
						
						console.log(form);
					
						$.ajax({
							url : "/cart/add",
							type : "POST",
							data : form,
							success : function(result){
									cartAlert(result);	
									
							}
						});
					});
					
					function cartAlert(result){
						if(result == '0'){
							alert("장바구니에 추가 하지 못하였습니다.");
						}else if(result == '1'){
							alert("장바구니에 추가되었습니다.");
						}else if(result == '2'){
							alert("장바구니에 이미 추가되었습니다.");
						}else if(result == '5'){
							alert("로그인이 필요합니다.");
						}
					} 
							
						
				</script>
	<%@ include file="../includes/footer.jsp"%>
</body>

</html>