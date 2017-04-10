<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mypage</title>
<jsp:include page="/template/script.jsp"></jsp:include>
</head>




<body class="homepage"> 

	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
		
<!-- 여기서부터 본문입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			<div class="container">

<ul class="nav nav-tabs">
	
	<c:choose>
 		<c:when test="${!empty fvo }">
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${fvo.id}">${fvo.name }님의 page </a></li>
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&id=${fvo.id}" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&id=${fvo.id }">보고싶은책</a></li>
 		</c:when>
 		<c:otherwise>
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage" >mypage </a></li>
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList">보고싶은책</a></li>
 		</c:otherwise>   
 	</c:choose>
   			
</ul>
<br><br><br>

	<div id="mypageInfo">
 	<c:choose>
 		<c:when test="${!empty fvo }">
 		<div class="container">
  		<div class="jumbotron">
 			<h2>${fvo.name } 님의 page입니다</h2><br>
 			 <a class="btn btn-primary" href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${fvo.id}">
 			 booking
 			<span class="badge">
 			${fbookingcount}
 			</span></a>
 			</div>
 			</div>
 		</c:when>
 	<c:otherwise>
 	<div class="container">
  		<div class="jumbotron">
 			<h3>${mvo.name} 님의 page입니다</h3><br>
 			
 			<a class="btn btn-primary" href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${mvo.id}">booking
 			<span class="badge">
 			${bookingcount}
 			</span>
 			</a>
 	
 	
 	 </div>
 	</div>
 	</c:otherwise>   
 	</c:choose>
 	
 	
 	</div>
</div>
<!-- 여기까지 본문입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		
	</div>
</div>
			  
		<jsp:include page="/template/footer.jsp"></jsp:include>

</body>
</html>