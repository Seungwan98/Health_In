<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="includes/header.jsp"%>

<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">

			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="${rankList1[0].img}" alt="Slide 1" class="carousel-img">
			</div>

			<div class="item">
				<img src="${rankList1[1].img}" alt="Slide 2" class="carousel-img">
			</div>

			<div class="item">
				<img src="${rankList1[2].img}" alt="Slide 3" class="carousel-img">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<div class="a">

		<div class="row">

			<c:forEach items="${rankList2}" var="list">
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="${list.img}" alt="Product">
						<div class="caption">
							<h3>${list.name}</h3>
							<p>${list.tagContent}</p>
							<p class="price">${list.price}</p>
							<p>
								<a href="/product/productDetail?pno=${list.pno}"
									class="btn btn-primary" role="button">구매하기</a> <a
									href="/cart/${member.memberId}" class="btn btn-primary"
									role="button">장바구니</a>
							</p>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>

	</div>
</div>

<section class="recommendation">
	<div class="container">
		<h2>상품 리스트</h2>
		<div>
		<a href="product/productList" id="listbutton">더보기</a>
		</div>
		<div class="row">
			<c:forEach var="list" items="${rankList3}">
				<div class="col-md-3">
					<div class="product">
						<a href="/product/productDetail?pno='${list.pno}'"> <img src="${list.img}"
							alt="Product Image"/>
							<p>${list.name}</p>
							<br>
							<p>${list.tagContent}</p>
						</a>
						<p class="price">${list.price}</p>
						<p>
							<a href="/product/productDetail?pno=${list.pno}"
								class="btn btn-primary" role="button">구매하기</a> <a
								href="/cart/${member.memberId}" class="btn btn-primary"
								role="button">장바구니</a>
						</p>
					</div>
				</div>

			</c:forEach>


		</div>
	</div>
</section>
<%@ include file="includes/footer.jsp"%>
<script>

	//gnb_area 로그아웃 버튼 작동
	$("#gnb_logout_button").click(function(){
		//alert("버튼 작동 뿌잉");
		$.ajax({
			type:"POST",
			url:"/member/logout",
			success:function(data){
				alert("로그아웃 되었습니다");
				document.location.reload();
			}
		}); 
	});
	
</script>

</body>
</html>