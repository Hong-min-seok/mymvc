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
	
	<table>
		<tr>
			<th>번호</th>
			<th>신청인</th>
			<th>동물이름</th>
			<th>신청일</th>
			<th>상세보기</th>
		</tr>
		<c:forEach var="list" items="${applicationsList}">
			<tr>
				<td>${list.code}</td>
				<td>${list.member_id}</td>
				<td>${list.animal_name}</td>
				<td>${list.regdate}</td>
				<td><a href="applicationDetail?code=${list.code}">[클릭]</a>
			</tr>
		</c:forEach>
	</table>
	
	<c:if test="${startPage == 1}">
		[이전]
	</c:if>
	<c:if test="${startPage != 1}">
		<a href="applicationList?code=${animal_code}&page=${startPage-1}">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${page == i}">
			${i}
		</c:if>
		<c:if test="${page != i}">
			<a href="applicationsList?code=${animal_code}&page=${i}">${i}</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${endPage == totalPage}">
		[다음]
	</c:if>
	<c:if test="${endPage != totalPage}">
		<a href="applicationsList?code=${animal_code}&page=${endPage+1}">[다음]</a>
	</c:if>

	

</body>
</html>