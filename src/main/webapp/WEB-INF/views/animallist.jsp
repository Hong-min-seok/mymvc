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
	<h1>animallist</h1>
	
	<c:forEach var="dto" items="${animalList}">
		${dto.name}<br>
	</c:forEach>
	<button name="add_animal_btn" id="add_animal_btn" onclick="location.href='addAnimal'">동물 추가</button>
</body>
</html>