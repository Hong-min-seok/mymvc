<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily ๋ถ์์ ๋ณด</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/animaldetail.css">
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
		์์ธ์ ๋ณด
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class="content_container">
	
		<div class="top">
			<div class="img_container">
				<img src="/mymvc/img/upload/${animalDTO.img}">
			</div>
			
			<div class="info_container">
				<div>
					<b>์ด๋ฆ</b><br>
					${animalDTO.name}
				</div>
				<div>
					<br><b>์ข</b><br>
					${animalDTO.type}
				</div>
				<div>
					<br><b>์์์ผ</b><br>
					${animalDTO.datetime}
				</div>
				<div>
					<br><b>์ํ</b><br>
					${animalDTO.condition}
				</div>
			</div>
		</div>
		
		<div class="bottom">
			<c:if test="${member_id == null}">
				<button class="btn1 adoptBtn" onclick="location.href='login'">๋ถ์ ์ ์ฒญ</button>
			</c:if>
			<c:if test="${member_id != null}">
				<c:if test="${!member_id.equals('admin') }">
					<button class="btn1 adoptBtn" onclick="location.href='adoptForm?code=${animalDTO.code}'">๋ถ์ ์ ์ฒญ</button>
				</c:if>
				<c:if test="${member_id.equals('admin') }">
					<button class="btn1 adoptBtn" onclick="location.href='applicationsList?code=${animalDTO.code}'">์ ์ฒญ์ ํ์ธ</button>
				</c:if>
			</c:if>
		</div>
	</div>
</body>
</html>