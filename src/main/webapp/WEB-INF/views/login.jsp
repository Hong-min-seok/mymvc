<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물 보호소 메인 페이지</title>
</head>
<body>

	<div class="login_form_container">
	
		<form action="loginAction" method="post" class="login_form" id="login_form">
			<div class="input_area">
				<input type="text" id="input_id" name="input_id" placeholder="아이디">
	
			    <input type="password" id="input_pw" name="input_pw" placeholder="비밀번호">
	
				<button  type="submit" id="loginbtn" class="btn1">로그인</button>
			</div>
			
		    <div class="text_area">
		       |<br>
		       도담도담에 로그인 하시면<br>
		       더 많은 서비스를 이용하실 수 있습니다.<br>
		       |
		    </div>
		    
		    <div class="login_sub">
		       <a href="join">회원가입</a>
		   </div>
		</form>
		
	</div>

   

	</div>

   
</body>
</html>