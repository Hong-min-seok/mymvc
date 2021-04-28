<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily 분양 신청</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/addanimal.css">
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
		분양 신청서
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class="adopt_form_container">

		<form action="adoptAction">
			<input type="hidden" name="member_id" value="${memberDTO.id}">
			<input type="hidden" name="animal_code" value="${animalDTO.code}">
			<table border="1" class="form">
				<tr>
					<th class="content_head">신청자 이름</th>
					<td>${memberDTO.name}<input type="hidden" name="member_name" value="${memberDTO.name}"></td>
				</tr>
				<tr>
					<th class="content_head">신청자 전화번호</th>
					<td>${memberDTO.phone}<input type="hidden" name="member_phone" value="${memberDTO.phone}"></td>
				</tr>
				<tr>
					<th class="content_head">신청자 이메일</th>
					<td>${memberDTO.email}<input type="hidden" name="member_email" value="${memberDTO.email}"></td>
				</tr>
				<tr>
					<th class="content_head">종</th>
					<td>${animalDTO.type}<input type="hidden" name="animal_type" value="${animalDTO.type}"></td>
				</tr>
				<tr>
					<th class="content_head">동물 이름</th>
					<td>${animalDTO.name}<input type="hidden" name="animal_name" value="${animalDTO.name}"></td>
				</tr>
				<tr>
					<th class="content_bottom">신청 사유</th>
					<td><textarea name="adopt_content" rows="20" cols="100" required></textarea>
			</table>
			<div class="bottom">
				<button class="btn1" type="submit">제출</button>
			</div>
		</form>

	</div>
</body>
</html>