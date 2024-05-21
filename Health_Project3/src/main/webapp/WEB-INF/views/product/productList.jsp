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
<link rel="stylesheet" href="/resources/css/product/productList.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ include file="../includes/header.jsp" %>

</head>

<body>

	
	
	
<div class="pc-top-categories-block  show ">
		<div class="pc-top-categories">
			<div class="pc-top-categories-items">
				<div class="pc-top-categories-item">
					<a href="/product/productList/vitamin"><span>비타민</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/omega3/"><span>오메가3</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/prebiotics/"><span>식이섬유</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/probiotics/"><span>유산균</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/magnesium-ko-2/"><span>마그네슘</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/applecidervinegar/"><span>애플
							사이다 비니거</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/mctoil/"><span>MCT오일</span></a>
				</div>

				<div class="pc-top-categories-item">
					<a href="/product/productList/fresh/"><span>닭가슴살</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/recovery/"><span>단백질</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/supplements/"><span>부스터</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/intra/"><span>지구력</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/aminoacid/"><span>BCAA/EAA</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/creatine/"><span>크레아틴</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/arginine/"><span>아르기닌</span></a>
				</div>

				<div class="pc-top-categories-item">
					<a href="/product/productList/shaker/"><span>쉐이커</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/gear/"><span>용품</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/fashion/"><span>패션</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/competition/"><span>프로탄</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/diet/"><span>다이어트</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/hair-loss-care/"><span>탈모</span></a>
				</div>
				<div class="pc-top-categories-item">
					<a href="/product/productList/purpose/"><span>그 외 카테고리</span></a>
				</div>
			</div>
		</div>
	</div>

	<div class="recommendation">
		<div class="container">
			<h2>상품목록</h2>

			<div class="list_gird">

				<c:forEach items="${list}" var="list">

					<div class="col-md-3">
						<div class="product">
							<a href="/product/productDetail?pno=${list.pno}"> <img
								src="${list.img}" alt="Product Image"> <span>${list.name}</span>
							</a>
							<p class="price">${list.price}</p>
							<div class="buttons">
								<button class="btn btn-primary btn-sm">장바구니 담기</button>
								<button class="btn btn-primary btn-sm">구매하기</button>
							</div>

						</div>
					</div>

				</c:forEach>
			</div>

		</div>
		<form action="/product/productList/${category}" id="actionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />

		</form>
		<div class="row">
			<div class="pull">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage-1}">이전</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li
							class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'><a
							href="${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	

	<script>
		$(document).ready(function(){
			
			var actionForm = $("#actionForm");
			
			$(".paginate_button a").on("click",function(e){
				e.preventDefault();
				console.log("click" + actionForm.find("input[name='pageNum']").val());
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
				actionForm.submit();
			});
		
		});
		
		
	
	
	
	</script>
</body>
</html>
