<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>메인</title>  
<title>Verti by HTML5 UP</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- script ajax -->
 <script type="text/javascript"> 
 // 선택한 탭 active
 $(document).ready(function(){
	 $(".nav-justified li").click(function(){
		 $(".active").removeClass('active');
		 $(this).addClass("active");
  		 $.ajax({
				type:"get",
				url:"DispatcherServlet",
				dataType:"json",
				data:"command=genre&genre="+$(this).text(),
				success:function(data){
					
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
			<div class="container">
			
			<!-- Section은 여기서 작업하도록! -->
<ul class="nav nav-tabs nav-justified">	
    <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">전체</a></li>
    <li><a href="#">인문</a></li>
    <li><a href="#">소설</a></li>
    <li><a href="#">자기계발</a></li>
    <li><a href="#">경영/경제</a></li>
    <li><a href="#">IT</a></li>
    <li><a href="#">만화</a></li>
  	</ul>
  	<br><br> 
  	<!-- 책 리스트  --> 
  	<!-- Projects Row -->
				<div class="row">
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
				</div>
				<!-- /.row -->
				<!-- Projects Row -->
				<div class="row">
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
				</div>
				<!-- /.row -->
				<!-- Projects Row -->
				<div class="row">
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
					<div class="col-md-3 portfolio-item">
						<a href="#"> <img class="img-responsive" src="http://placehold.it/260x390" alt=""></a>
					</div>
				</div>
				<!-- /.row -->
  	
  	
  	
	<hr>
	<!-- 페이징 -->
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
			</div><!-- col-lg-12 -->  	
		</div><!-- row text-center -->
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>


	
	

	
	
	<!-- Scripts -->
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>