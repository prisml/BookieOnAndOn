<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<title>(책이름) 정보</title>
</head>
<body class="homepage">
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">
					<div id="bookImg" class="3u 12u(medium)">
						<img src="http://placehold.it/260x390">
					</div>
					<div class="9u 12u(medium)">
						<ul id="bookInfo">
							<li>책 제목</li>
							<li>저자</li>
							<li>출판사</li>
							<li>출판일</li>
							<li>출거리</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div>
			<div class="box container">
				<div class="row">댓글 작성 부분</div>
			</div>
		</div>
		<br>
		<br>
		<div>
			<div class="box container">
				<div class="row">댓글리스트 부분</div>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>