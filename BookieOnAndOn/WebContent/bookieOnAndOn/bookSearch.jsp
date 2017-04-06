<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>도서검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="homepage">
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
			<div class="container">
				<!-- Section은 여기서 작업하도록! -->
				<table class="list">
					<caption>목록</caption>
					<thead>
						<tr>
							<th class="no">제목</th>
							<th class="title">저자</th>
							<th class="name">출판사</th>
							<th class="date">평점</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="lvo" items="${requestScope.lvo.list}">
							<tr>
								<td>${lvo.title}</td>
								<td>${lvo.author}</td>
								<td>${lvo.pub}</td>
								<td>${lvo.rate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
					<br><br>	
<p class="paging">
		<!--for each로 1, 2, 3 ,4 -->

		<c:if test="${lvo.pagingBean.previousPageGroup == true}">
			<a href="DispatcherServlet?command=bookSearch&pageNo=${lvo.pagingBean.startPageOfPageGroup-1}"><img src="" alt="이전"></a>
		</c:if>
		<c:forEach begin="${lvo.pagingBean.startPageOfPageGroup}" end="${lvo.pagingBean.endPageOfPageGroup}" var="num">
			<c:choose>
				<c:when test="${lvo.pagingBean.nowPage == num}">
						${num} &nbsp;
					</c:when>
				<c:otherwise>
					<a href="DispatcherServlet?command=bookSearch&pageNo=${num}">${num}</a> &nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${lvo.pagingBean.nextPageGroup == true}">
			 &nbsp; <a href="DispatcherServlet?command=bookSearch&pageNo=${lvo.pagingBean.endPageOfPageGroup+1}"><img src="" alt="다음"></a>
		</c:if>
	</p>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>






	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>