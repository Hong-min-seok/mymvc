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
	<h1>입양신청서</h1>
	
	<form action="adoptAction">
		<input type="hidden" name="member_id" value="${memberDTO.id}">
		<input type="hidden" name="animal_code" value="${animalDTO.code}">
		<table>
			<tr>
				<th>신청자 이름</th>
				<td>${memberDTO.name}<input type="hidden" name="member_name" value="${memberDTO.name}"></td>
			</tr>
			<tr>
				<th>신청자 전화번호</th>
				<td>${memberDTO.phone}<input type="hidden" name="member_phone" value="${memberDTO.phone}"></td>
			</tr>
			<tr>
				<th>신청자 이메일</th>
				<td>${memberDTO.email}<input type="hidden" name="member_email" value="${memberDTO.email}"></td>
			</tr>
			<tr>
				<th>종</th>
				<td>${animalDTO.type}<input type="hidden" name="animal_type" value="${animalDTO.type}"></td>
			</tr>
			<tr>
				<th>동물 이름</th>
				<td>${animalDTO.name}<input type="hidden" name="animal_name" value="${animalDTO.name}"></td>
			</tr>
			<tr>
				<th>신청 사유</th>
				<td><textarea name="adopt_content" rows="20" cols="100" required></textarea>
		</table>
		<button type="submit">제출</button>
	</form>

</body>
</html>