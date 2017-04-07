<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mypage</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>




<body class="homepage"> 

	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
		
<!-- 여기서부터 본문입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			<div class="container">
		
<ul class="nav nav-tabs">
  <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage" >mypage </a></li>
  <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList" >본책 </a></li>
  <li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList">보고싶은책</a></li>
</ul>
<br><br><br>
<div id="mypageInfo">
	<c:forEach var="bvo" items="${requestScope.listVO.list}">
					<div class='col-sm-3'>
						<img src='http://placehold.it/260x390'>
							${bvo.title }<br>
							${bvo.rate }<br>
						</div>
   	</c:forEach>
<div class='row text-center'>
   	<div class='container col-sm-12'>
   	<ul class='pagination'>
   	<c:if test="${requestScope.listVO.pagingBean.previousPageGroup}">
<li class='previous'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&nowPage=${requestScope.listVO.pagingBean.startPageOfPageGroup-1}">Previous</a></li>
	</c:if>
   	<c:forEach var="num" begin="${requestScope.listVO.pagingBean.startPageOfPageGroup}" end="${requestScope.listVO.pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${num!=requestScope.listVO.pagingBean.nowPage }">
				<li><a id='pagelink' href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&nowPage=${num}">${num }</a></li>
				
				</c:when>
				<c:otherwise>
					<li class='active'><a>${num }</a></li>
				</c:otherwise>
			</c:choose>
	</c:forEach>
	<c:if test="${requestScope.listVO.pagingBean.nextPageGroup}">
<li class='next'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&nowPage=${requestScope.listVO.pagingBean.endPageOfPageGroup+1}">Next </a></li>
	</c:if>
			</ul>
		</div>
	</div>
</div>

  
  										
</div>						

<!-- 여기까지 본문입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

			  

			
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>







	<!-- Scripts       -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>

	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>