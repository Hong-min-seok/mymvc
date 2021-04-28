<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily 분양정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/animaldetail.css">
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
		상세정보
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class="content_container">
	
		<div class="top">
			<div class="img_container">
				<img src="/mymvc/img/upload/${animalDTO.img}">
			</div>
			
			<div class="info_container">
				<div>
					<b>이름</b><br>
					${animalDTO.name}
				</div>
				<div>
					<br><b>종</b><br>
					${animalDTO.type}
				</div>
				<div>
					<br><b>입소일</b><br>
					${animalDTO.datetime}
				</div>
				<div>
					<br><b>상태</b><br>
					${animalDTO.condition}
				</div>
			</div>
		</div>
		
		<div class="bottom">
			<c:if test="${member_id == null}">
				<button class="btn1 adoptBtn" onclick="location.href='login'">분양 신청</button>
			</c:if>
			<c:if test="${member_id != null}">
				<c:if test="${!member_id.equals('admin') }">
					<button class="btn1 adoptBtn" onclick="location.href='adoptForm?code=${animalDTO.code}'">분양 신청</button>
				</c:if>
				<c:if test="${member_id.equals('admin') }">
					<button class="btn1 adoptBtn" onclick="location.href='applicationsList?code=${animalDTO.code}'">신청서 확인</button>
				</c:if>
			</c:if>
		</div>
	</div>
</body>
</html>