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
 <style>
        /* 스타일링을 위한 CSS 코드를 여기에 추가할 수 있습니다. */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>


<%@ include file="includes/header.jsp"%>
<body>


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<div class="container">



    <h1>주문현황 페이지</h1>
    <table>
        <thead>
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>고객명</th>
                <th>주문일시</th>
                <th>배송상태</th>
            </tr>
        </thead>
        <tbody>
            <!-- 여기에 실제 주문 데이터를 반복적으로 표시하는 코드가 들어갈 수 있습니다. -->
            
         	<c:forEach var="orderList" items="${orderList}">
            <tr>
                <td>${orderList.orderId}</td>
                <td>상품A</td>
                <td>홍길동</td>
                <td>2023-07-20 10:30</td>
                <td>배송중</td>
            </tr>
</c:forEach>
  
    </table>


	</div>




</body>

</html>