<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily ๋ก๊ทธ์ธ</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/login.css">
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
		๋ก๊ทธ์ธ
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>

	<div class="login_form_container">
	
		<form action="loginAction" method="post" class="login_form" id="login_form">
			<div class="input_area">
				<input type="text" id="input_id" name="input_id" placeholder="์์ด๋">
	
			    <input type="password" id="input_pw" name="input_pw" placeholder="๋น๋ฐ๋ฒํธ">
	
				<button  type="submit" id="loginbtn" class="btn1">๋ก๊ทธ์ธ</button>
			</div>
		</form>
			
		    <div class="text_area">
		       |<br>
		       ๋ก๊ทธ์ธ ํ์๋ฉด<br>
		       ๋ ๋ง์ ์๋น์ค๋ฅผ ์ด์ฉํ์ค ์ ์์ต๋๋ค.<br>
		       |
		    </div>
		    
		    <div class="login_sub">
		       <a href="join">ํ์๊ฐ์</a>
		   </div>
		
	</div>

   

	</div>

   
</body>
</html>