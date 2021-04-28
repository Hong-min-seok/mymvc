<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/join.css">
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
		회원가입
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class=joinform_container>
		<form action="joinAction">
			<div class=input_area>
				<label for="input_id">아이디</label>
				<input type="text" name="input_id" id="input_id" autofocus required/>
				
				<label for="input_pw">비밀번호</label>
				<input type="password" name="input_pw" id="input_pw" required/>
				
				<label for="input_name">이름</label>
				<input type="text" name="input_name" id="input_name" required/>
				
				<label for="input_phone">전화번호</label>
				<input type="text" name="input_phone" id="input_phone" required/>
				
				<label for="input_email">이메일</label>
				<input type="text" name="input_email" id="input_email" required/>
				
				<button type="submit" class="btn1">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>