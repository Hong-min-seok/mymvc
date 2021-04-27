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
	<div>
		<div>
			<img src="/mymvc/img/upload/${animalDTO.img}">
		</div>
		
		<div>
			<div>
				${animalDTO.name}
			</div>
			<div>
				${animalDTO.type}
			</div>
			<div>
				${animalDTO.datetime}
			</div>
		</div>
		<div>
			<c:if test="${!member_id.equals('admin') }">
				<button onclick="location.href='adoptForm?code=${animalDTO.code}'">분양 신청</button>
			</c:if>
			<c:if test="${member_id.equals('admin') }">
				<button onclick="location.href='applicationsList?code=${animalDTO.code}'">신청서 확인</button>
			</c:if>
		</div>
	</div>
</body>
</html>