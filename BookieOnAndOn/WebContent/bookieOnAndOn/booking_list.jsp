<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<title>booking_list</title>

</head>
<body class="homepage">
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
			<!-- 화면 -->
			<div class="container">
				<table id="table" class="table table-hover">
					<thead>
						<tr>
							<th><h1>내가 부킹한 북멤버: ${requestScope.receiverIdCount }명</h1></th>
							<th><h1>Booking_Count</h1></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mvo" items="${requestScope.receiverIdList.list }">
							<tr>
								<td align="center"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${mvo.receiverid }">${mvo.receiverid }</a></td>
								<td align="center">${mvo.receiveridcount }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Pagination -->
				<div class="row text-center">
					<div class="col-lg-12">
						<ul class="pagination">
							<c:set var="pb"
								value="${requestScope.receiverIdList.pagingBean }" />
							<!-- 이전 page -->
							<c:if test="${pb.previousPageGroup }">
								<li><a
									href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&pageNo=${pb.startPageOfPageGroup-1 }">&laquo;</a></li>
							</c:if>
							<!-- 현재 page -->
							<c:forEach begin="${pb.startPageOfPageGroup }"
								end="${pb.endPageOfPageGroup }" var="pageNo">
								<c:choose>
									<c:when test="${pb.nowPage!=pageNo }">
										<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&pageNo=${pageNo }&id=${requestScope.id}">${pageNo }</a></li>
									</c:when>
									<c:otherwise>
										<li class="active"><a>${pageNo }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 page -->
							<c:if test="${pb.nextPageGroup }">
								<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&pageNo=${pb.endPageOfPageGroup+1 }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<hr>

			
			<!-- /.row -->
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>