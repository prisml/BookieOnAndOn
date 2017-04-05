<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Verti by HTML5 UP</title>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body class="homepage"> 
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
			<div class="container">
			
			<!-- Section은 여기서 작업하도록! -->
	<!-- 장르 선택 탭 -->			
	<ul class="nav nav-tabs nav-justified">	
    <li class="active"><a href="#">Home</a></li>
    <li><a href="#">Menu 1</a></li>
    <li><a href="#">Menu 2</a></li>
    <li><a href="#">Menu 3</a></li>
  	</ul> 
			</div>
		</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

 <script type="text/javascript"> 
 // 선택한 탭 active
 $(document).ready(function(){
	 $(".nav-justified li").click(function(){
		 $(".active").removeClass('active');
		 $(this).addClass("active");
	 });
 });

 </script>




	<!-- Scripts -->
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	
</body>
</html>