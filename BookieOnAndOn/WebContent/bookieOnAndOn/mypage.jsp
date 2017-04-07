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
 			<li class="active"><a href="${pageContext.request.contextPath}/bookieOnAndOn/mypage.jsp" >${fvo.name }님의 page </a></li>
 		</c:when>
 		<c:otherwise>
 			<li class="active"><a href="${pageContext.request.contextPath}/bookieOnAndOn/mypage.jsp" >mypage </a></li>
 		</c:otherwise>   
 	</c:choose>
   			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList" >본책 </a></li>
		    <li ><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList">보고싶은책</a></li>
</ul>
<br><br><br>

<div id="mypageInfo">
 	<c:choose>
 		<c:when test="${!empty fvo }">
 			${fvo.name } 님의 page입니다<br>
 			booking : <a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList">${fbookingcount}</a>
 		</c:when>
 	<c:otherwise>
 			<h3>mypage</h3>
 			booking : <a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList">${bookingcount}</a>
 	
 	</c:otherwise>   
 	</c:choose>
 	
 	
</div>

<!-- 여기까지 본문입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

			  

			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>