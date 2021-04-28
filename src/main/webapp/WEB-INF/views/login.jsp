<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/login.css">
</head>
<body>

	<div class = "header navbar-fixed-top">
		<div>
			<div class="logo" onclick="location.href='main'">🐶PETMILY</div>
		</div>
		
		<div class="nav">
			<!-- <div class="navmenue"><a href="main">HOME</a></div> -->
			<div class="navmenue"><a href="animalList?page=1">무료분양</a></div>
			<div class="navmenue"><a href="#">보호소 소개</a></div>
			<div class="navmenue"><a href="#">정보및훈련</a></div>
			<div class="navmenue"><a href="#">절차및관리</a></div>
		</div>

		<div class="loginArea">

			<!-- 로그인 안했을 때-->
			<c:if test="${member_id == null}">
				<button class="btn loginBtn" onclick="location.href='login'">Login</button>
			</c:if>

			<c:if test="${member_id != null}">
			
				${member_id}님 안녕하세요 
				<button class="btn logoutBtn" onclick="location.href='logout'">Logout</button>
			
			</c:if>

		</div>
		
	</div>
	
	<div class="title">
		로그인
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>

	<div class="login_form_container">
	
		<form action="loginAction" method="post" class="login_form" id="login_form">
			<div class="input_area">
				<input type="text" id="input_id" name="input_id" placeholder="아이디">
	
			    <input type="password" id="input_pw" name="input_pw" placeholder="비밀번호">
	
				<button  type="submit" id="loginbtn" class="btn1">로그인</button>
			</div>
		</form>
			
		    <div class="text_area">
		       |<br>
		       로그인 하시면<br>
		       더 많은 서비스를 이용하실 수 있습니다.<br>
		       |
		    </div>
		    
		    <div class="login_sub">
		       <a href="join">회원가입</a>
		   </div>
		
	</div>

   

	</div>

   
</body>
</html>