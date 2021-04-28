<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily 신청서 상세 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/applicationdetail.css">
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
	
	<table class="form" border="1">
		<tr>
			<th class="content_top">신청인 아이디</th>
			<td>${applicationDTO.member_id}</td>
			<th class="content_top">신청일</th>
			<td>${applicationDTO.regdate}</td>
		</tr>
		<tr>
			<th class="content_top">전화번호</th>
			<td>${applicationDTO.member_phone}</td>
			<th class="content_top">이메일</th>
			<td>${applicationDTO.member_email }</td>
		</tr>
		<tr>
			<th class="content_top">종류</th>
			<td>${applicationDTO.animal_type}</td>
			<th class="content_top">반려동물 이름</th>
			<td>${applicationDTO.animal_name}</td>
		</tr>
		<tr>
			<th class="content"><div >신청사유</div></th>
			<td colspan="3">${applicationDTO.content}</td>
		</tr>
	</table>
	
	<div class="bottom">
		<button class="btn1" onclick="location.href='adoptComplete?animal_code=${applicationDTO.animal_code}'">분양완료</button>
	</div>	
</body>
</html>