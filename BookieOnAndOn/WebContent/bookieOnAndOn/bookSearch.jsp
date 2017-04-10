<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>도서검색</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

.w3-one {
	position: relative;
	display: block;
}

.w3-one:hover .overlay {
	opacity: 1;
}

.w3-one:hover img {
	opacity: 1;
}

.overlay {
	dispaly: block;
	position: absolute;
	top: 57%;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: black;
	opacity: 0;
	transition: .5s ease;
}

.overlaytext {
	font-family: 'Jeju Gothic', serif;
	color: white;
	position: absolute;
	font-size: 14px;
	top: 10%;
	left: 7%;
	right: 7%;
}

.overlaytable{
	font-family: 'Jeju Gothic', serif;
	color: white;
}

.bookImage{
	width:260px;
	height:360px;
}
</style>
<jsp:include page="/template/script.jsp"></jsp:include>

</head>
<body class="homepage">
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
			<div class="container">
				<div class="container-fluid bg-3">
					<div class="row">
						<c:forEach var="lvo" items="${requestScope.lvo.list}">
							<div class="col-sm-3">
								<div class="w3-one">
									<a
										href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${lvo.bookno}">
										<img src="${pageContext.request.contextPath}/images/bookcover/${lvo.bookno}.jpg" class = "bookImage">
									</a>
									<div class='overlay'>
										<div class='overlaytext'>
											<h4>${lvo.title}</h4>
											<table class = 'overlaytable'>
												<tr>
													<td>저자</td><td>${lvo.author}</td>
												</tr>
												<tr>
													<td>출판사</td><td>${lvo.pub}</td>
												</tr>
												<tr>
													<td>평점</td><td>${lvo.rate}</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-lg-12">
						<p class="paging">
							<!--for each로 1, 2, 3 ,4 -->
							<c:if test="${lvo.pagingBean.previousPageGroup == true}">
								<a
									href="${pageContext.request.contextPath}/DispatcherServlet?command=bookSearch&pageNo=${lvo.pagingBean.startPageOfPageGroup-1}">&laquo;</a>
							</c:if>


							<c:forEach begin="${lvo.pagingBean.startPageOfPageGroup}"
								end="${lvo.pagingBean.endPageOfPageGroup}" var="num">
								<ul class="pagination">
									<c:choose>
										<c:when test="${lvo.pagingBean.nowPage == num}">
											<li class="active"><a>${num}</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${pageContext.request.contextPath}/DispatcherServlet?command=bookSearch&pageNo=${num}&title=${requestScope.title}">${num}</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</c:forEach>

							<c:if test="${lvo.pagingBean.nextPageGroup == true}">
								<a
									href="${pageContext.request.contextPath}/DispatcherServlet?command=bookSearch&pageNo=${lvo.pagingBean.endPageOfPageGroup+1}">&raquo;</a>
							</c:if>
						</p>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>