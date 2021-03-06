<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily ๋ถ์ ์ ์ฒญ</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/addanimal.css">
</head>
<body>
	<div class = "header navbar-fixed-top">
		<div>
			<div class="logo" onclick="location.href='main'">๐ถPETMILY</div>
		</div>
		
		<div class="nav">
			<!-- <div class="navmenue"><a href="main">HOME</a></div> -->
			<div class="navmenue"><a href="animalList?page=1">๋ฌด๋ฃ๋ถ์</a></div>
			<div class="navmenue"><a href="#">๋ณดํธ์ ์๊ฐ</a></div>
			<div class="navmenue"><a href="#">์ ๋ณด๋ฐํ๋ จ</a></div>
			<div class="navmenue"><a href="#">์ ์ฐจ๋ฐ๊ด๋ฆฌ</a></div>
		</div>

		<div class="loginArea">

			<!-- ๋ก๊ทธ์ธ ์ํ์ ๋-->
			<c:if test="${member_id == null}">
				<button class="btn loginBtn" onclick="location.href='login'">Login</button>
			</c:if>

			<c:if test="${member_id != null}">
			
				${member_id}๋ ์๋ํ์ธ์ 
				<button class="btn logoutBtn" onclick="location.href='logout'">Logout</button>
			
			</c:if>

		</div>
		
	</div>
	
	<div class="title">
		๋ถ์ ์ ์ฒญ์
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class="adopt_form_container">

		<form action="adoptAction">
			<input type="hidden" name="member_id" value="${memberDTO.id}">
			<input type="hidden" name="animal_code" value="${animalDTO.code}">
			<table border="1" class="form">
				<tr>
					<th class="content_head">์ ์ฒญ์ ์ด๋ฆ</th>
					<td>${memberDTO.name}<input type="hidden" name="member_name" value="${memberDTO.name}"></td>
				</tr>
				<tr>
					<th class="content_head">์ ์ฒญ์ ์ ํ๋ฒํธ</th>
					<td>${memberDTO.phone}<input type="hidden" name="member_phone" value="${memberDTO.phone}"></td>
				</tr>
				<tr>
					<th class="content_head">์ ์ฒญ์ ์ด๋ฉ์ผ</th>
					<td>${memberDTO.email}<input type="hidden" name="member_email" value="${memberDTO.email}"></td>
				</tr>
				<tr>
					<th class="content_head">์ข</th>
					<td>${animalDTO.type}<input type="hidden" name="animal_type" value="${animalDTO.type}"></td>
				</tr>
				<tr>
					<th class="content_head">๋๋ฌผ ์ด๋ฆ</th>
					<td>${animalDTO.name}<input type="hidden" name="animal_name" value="${animalDTO.name}"></td>
				</tr>
				<tr>
					<th class="content_bottom">์ ์ฒญ ์ฌ์ </th>
					<td><textarea name="adopt_content" rows="20" cols="100" required></textarea>
			</table>
			<div class="bottom">
				<button class="btn1" type="submit">์ ์ถ</button>
			</div>
		</form>

	</div>
</body>
</html>