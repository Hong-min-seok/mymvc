<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily νμκ°μ</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/join.css">
</head>
<body>

	<div class = "header navbar-fixed-top">
		<div>
			<div class="logo" onclick="location.href='main'">πΆPETMILY</div>
		</div>
		
		<div class="nav">
			<!-- <div class="navmenue"><a href="main">HOME</a></div> -->
			<div class="navmenue"><a href="animalList?page=1">λ¬΄λ£λΆμ</a></div>
			<div class="navmenue"><a href="#">λ³΄νΈμ μκ°</a></div>
			<div class="navmenue"><a href="#">μ λ³΄λ°νλ ¨</a></div>
			<div class="navmenue"><a href="#">μ μ°¨λ°κ΄λ¦¬</a></div>
		</div>

		<div class="loginArea">

			<!-- λ‘κ·ΈμΈ μνμ λ-->
			<c:if test="${member_id == null}">
				<button class="btn loginBtn" onclick="location.href='login'">Login</button>
			</c:if>

			<c:if test="${member_id != null}">
			
				${member_id}λ μλνμΈμ 
				<button class="btn logoutBtn" onclick="location.href='logout'">Logout</button>
			
			</c:if>

		</div>
		
	</div>
	
	<div class="title">
		νμκ°μ
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<div class=joinform_container>
		<form action="joinAction">
			<div class=input_area>
				<label for="input_id">μμ΄λ</label>
				<input type="text" name="input_id" id="input_id" autofocus required/>
				
				<label for="input_pw">λΉλ°λ²νΈ</label>
				<input type="password" name="input_pw" id="input_pw" required/>
				
				<label for="input_name">μ΄λ¦</label>
				<input type="text" name="input_name" id="input_name" required/>
				
				<label for="input_phone">μ νλ²νΈ</label>
				<input type="text" name="input_phone" id="input_phone" required/>
				
				<label for="input_email">μ΄λ©μΌ</label>
				<input type="text" name="input_email" id="input_email" required/>
				
				<button type="submit" class="btn1">νμκ°μ</button>
			</div>
		</form>
	</div>
</body>
</html>