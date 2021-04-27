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
	<table border="1">
		<tr>
			<td colspan="4">입양 신청서</td>
		</tr>
			<td>신청인 아이디</td>
			<td>${applicationDTO.member_id}</td>
			<td>신청일</td>
			<td>${applicationDTO.regdate}</td>
		<tr>
		<tr>
			<td>전화번호</td>
			<td>${applicationDTO.member_phone}</td>
			<td>이메일</td>
			<td>${applicationDTO.member_email }</td>
		</tr>
		<tr>
			<td>종류</td>
			<td>${applicationDTO.animal_type}</td>
			<td>반려동물 이름</td>
			<td>${applicationDTO.animal_name}</td>
		</tr>
		<tr>
			<td>신청사유</td>
			<td colspan="3">${applicationDTO.content}</td>
		</tr>
	</table>
	<button onclick="location.href='adoptComplete?animal_code=${applicationDTO.animal_code}'">분양완료</button>
</body>
</html>