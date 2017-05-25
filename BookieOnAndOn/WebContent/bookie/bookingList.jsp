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
		$("button").click(function(){
			var id = $(this).val();
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/DispatcherServlet",
				data:{"command":"bookingMemberDelete", "receiverid":id},
				success:function(){
		               location.href=document.location.href;
		            }//success
			});//ajax
		});//click
		$("#toTop").bind("click", function() {
			$("body").animate({scrollTop : 0}, 200);
			});
		$(window).scroll(function() {
			if ($(this).scrollTop() != 0) {
				$('#toTop').fadeIn();
				} else {
					$('#toTop').fadeOut();
					}
			});
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
									<td colspan="2"><h1>Booking_Count</h1></td>
								</c:when>
								<c:otherwise>
									<td align="center"><h1>${requestScope.myId.name }님의 Booking: ${requestScope.receiverIdCount }명</h1></td>
									<td align="center"><h1>Booking_Count</h1></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mvo" items="${requestScope.receiverIdList.list }">
							<tr id="${mvo.receiverid }">
								<!-- 부킹 상대 아이디 -->
								<td align="center"><a style="text-decoration:none"
								href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${mvo.receiverid }">
								${mvo.receiverid }</a></td>
								<!-- 상대 아이디별 부킹 수 -->
								<td align="center">${mvo.receiveridcount }</td>
								<!-- 부킹 취소 버튼 -->
								<c:if test="${requestScope.myId.name == sessionScope.mvo.name}">
								<td align="center"><button class="btn-danger btn-sm" value="${mvo.receiverid }">Cancel</button></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- Top 버튼 -->
				<div id="toTop" align="right" ><i class="fa fa-angle-double-up fa-3x"></i></div>
				
				<!-- Pagination -->
				<div class="row text-center">
					<div class="col-lg-12">
						<ul class="pagination">
							<c:set var="pb" value="${requestScope.receiverIdList.pagingBean }" />
							<!-- 이전 page -->
							<c:if test="${pb.previousPageGroup }">
								<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&pageNo=${pb.startPageOfPageGroup-1 }&id=${requestScope.id}">◀</a></li>
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
								<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&pageNo=${pb.endPageOfPageGroup+1 }&id=${requestScope.id}">▶</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

			
			<!-- /.row -->
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>