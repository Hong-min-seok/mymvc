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
	<div class="add_animal_container">
		<form action="addAnimalAction" method="post">
			<div>
				<label for="name">이름</label>
				<input type="text" name="name" id="name">
			</div>
			<div>
				<label for="type">종류</label>
				<input type="radio" name="type" values="강아지">강아지
				<input type="radio" name="type" values="고양이">고양이
			</div>
			<div>
				<label for="datetime">입소일</label>
				<input type="date" name="datetime">
			</div>
			<div>
				<label for="img">이미지</label>
			</div>
			 		</form>
	</div>
</body>
</html>