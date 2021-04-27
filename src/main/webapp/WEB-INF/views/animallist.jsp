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
	<h1>animallist</h1>
	
	<c:if test="${member_id.equals('admin')}">
		<button name="add_animal_btn" id="add_animal_btn" onclick="location.href='addAnimal'">동물 추가</button>
	</c:if>
	
	<div class="jscroll">
	
		<div class="scrollsection">
			<div class="container">
						
						
				<div class="row">
					<c:forEach var="dto" items="${animalList}">
					
						<div class="col-md-4">
						
							<div class="card mb-4 box-shadow" onclick="location.href='./animalDetail?code=${dto.code}'" style="cursor: pointer">
									
								<img src="/mymvc/img/upload/${dto.img}" width="100%" height="225px">	
									
								<div class="card-body">
									<p class="card-text">${dto.name}</p>
									<p class="blog-meta">
									
										<span class="author"> <i class="fas fa-user"></i>&nbsp;&nbsp;${dto.type}
										</span> &nbsp;&nbsp; <span class="date"> <i
											class="fas fa-calendar"></i>&nbsp;&nbsp;${DDto.date}
										</span>
		
									</p>
		
									<div class="d-flex justify-content-between align-items-center">
									
										<a href="./diary_detail?index=${dto.condition}" class="read-more-btn">read more
											<i class="fas fa-angle-right"></i>
										</a> 
										
										<small class="text-muted">
										
											<span class="like" style="color: #FF4848;">
												<i class="fas fa-heart"></i>
											</span> ${dto.datetime}
											
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
				<a href="animalList?page=<%=nextpage%>" class="nextPage">다음페이지</a>
		</div>
	
	</div>
	


</body>
</html>