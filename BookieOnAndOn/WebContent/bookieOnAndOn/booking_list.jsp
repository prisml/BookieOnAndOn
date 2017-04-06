<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>booking_list</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/4-col-portfolio.css" rel="stylesheet">
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#table td").click(function(){
			alert($(this).text());
		});
	});
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
							<th>내가 부킹한 북멤버: ${requestScope.listSize }명</th>
							<th> Booking_Count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mvo" items="${requestScope.list }">
							<tr>
								<td>${mvo.receiverid }</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<hr>

			<!-- Pagination -->
			<div class="row text-center">
				<div class="col-lg-12">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
			<!-- /.row -->
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
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>