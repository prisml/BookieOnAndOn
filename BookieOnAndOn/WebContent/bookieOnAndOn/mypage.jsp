<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mypage</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">

.material-icons{
	color:#0000e6;
	position: relative;
	top:10px;
}

.iconInfo{
	visibility: hidden;
	background-color: gray;
    color: #fff;
    border-radius: 6px;
    font-size: 5px;
    padding: 5px;
	position: absolute;
	z-index: 1;
}
.material-icons:hover .iconInfo {
    visibility: visible;
}
.bookingIcon{
color:red;
font-size:24px;
}



</style>
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
 			<h4 style='color:#3377ff'>${fvo.name } 님의 page입니다</h4><br>      
 			 <a class="btn btn-primary" href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${fvo.id}">
 			 booking
 			<span class="badge">
 			${fbookingcount}
 			</span></a>
 			<div class="bookingIcon">&#xf02d;</div>
 			</div>
 			</div>
 	</c:when>
 	<c:otherwise>
 		<div class="container">
  			<div class="jumbotron">
 			<h3 style='color:#3377ff'>Mypage</h3><br>
 			<a class="btn btn-primary" href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${mvo.id}">booking
 			<span class="badge">
 			${bookingcount}
 			</span>
 			</a>
 			<div class="material-icons">&#xe88f;<span class='iconInfo'>당신이 즐겨찾기한 사람의 수를 나타냅니다</span></div>
 	
 	
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