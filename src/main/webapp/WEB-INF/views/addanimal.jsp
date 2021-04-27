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
		<form action="addAnimalAction" method="post" enctype="multipart/form-data">
			<div>
				<label for="name">이름</label>
				<input type="text" name="name" id="name">
			</div>
			<div>
				<label for="type">종류</label>
				<input type="radio" name="type" value="강아지">강아지
				<input type="radio" name="type" value="고양이">고양이
			</div>
			<div>
				<label for="datetime">입소일</label>
				<input type="date" name="datetime">
			</div>
			<div>
				<label for="condition">상태</label>
				<textarea name="condition" rows="50" cols="50"></textarea>
			</div>
			<div>
				<label for="img">이미지</label>
				<input type="file" name="img">
			</div>
			<button type="submit">등록</button>
			 		</form>
	</div>
</body>
</html>