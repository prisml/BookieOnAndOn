<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<title>mypage</title>

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
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${fvo.id}" >${fvo.name }님의 page </a></li>
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&id=${fvo.id }" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&id=${fvo.id }">보고싶은책</a></li>
 		</c:when>
 		<c:otherwise>
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage" >mypage </a></li>
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList">보고싶은책</a></li>
 		</c:otherwise>   
 	</c:choose>
</ul>
<br><br><br>


 <div id="mypageInfo">
 	<c:choose>
 		<c:when test="${!empty fvo }">
 			<c:forEach var="bvo" items="${requestScope.flistVO.list}">
					<div class='col-sm-3'>
					<a href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${bvo.bookno}">
						<img src='http://placehold.it/260x390'></a>
							${bvo.title }<br>
							${bvo.rate }<br>
						</div>
   			</c:forEach>
			<div class='row text-center'>
   			<div class='container col-sm-12'>
   			<ul class='pagination'>
   			<c:if test="${requestScope.flistVO.pagingBean.previousPageGroup}">
			<li class='previous'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${requestScope.flistVO.pagingBean.startPageOfPageGroup-1}&id=${fvo.id}">Previous</a></li>
			</c:if>
   			<c:forEach var="num" begin="${requestScope.flistVO.pagingBean.startPageOfPageGroup}" end="${requestScope.flistVO.pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${num!=requestScope.flistVO.pagingBean.nowPage }">
				<li><a id='pagelink' href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${num}&id=${fvo.id}">${num }</a></li>
				
				</c:when>
				<c:otherwise>
					<li class='active'><a>${num }</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${requestScope.flistVO.pagingBean.nextPageGroup}">
			<li class='next'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${requestScope.flistVO.pagingBean.endPageOfPageGroup+1}&id=${fvo.id}">Next </a></li>
			</c:if>
			</ul>
			</div>
		</div>
 		</c:when>
 	<c:otherwise>
 			<c:forEach var="bvo" items="${sessionScope.slistVO.list}">
					<div class='col-sm-3'>
					<a href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${bvo.bookno}">
						<img src='http://placehold.it/260x390'></a>
							${bvo.title }<br>
							${bvo.rate }<br>
						</div>
   			</c:forEach>
			<div class='row text-center'>
   			<div class='container col-sm-12'>
   			<ul class='pagination'>
   			<c:if test="${sessionScope.slistVO.pagingBean.previousPageGroup}">
			<li class='previous'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${sessionScope.slistVO.pagingBean.startPageOfPageGroup-1}">Previous</a></li>
			</c:if>
   			<c:forEach var="num" begin="${sessionScope.slistVO.pagingBean.startPageOfPageGroup}" end="${sessionScope.slistVO.pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${num!=sessionScope.slistVO.pagingBean.nowPage }">
				<li><a id='pagelink' href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${num}">${num }</a></li>
				
				</c:when>
				<c:otherwise>
					<li class='active'><a>${num }</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${sessionScope.slistVO.pagingBean.nextPageGroup}">
			<li class='next'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${sessionScope.slistVO.pagingBean.endPageOfPageGroup+1}">Next </a></li>
			</c:if>
			</ul>
			</div>
		</div>
 	
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