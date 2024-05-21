<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>로그인 페이지</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		/* Add custom styles here */
		.login-container {
			margin-top: 50px;
		}
		.form-group {
			margin-bottom: 20px;
		}
		.form-control {
			border-radius: 0;
		}
		.btn{
			border-radius: 0;
		}
		.error-message {
			color: red;
			margin-top: 10px;
		}
	</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/main"><span>Health 人</span></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="/"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
				<li><a href="/member/join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
			</ul>
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

	<div class="container">
	<form id="login_form" method="post">
		<div class="row">
			<div class="col-md-4 col-md-offset-4 login-container">
				<h2>로그인</h2>
	
					<div class="form-group">
						<label for="username">아이디</label>
						<input type="text" class="form-control" id="username" name="memberId" placeholder="아이디를 입력하세요">
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label>
						<input type="password" class="form-control" id="password" name="memberPw" placeholder="비밀번호를 입력하세요">
					</div>
					<button type="submit" class="btn btn-primary btn-block">로그인</button>
		
				
				<c:if test="${result == 0}">
			<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
			</c:if>
			</div>
			</div>
			</form>
			</div>
			

		


	<script>
	/* 로그인 버튼 클릭 메서드 */
	$(".btn.btn-primary.btn-block").click(function(){
		/* 로그인 메서드 서버 요청 */
		$("#login_form").attr("action","/member/login");
		$("#login_form").submit();
	});
</script>

</body>
</html>