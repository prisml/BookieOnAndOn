<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
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
				var pb = data.pagingBean;
				if(pb.previousPageGroup ==true){
					$("#reviewPaging").append("<li id=prePage><<</li>");
				}
				for(var i=pb.startPageOfPageGroup;i<=pb.endPageOfPageGroup;i++){
					$("#reviewPaging").append("<li><a class=movePage href=#>"+i+"</a></li>");
				}
				if(pb.nextPageGroup ==true){
					$("#reviewPaging").append("<li id=nextPage>>></li>");
				}
			}
		});
		$("#sawLi").click(function(){
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=saw&bookno=${vo.bookno}&id=java",
				success:function(data){
					alert(data);
				}
			});
		});
		$("#wishLi").click(function(){
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=wish&bookno=${vo.bookno}&id=java",
				success:function(data){
					alert(data);
				}
			});
		});
		$("#reviewPaging").on("click","a",function() {
			event.preventDefault();
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=detail&bookno=${vo.bookno}&page="+$(this).text()
			});
		});
		$( ".star_rating a" ).click(function() {
			event.preventDefault();
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			$(this).parent().children("a").html("<img style='width:30px' src='${pageContext.request.contextPath}/images/staroff.png'>");
			$(".on").html("<img style='width:30px' src='${pageContext.request.contextPath}/images/staron.png'>");
			return false;
		});
		$(".on").html("<img style='width:30px' src='${pageContext.request.contextPath}/images/staron.png'>");
		$(".off").html("<img style='width:30px' src='${pageContext.request.contextPath}/images/staron.png'>");
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
							<li>제목 : ${vo.title}</li>
							<li>저자 : ${vo.author}</li>
							<li>장르 : ${vo.genre}</li>
							<li>출판사 : ${vo.pub }</li>
							<li>출판일 : ${vo.pubdate }</li>
							<li>줄거리 : ${vo.summary }</li>
						</ul>
					</div>
					<div class="1u 12(medium)">
						<ul>
							<li id="sawLi">
							<br>
							<img alt="봤어요" 
							src="${pageContext.request.contextPath}/images/staroff.png"
							 style="width:50px"></li>
							<li id="wishLi">
							<br>
							<img alt="봤어요" 
							src="${pageContext.request.contextPath}/images/heartoff.png"
							 style="width:50px"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<div id="banner-wrapper">
			<div class="box container">
				<div class="row">
					<div class="2u">
						<p class="star_rating" style="padding-top:20px">
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						</p>
					</div>
					<div class="10u">
						<form
							class="w3-container w3-text-blue">
							<div class="w3-row w3-section">
								<div class="w3-rest">
									<input class="w3-input w3-border" type="text"
										placeholder="리뷰 등록"> 
										<input id="reviewHidden" type="text" style="display: none;" />
								</div>
								<div class="w3-col" style="padding-left:20px; padding-top:2px">
									<i id="reviewSummit" class="w3-xxlarge fa fa-pencil"></i>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<div>
			<div class="box container">
				<div class="row 200%">
					<div class="2u 12u(medium)">
					</div>
					<div id="reviewList" class="8u 12u(medium) important(medium)">
					</div>
					<div class="2u 12u(medium)">
					</div>
				</div>
				<div class="row text-center">
					<div class="col-lg-12">
						<ul class="pagination" id="reviewPaging">
		                </ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>