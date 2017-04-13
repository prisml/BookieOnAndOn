<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

				<c:choose>
					<c:when test="${!empty fvo }">
						<h3>
							<a
								href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${fvo.id}">&nbsp;&nbsp;&nbsp;&nbsp;${fvo.name }님의
								본 책</a>
						</h3>
					</c:when>
					<c:otherwise>
						<h3>
							<a
								href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage">&nbsp;&nbsp;&nbsp;&nbsp;내가
								본 책</a>
						</h3>
					</c:otherwise>
				</c:choose>
				<br>


				<div id="mypageInfo">
					<c:choose>
						<c:when test="${!empty fvo }">
							<c:choose>
								<c:when test="${!empty requestScope.flistVO.list}">
									<c:set var="bvo" value="${requestScope.flistVO.list}" />
									<c:forEach begin="0" end="2" var="i">
										<div class="row">
											<c:forEach begin="0" end="3" var="j">
												<c:choose>
													<c:when
														test="${(i*4+j+1)>fn:length(requestScope.flistVO.list)}">
													</c:when>
													<c:otherwise>
														<div class='col-sm-3'>
															<a
																href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${bvo[i*4+j].bookno}">
																<div class="w3-one">
																	<img width='260px' height="360px"
																		src='${pageContext.request.contextPath}/images/bookcover/${bvo[i*4+j].bookno}.jpg'>
																	<div class="overlay">
																		<div class="overlaytext">
																			<h4>${bvo[i*4+j].title }</h4>
																			저자 : ${bvo[i*4+j].author}<br> 출판사:
																			${bvo[i*4+j].pub }<br> 출판일: ${bvo[i*4+j].pubdate }
																		</div>
																	</div>
																</div>
																<br>

																<div style="text-align: center">
																	${bvo[i*4+j].title }<br> <img width="17px"
																		src="${pageContext.request.contextPath}/images/staron.png">&nbsp;
																	<fmt:formatNumber value="${bvo[i*4+j].rate}"
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
									<div class='row text-center'>
										<div class='container col-sm-12'>
											<ul class='pagination'>
												<c:if
													test="${requestScope.flistVO.pagingBean.previousPageGroup}">
													<li class='previous'><a
														href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${requestScope.flistVO.pagingBean.startPageOfPageGroup-1}&id=${fvo.id}">Previous</a></li>
												</c:if>
												<c:forEach var="num"
													begin="${requestScope.flistVO.pagingBean.startPageOfPageGroup}"
													end="${requestScope.flistVO.pagingBean.endPageOfPageGroup}">
													<c:choose>
														<c:when
															test="${num!=requestScope.flistVO.pagingBean.nowPage }">
															<li><a id='pagelink'
																href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${num}&id=${fvo.id}">${num }</a></li>

														</c:when>
														<c:otherwise>
															<li class='active'><a>${num }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if
													test="${requestScope.flistVO.pagingBean.nextPageGroup}">
													<li class='next'><a
														href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${requestScope.flistVO.pagingBean.endPageOfPageGroup+1}&id=${fvo.id}">Next
													</a></li>
												</c:if>
											</ul>
										</div>
									</div>
								</c:when>
								<c:otherwise> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 책 정보가 없습니다</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<!--   내가 본 책 리스트~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<c:choose>
								<c:when test="${!empty sessionScope.slistVO.list}">
									<c:set var="bvo" value="${sessionScope.slistVO.list}" />



									<c:forEach begin="0" end="2" var="i">
										<div class="row">
											<c:forEach begin="0" end="3" var="j">
												<c:choose>
													<c:when
														test="${(i*4+j+1)>fn:length(sessionScope.slistVO.list)}">
													</c:when>
													<c:otherwise>
														<div class="col-md-3 portfolio-item">
															<a href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${bvo[i*4+j].bookno}">
																<div class='w3-one'>
																	<img width='260' height="360"
																		src='${pageContext.request.contextPath}/images/bookcover/${bvo[i*4+j].bookno}.jpg'>
																	<div class="overlay">
																		<div class="overlaytext">
																			<h4>${bvo[i*4+j].title }</h4>
																			저자 : ${bvo[i*4+j].author}<br> 출판사:
																			${bvo[i*4+j].pub }<br> 출판일: ${bvo[i*4+j].pubdate }
																		</div>
																	</div>
																</div>
																<br>
																<div style="text-align: center">
																	${bvo[i*4+j].title }<br> <img width="17px"
																		src="${pageContext.request.contextPath}/images/staron.png">&nbsp;
																	<fmt:formatNumber value="${bvo[i*4+j].rate}"
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
									<div class='row text-center'>
										<div class='container col-sm-12'>
											<ul class='pagination'>
												<c:if
													test="${sessionScope.slistVO.pagingBean.previousPageGroup}">
													<li class='previous'><a
														href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${sessionScope.slistVO.pagingBean.startPageOfPageGroup-1}">Previous</a></li>
												</c:if>
												<c:forEach var="num"
													begin="${sessionScope.slistVO.pagingBean.startPageOfPageGroup}"
													end="${sessionScope.slistVO.pagingBean.endPageOfPageGroup}">
													<c:choose>
														<c:when
															test="${num!=sessionScope.slistVO.pagingBean.nowPage }">
															<li><a id='pagelink'
																href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${num}">${num }</a></li>

														</c:when>
														<c:otherwise>
															<li class='active'><a>${num }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if
													test="${sessionScope.slistVO.pagingBean.nextPageGroup}">
													<li class='next'><a
														href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${sessionScope.slistVO.pagingBean.endPageOfPageGroup+1}">Next
													</a></li>
												</c:if>
											</ul>
										</div>
									</div>

								</c:when>
								<c:otherwise>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 책 정보가 없습니다
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>


				</div>
				<!-- 전체 div -->

				<!-- 여기까지 본문입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->




			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>