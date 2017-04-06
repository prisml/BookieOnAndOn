<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="//code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<title>(책이름) 정보</title>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type:"post",
			url:"DispatcherServlet",
			data:"command=getReviewList&bookno=${vo.bookno}",
			dataType:"json",
			success:function(data){
				$("#reviewList").append("<ul>");
				for(var i=0;i<data.list.length;i++){
					$("#reviewList").append("<li>");
					$("#reviewList").append(data.list[i].id+" : ");
					$("#reviewList").append(data.list[i].rvcontent+"<br>");
					$("#reviewList").append(data.list[i].rvdate+"<br>");
					$("#reviewList").append(data.list[i].star);
					$("#reviewList").append("</li>");
				}
				$("#reviewList").append("</ul>");
			}
		});
	});
</script>
</head>
<body class="homepage">
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="main-wrapper">
			<div class="container">
				<div class="row">
					<div id="bookImg" class="3u 12u(medium)">
						<img class="img-responsive" src="http://placehold.it/260x390">
					</div>
					<div class="8u 12u(medium)">
						<ul id="bookInfo">
							<li>저자 : ${vo.author}</li>
							<li>장르 : ${vo.genre}</li>
							<li>출판사 : ${vo.pub }</li>
							<li>출판일 : ${vo.pubdate }</li>
							<li>줄거리 : ${vo.summary }</li>
						</ul>
					</div>
					<div class="1u 12(medium)">
						<ul>
							<li>봤어요</li>
							<li>보고싶어요</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<div id="banner-wrapper">
			<div class="box container">
				<div class="row"></div>
			</div>
		</div>
		<br> <br>
		<div>
			<div class="box container">
				<div class="row 200%">
					<div id="reviewList" class="12u 12u(medium) important(medium)">
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>