<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily 신청서 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/applicationslist.css">
</head>
<body>

	<div class = "header navbar-fixed-top">
		<div>
			<div class="logo" onclick="location.href='main'">🐶PETMILY</div>
		</div>
		
		<div class="nav">
			<!-- <div class="navmenue"><a href="main">HOME</a></div> -->
			<div class="navmenue"><a href="animalList?page=1">무료분양</a></div>
			<div class="navmenue"><a href="#">보호소 소개</a></div>
			<div class="navmenue"><a href="#">정보및훈련</a></div>
			<div class="navmenue"><a href="#">절차및관리</a></div>
		</div>

		<div class="loginArea">

			<!-- 로그인 안했을 때-->
			<c:if test="${member_id == null}">
				<button class="btn loginBtn" onclick="location.href='login'">Login</button>
			</c:if>

			<c:if test="${member_id != null}">
			
				${member_id}님 안녕하세요 
				<button class="btn logoutBtn" onclick="location.href='logout'">Logout</button>
			
			</c:if>

		</div>
		
	</div>
	
	<div class="title">
		신청 목록
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	
	<table class="table table-hover">
		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">신청인</th>
			<th scope="col">동물이름</th>
			<th scope="col">신청일</th>
			<th scope="col">상세보기</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="list" items="${applicationsList}">
			<tr>
				<td scope="row">${list.code}</td>
				<td>${list.member_id}</td>
				<td>${list.animal_name}</td>
				<td>${list.regdate}</td>
				<td><a href="applicationDetail?code=${list.code}">[클릭]</a>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<nav aria-label="paging" class="paging">
	  	<ul class="pagination">
	    	<li class="page-item">
	    			<c:if test="${startPage == 1}">
						<a class="page-link" href="#">Previous</a>
					</c:if>
					<c:if test="${startPage != 1}">
						<a class="page-link" href="applicationsList?code=${animal_code}&page=${startPage-1}">Previous</a>
					</c:if>
	    	</li>
	    	
	    	<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${page == i}">
					<li class="page-item active">
			    	  <a class="page-link" href="#">${i} <span class="sr-only">(current)</span></a>
			    	</li>
				</c:if>
				<c:if test="${page != i}">
					<li class="page-item"><a class="page-link" href="applicationsList?code=${animal_code}&page=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
	    	
	    	<li class="page-item">
		    	<c:if test="${endPage == totalPage}">
					<a class="page-link" href="#">Next</a>
				</c:if>
				<c:if test="${endPage != totalPage}">
					<a class="page-link" href="applicationsList?code=${animal_code}&page=${endPage+1}">Next</a>
				</c:if>
	    	  
	    	</li>
	  </ul>
	</nav>
	<%-- 
	<div class="paging">

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
				<a href="applicationsList?code=${animal_code}&page=${i}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage == totalPage}">
			[다음]
		</c:if>
		<c:if test="${endPage != totalPage}">
			<a href="applicationsList?code=${animal_code}&page=${endPage+1}">[다음]</a>
		</c:if>

	</div>
	 --%>

</body>
</html>