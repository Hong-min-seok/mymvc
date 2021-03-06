<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jscroll/2.4.1/jquery.jscroll.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/mymvc/css/common.css">
<link rel="stylesheet" href="/mymvc/css/animallist.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.jscroll').jscroll({
				autoTrigger : true,
				loadingHtml: '<img class = "next" src="/mymvc/img/loading.gif" style="width: 100px; margin-left:auto; margin-right:auto"/>',
				nextSelector : 'a.nextPage:last',
				contentSelector : '.scrollsection'
			});
		});
	</script>
	
	<div class = "header navbar-fixed-top">
		<div>
			<div class="logo" onclick="location.href='main'">๐ถPETMILY</div>
		</div>
		
		<div class="nav">
			<!-- <div class="navmenue"><a href="main">HOME</a></div> -->
			<div class="navmenue"><a href="animalList?page=1">๋ฌด๋ฃ๋ถ์</a></div>
			<div class="navmenue"><a href="#">๋ณดํธ์ ์๊ฐ</a></div>
			<div class="navmenue"><a href="#">์ ๋ณด๋ฐํ๋ จ</a></div>
			<div class="navmenue"><a href="#">์ ์ฐจ๋ฐ๊ด๋ฆฌ</a></div>
		</div>

		<div class="loginArea">

			<!-- ๋ก๊ทธ์ธ ์ํ์ ๋-->
			<c:if test="${member_id == null}">
				<button class="btn loginBtn" onclick="location.href='login'">Login</button>
			</c:if>

			<c:if test="${member_id != null}">
			
				${member_id}๋ ์๋ํ์ธ์ 
				<button class="btn logoutBtn" onclick="location.href='logout'">Logout</button>
			
			</c:if>

		</div>
		
	</div>
	
	<div class="title">
		๋ฌด๋ฃ๋ถ์
		<hr style="width:70%; margin-left:auto; margin-right:auto">
	</div>
	
	<c:if test="${member_id.equals('admin')}">
	<div style="width: 75%; margin-left:auto; margin-right:auto; margin-bottom: 3em;">
		<button class="btn2 addBtn" onclick="location.href='addAnimal'">๋๋ฌผ ์ถ๊ฐ</button>
	</div>
	</c:if>
	
	<div class="jscroll">
	
		<div class="scrollsection">
			<div class="container" style="font-family: 'nexon';">
						
						
				<div class="row">
					<c:forEach var="dto" items="${animalList}">
					
						<div class="col-md-4">
						
							<div class="card mb-4 box-shadow" onclick="location.href='./animalDetail?code=${dto.code}'" style="cursor: pointer">
									
								<img src="/mymvc/img/upload/${dto.img}" width="100%" height="225px">	
									
								<div class="card-body">
									<p class="card-text" style="font-size:13pt"><b>${dto.name}</b>&nbsp;&nbsp;|&nbsp;&nbsp;${dto.type}</p>
									<p class="blog-meta">
									
										<span class="author" style="font-size:11pt"> 
											&nbsp;&nbsp;${dto.condition}
										</span> &nbsp;&nbsp; 
		
									</p>
		
									<div class="d-flex justify-content-between align-items-center">
									
										<a href="./animalDetail?code=${dto.code}" class="read-more-btn">์์ธํ ๋ณด๊ธฐ</a> 
										
										<small class="text-muted">
											์์์ผ&nbsp;&nbsp;${dto.datetime}					
										</small>
											
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			
			
			</div>
		</div>
	
		<div class="scrollsection">
				<%int nextpage = Integer.parseInt(request.getParameter("page")) + 1; %>
				<a href="animalList?page=<%=nextpage%>" class="nextPage">๋ค์ํ์ด์ง</a>
		</div>
	
	</div>
	


</body>
</html>