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
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

<style>
/* Add custom styles here */



#myCarousel img{
	width:960px;
	height:600px;

}
#myCarousel {

	width:1170;
	height:600px;

}

#search-bar {
   width: 400px;
   margin-top: 10px;
}

.recommendation {
   padding: 50px 0;
   background-color: #f5f5f5;
}


.recommendation h2 {
   margin-bottom: 30px;
   font-size: 32px;
   text-align: center;
}

.product {
   text-align: center;
   margin-bottom: 30px;
   
}
.row{
padding-top : 35px;}

.product img {
   display: block;
   margin: 0 auto 15px;
   max-width: 100%;
   height: auto;
}

.product h3 {
   margin-bottom: 5px;
   font-size: 18px;
   font-weight: 600;
}

.price {
   font-size: 16px;
   font-weight: 400;
}

#listbutton{
float:right}

.a{
text-align:center;}
</style>
</head>

<body>

   <nav class="navbar navbar-inverse">
      <div class="container-fluid">
         <div class="navbar-header">
            <a class="navbar-brand" href="/">Health 人</a>
         </div>
         
         <!-- 로그아웃 시-->
         <c:if test="${member == null}">
            <ul class="nav navbar-nav navbar-right">

               <li><a href="/member/login"><span
                     class="glyphicon glyphicon-user"></span> 로그인</a></li>
               <li><a href="member/join"><span
                     class="glyphicon glyphicon-user"></span> 회원가입</a></li>

            </ul>
         </c:if>
         
         
         
         <!-- 로그인시 -->
         <c:if test="${member != null}">
            <div class="login_success_area">
               <ul class="nav navbar-nav navbar-right">
               <!-- 관리자 계정 -->
               <c:if test="${member.adminCk == 1}">  
               <li><a href="/admin/main">관리자 페이지</a></li>
               </c:if> 
                  <li><a href=# id="gnb_logout_button"><span class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
                  <li><a href="/cart/${member.memberId}"><span class="glyphicon glyphicon-user"></span> 장바구니</a></li>
                  <li><a href=#><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
               </ul>
            </div>
         </c:if>
         
         
         <form class="navbar-form navbar-right" action="#">
            <div class="input-group">
               <input type="text" class="form-control" placeholder="검색">
               <div class="input-group-btn">
                  <button class="btn btn-default" type="submit">
                     <i class="glyphicon glyphicon-search"></i>
                  </button>
               </div>
            </div>
         </form>
      </div>
   </nav>