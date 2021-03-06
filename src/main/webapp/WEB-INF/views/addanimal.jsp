<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily ๋๋ฌผ ๋ฑ๋ก</title>
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
		๋๋ฌผ ๋ฑ๋ก
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class="add_animal_container">
		<form action="addAnimalAction" method="post" enctype="multipart/form-data">
			<table border="1" class="form">
				<tr>
					<th class="content_head">์ด๋ฆ</th>
					<td><input type="text" name="name" id="name" style="width:100%;"></td>
				</tr>
				<tr>
					<th class="content_head">์ข๋ฅ</th>
					<td>
						<input type="radio" name="type" value="๊ฐ์์ง">๊ฐ์์ง
						<input type="radio" name="type" value="๊ณ ์์ด">๊ณ ์์ด
					</td>				
				</tr>
				<tr>
					<th class="content_head">์์์ผ</th>
					<td><input type="date" name="datetime"></td>
				</tr>
				<tr>
					<th class="content_bottom">์ํ</th>
					<td><textarea name="condition" rows="10" cols="100"></textarea></td>
				</tr>
				<tr>
					<th class="content_head">์ด๋ฏธ์ง</th>
					<td><input type="file" name="img"></td>
				</tr>
			</table>
	
			<div class="bottom">
				<button type="submit" class="btn1">๋ฑ๋ก</button>
			</div>
			 		</form>
	</div>
</body>
</html>