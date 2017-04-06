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
				data:"command=genre&pageNo=1&genre="+$(this).text(),
				success:function(data){
					 var info="";
					 for(var i=0;i<3;i++){
						 info+="<div class='row'>";
						 for(var j=0;j<4;j++){
							 info+="<div class='col-md-3 portfolio-item'>";
							 info+="<a href='#'>";
							 info+="<img class='img-responsive' src='http://placehold.it/260x390' alt=''>";
							 //info+="<img class='img-responsive' src="+data.list[i*4+j].bookcover+" alt=''>"
							 info+=data.list[i*4+j].title;
							 info+="</a></div>";
						 }
						 info+="</div>";
					 }			
					 var paging="";
					 for(var k=data.pagingBean.startPageOfPageGroup;k<=data.pagingBean.endPageOfPageGroup;k++){
						 paging+="<li><a href='#'>"+k+"</a></li>";
					 }
					 $(".pagination").html(paging);					 
					 $("#showBookList").html(info);					
				}//success
			});//ajax			
	 });// .nav-justified li click
	 $(".pagination").on("click", "li", function(){
		 event.preventDefault();
		 //alert($(".nav-justified li").text());
		 $(".pagination .active").removeClass('active');
		 $(this).addClass("active");
		 $.ajax({
			type:"get",
			url:"DispatcherServlet",
			dataType:"json",
			data:"command=genre&pageNo="+$(this).text()+"&genre="+$(".nav-justified .active").text(),
			success:function(data){
	 			var info="";
				for(var i=0;i<3;i++){
					info+="<div class='row'>";
					for(var j=0;j<4;j++){
						if(i*4+j+1>data.list.length)
							break;
						info+="<div class='col-md-3 portfolio-item'>";
						info+="<a href='#'>";
						info+="<img class='img-responsive' src='http://placehold.it/260x390' alt=''>";
						//info+="<img class='img-responsive' src="+data.list[page*12+i*4+j].bookcover+" alt=''>";
						info+=data.list[i*4+j].title;
						info+="</a></div>";
					}//j
					info+="</div>";
				}//i 
				$("#showBookList").html(info); 
			}//success
		  })//ajax
		});//on
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
  	<div id="showBookList">
  	
  	</div>			
	<hr>
	<!-- 페이징 -->
	<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
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