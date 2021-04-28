<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily 동물 등록</title>
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
		동물 등록
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class="add_animal_container">
		<form action="addAnimalAction" method="post" enctype="multipart/form-data">
			<table border="1" class="form">
				<tr>
					<th class="content_head">이름</th>
					<td><input type="text" name="name" id="name" style="width:100%;"></td>
				</tr>
				<tr>
					<th class="content_head">종류</th>
					<td>
						<input type="radio" name="type" value="강아지">강아지
						<input type="radio" name="type" value="고양이">고양이
					</td>				
				</tr>
				<tr>
					<th class="content_head">입소일</th>
					<td><input type="date" name="datetime"></td>
				</tr>
				<tr>
					<th class="content_bottom">상태</th>
					<td><textarea name="condition" rows="10" cols="100"></textarea></td>
				</tr>
				<tr>
					<th class="content_head">이미지</th>
					<td><input type="file" name="img"></td>
				</tr>
			</table>
	
			<div class="bottom">
				<button type="submit" class="btn1">등록</button>
			</div>
			 		</form>
	</div>
</body>
</html>