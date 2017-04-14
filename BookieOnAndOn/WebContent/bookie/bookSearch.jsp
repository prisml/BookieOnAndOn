<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>도서검색</title>
<jsp:include page="/template/script.jsp"></jsp:include>

</head>
<body class="homepage">
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
			<div class="container">

				<c:set var="lvo" value="${requestScope.lvo}" />
				<c:set var="size" value="${fn:length(lvo.list)}" />
				<div id="showBookList">
					<c:forEach begin="0" end="2" var="i">
						<div class="row">
							<c:forEach begin="0" end="3" var="j">
								<c:choose>
									<c:when test="${(i*4+j+1)>size}">
									</c:when>
									<c:otherwise>
										<div class="col-md-3 portfolio-item">
											<a
												href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${lvo.list[i*4+j].bookno}">
												<div class="w3-one">
													<img height="390px" width="260px" src="${pageContext.request.contextPath}/images/bookcover/${lvo.list[i*4+j].bookno}.jpg"
														alt="">
													<div class='overlay'>
														<div class='overlaytext'>
															<h4>${lvo.list[i*4+j].title}</h4>
															저자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															${lvo.list[i*4+j].author}<br>
															출판사&nbsp;&nbsp;&nbsp; ${lvo.list[i*4+j].pub}<br>
															출판일&nbsp;&nbsp;&nbsp; ${lvo.list[i*4+j].pubdate}
														</div>
													</div>
												</div>
												<br>
											<!-- overlay -->
											<div style="text-align: center">
												${lvo.list[i*4+j].title}<br>
												<img
												width="17px"
												src="${pageContext.request.contextPath}/images/staron.png">&nbsp;
												<fmt:formatNumber value="${lvo.list[i*4+j].rate}"
													pattern="0.0" />
													</div>
											</a>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- j -->
						</div>
					</c:forEach>
					<!-- i -->
				</div>
				<!-- showBookList -->
				
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