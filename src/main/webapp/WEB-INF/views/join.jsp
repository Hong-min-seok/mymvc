<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class=joinform_container>
	<form action="joinAction">
		<label for="input_id">아이디</label>
		<input type="text" name="input_id" id="input_id" autofocus required/>
		
		<label for="input_pw">비밀번호</label>
		<input type="password" name="input_pw" id="input_pw" required/>
		
		<label for="input_name">이름</label>
		<input type="text" name="input_name" id="input_name" required/>
		
		<label for="input_phone">전화번호</label>
		<input type="text" name="input_phone" id="input_phone" required/>
		
		<label for="input_email">이메일</label>
		<input type="text" name="input_email" id="input_email" required/>
		
		<button type="submit">회원가입</button>
	</form>
	</div>
</body>
</html>