<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<title>booking_list</title>
<!-- 부킹삭제 ajax -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#receiverid").click(function(){
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/DispatcherServlet",
				data:{"command":"bookingMemberDelete", "receiverid":$(this).val()},
				success:function(){
		               location.href=document.location.href;
		            }//success
			});//ajax
		});//click
	});//ready
</script>
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
							<c:choose>
								<c:when test="${requestScope.myId.name == sessionScope.mvo.name}">
									<td align="center"><h1>나의 Booking: ${requestScope.receiverIdCount }명</h1></td>
								</c:when>
								<c:otherwise>
									<td align="center"><h1>${requestScope.myId.name }님의 Booking: ${requestScope.receiverIdCount }명</h1></td>
								</c:otherwise>
							</c:choose>
							<td colspan="2"><h1>Booking_Count</h1></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mvo" items="${requestScope.receiverIdList.list }">
							<tr id="${mvo.receiverid }" class="success">
								<!-- 부킹 상대 아이디 -->
								<td align="center"><a style="text-decoration:none"
								href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${mvo.receiverid }">${mvo.receiverid }</a></td>
								<!-- 상대 아이디별 부킹 수 -->
								<td align="center">${mvo.receiveridcount }</td>
								<!-- 부킹 취소 버튼 -->
								<td align="center"><button id="receiverid" class="btn-danger btn-sm" value="${mvo.receiverid }">Cancel</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-8"></div>
						<div class="col-sm-4" align="right">
							<a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage"><button class="btn-primary btn-lg">My Page</button></a>
							<a href="${pageContext.request.contextPath}/DispatcherServlet?command=main"><button class="btn-success btn-lg">Home</button></a>
						</div>
					</div>
				</div>
				<!-- Pagination -->
				<div class="row text-center">
					<div class="col-lg-12">
						<ul class="pagination">
							<c:set var="pb" value="${requestScope.receiverIdList.pagingBean }" />
							<!-- 이전 page -->
							<c:if test="${pb.previousPageGroup }">
								<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&pageNo=${pb.startPageOfPageGroup-1 }">&laquo;</a></li>
							</c:if>
							<!-- 현재 page -->
							<c:forEach begin="${pb.startPageOfPageGroup }" end="${pb.endPageOfPageGroup }" var="pageNo">
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
</body>
</html>