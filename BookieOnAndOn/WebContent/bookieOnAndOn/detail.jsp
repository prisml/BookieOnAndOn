<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<title>${vo.title }</title>
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
					var innerHtml = "";
					innerHtml += "<div class='row'><div class='3u 12u(medium)'>";
					for(var j=0;j<data.list[i].star;j++)
						innerHtml += "<img style='width:30px' src='${pageContext.request.contextPath}/images/staron.png'> ";
					for(var j=data.list[i].star;j<5;j++)
						innerHtml += "<img style='width:30px' src='${pageContext.request.contextPath}/images/staroff.png'> ";
					innerHtml += "</div><div class=''>";
					innerHtml += "<a href=${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id="+data.list[i].id+">"
					innerHtml += data.list[i].id+"</a> <br> "; // to do
					innerHtml += data.list[i].rvcontent+"<br>";
					innerHtml += data.list[i].rvdate+"<br>";
					innerHtml += "</div></div></li>";
					$("#reviewList").append(innerHtml);					
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
		$.ajax({
			type:"get",
			url:"DispatcherServlet",
			data:"command=getSaw&bookno=${vo.bookno}&id=${mvo.id}",
			success:function(data){
				$("#sawLi").html("<br><img alt='봤어요' src='${pageContext.request.contextPath}/images/star"+data+".png' style='width:50px'>");
			}
		});
		$.ajax({
			type:"get",
			url:"DispatcherServlet",
			data:"command=getWish&bookno=${vo.bookno}&id=${mvo.id}",
			success:function(data){
				$("#wishLi").html("<br><img alt='보고싶어요' src='${pageContext.request.contextPath}/images/heart"+data+".png' style='width:50px'>");
			}
		});
		$("#sawLi").click(function(){
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=saw&bookno=${vo.bookno}&id=${mvo.id}",
				success:function(data){
					$("#sawLi").html("<br><img alt='봤어요' src='${pageContext.request.contextPath}/images/star"+data+".png' style='width:50px'>");
				}
			});
		});
		$("#wishLi").click(function(){
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=wish&bookno=${vo.bookno}&id=${mvo.id}",
				success:function(data){
					$("#wishLi").html("<br><img alt='보고싶어요' src='${pageContext.request.contextPath}/images/heart"+data+".png' style='width:50px'>");
				}
			});
		});
		$("#reviewPaging").on("click","li",function() {
			event.preventDefault();
			$.ajax({
				type:"post",
				url:"DispatcherServlet",
				data:"command=getReviewList&bookno=${vo.bookno}&page="+$(this).children("a").text(),
				dataType:"json",
				success:function(data){
					$("#reviewList").html("");		
					$("#reviewList").append("<ul>");
					for(var i=0;i<data.list.length;i++){
						var innerHtml = "";
						innerHtml += "<div class='row'><div class='3u 12u(medium)'>";
						for(var j=0;j<data.list[i].star;j++)
							innerHtml += "<img style='width:30px' src='${pageContext.request.contextPath}/images/staron.png'> ";
						for(var j=data.list[i].star;j<5;j++)
							innerHtml += "<img style='width:30px' src='${pageContext.request.contextPath}/images/staroff.png'> ";
							innerHtml += "</div><div class=''>";
							innerHtml += "<a href=${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id="+data.list[i].id+">"
							innerHtml += data.list[i].id+"</a> <br> "; // to do
							innerHtml += data.list[i].rvcontent+"<br>";
						innerHtml += data.list[i].rvdate+"<br>";
						innerHtml += "</div></div></li>";
						$("#reviewList").append(innerHtml);					
					}
					$("#reviewList").append("</ul>");
					$("#reviewPaging").html("");
					var pb = data.pagingBean;
					if(pb.previousPageGroup ==true){
						$("#reviewPaging").append("<li><a style='display: none;'>"+pb.startPageOfPageGroup-1+"</a><<</li>");
					}
					for(var i=pb.startPageOfPageGroup;i<=pb.endPageOfPageGroup;i++){
						$("#reviewPaging").append("<li><a class=movePage href=#>"+i+"</a></li>");
					}
					if(pb.nextPageGroup ==true){
						$("#reviewPaging").append("<li><a style='display: none;'>"+pb.endPageOfPageGroup+1+"</a>>></li>");
					}
				}
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
		$("#reviewSubmit").click(function(){
			if($("#sawLi").html()!="<br><img alt='보고싶어요' src='${pageContext.request.contextPath}/images/hearton.png' style='width:50px'>"){
				if(confirm("본책으로 등록하시겠습니까?")){
					$.ajax({
						type:"get",
						url:"DispatcherServlet",
						data:"command=saw&bookno=${vo.bookno}&id=${mvo.id}",
						success:function(data){
							$("#sawLi").html("<br><img alt='봤어요' src='${pageContext.request.contextPath}/images/star"+data+".png' style='width:50px'>");
						}
					});
					$.ajax({
						type:"get",
						url:"DispatcherServlet",
						data:"command=reviewRegist&bookno=${vo.bookno}&content="+$("#reviewContent").val()+"&star="+$(".on").length,
						success:function(){
							location.href=document.location.href;
						}
					});
				}
			}
			else{
				$.ajax({
					type:"get",
					url:"DispatcherServlet",
					data:"command=reviewRegist&bookno=${vo.bookno}&content="+$("#reviewContent").val()+"&star="+$(".on").length,
					success:function(){
						location.href=document.location.href;
					}
				});
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
						<img width="260px" class="img-responsive" src="${pageContext.request.contextPath}/images/bookcover/${vo.bookno}.jpg">
					</div>
					<div class="8u 12u(medium)">
						<ul id="bookInfo">
							<li><h3>${vo.title}</h3></li>
							<li>저자 : ${vo.author}</li>
							<li>장르 : ${vo.genre}</li>
							<li>출판사 : ${vo.pub }</li>
							<li>출판일 : ${vo.pubdate }</li>
							<li>줄거리 : ${vo.summary }</li>
						</ul>
					</div>
					<div class="1u 12(medium)">
					<c:if test="${!empty mvo }">
						<ul>
							<li id="sawLi"></li>
							<li id="wishLi"></li>
						</ul>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<br>
		<c:if test="${!empty mvo }">
		<div id="banner-wrapper">
			<div class="box container">
				<div class="row">
					<div class="2u 12u(medium)">
						<p class="star_rating" style="padding-top:20px">
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						    <a href="#" class="on"></a>
						</p>
					</div>
					<div class="9u">
						<form class="w3-container">
							<div class="w3-row w3-section">
								<div class="w3-col m8 l9">
									<input id="reviewContent" class="w3-input w3-border" type="text"
										placeholder="리뷰 등록"> 
										<input id="reviewHidden" type="text" style="display: none;" />
								</div>
								<div class="w3-col m4 l3" id="reviewSubmit" style="width:50px;">
									<i class="fa fa-pencil fa-2x w3-text-blue"></i>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div>
			<div class="box container">
				<div class="row 200%">
					<div id="reviewList" class="10u 12u(medium) important(medium)">
					</div>
					<div class="2u 12u(medium)">
					</div>
				</div>
				<div class="row text-center">
					<div class="12u 12u(medium)">
						<ul class="pagination" id="reviewPaging">
		                </ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</c:if>
	</div>
</body>
</html>