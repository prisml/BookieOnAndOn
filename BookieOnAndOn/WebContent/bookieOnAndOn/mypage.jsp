<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mypage</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<style type="text/css">

.material-icons{
	color:#0000e6;
	position: relative;
	top:10px;
}

.iconInfo{
	visibility: hidden;
	background-color: gray;
    color: #fff;
    border-radius: 6px;
    font-size: 5px;
    padding: 5px;
	position: absolute;
	z-index: 1;
}
.material-icons:hover .iconInfo {
    visibility: visible;
}
.jumbotron{
position: relative;

}
#bookingIcon{
position:absolute;
font-size:24px;
color: #ffff80;
right: 50px;
}

.mySlides {display:none;}



</style>
<script src="/lib/w3.js"></script>
<script type="text/javascript">
	

	$(document).ready(function(){
		$.ajax({
			type:"get",
			url:"DispatcherServlet",
			data:"command=sawBookSlide",
			success:function(data){
				alert("갓다왓습니다");
			}
		});//ajax sawslide
		
		
		
		
		$.ajax({
			type:"get",
			url:"DispatcherServlet",
			data:"command=bookingCheck&senderid=${sessionScope.mvo.id}&receiverid=${fvo.id }",
			success:function(data){
				
				if(data=="true"){
					//덮힌 책,부킹할 수 잇다
					$("#bookingIcon").html("<span  class='fa'>&#xf02d;</span>").css("color","yellow");
				}else{
					//펼쳐진 책,부킹이 이미 되어있어서 할 수 없다
					$("#bookingIcon").html("<span  class='fa'>&#xf212;</span>").css("color","pink");
					
				}
			
		
			}
		});
		$("#bookingIcon").on("click","span",function(){
			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=addBooking&senderid=${sessionScope.mvo.id}&receiverid=${fvo.id }",
				success:function(data){
						
						if(data=="true"){
							$("#bookingIcon").empty();
							$("#bookingIcon").html("<span  class='fa'>&#xf212;</span>").css("color","pink");
						}else{
							alert("이미 부킹되어있습니다");
						}
					
				
					}
			
			});//ajax
		});//on
	});//ready


</script>

<jsp:include page="/template/script.jsp"></jsp:include>
</head>




<body class="homepage"> 

	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
		
<!-- 여기서부터 본문입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			<div class="container">

<ul class="nav nav-tabs">
	
	<c:choose>
 		<c:when test="${!empty fvo }">
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${fvo.id}">${fvo.name }님의 page </a></li>
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&id=${fvo.id}" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&id=${fvo.id }">보고싶은책</a></li>
 		</c:when>
 		<c:otherwise>
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage" >mypage </a></li>
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList">보고싶은책</a></li>
 		</c:otherwise>   
 	</c:choose>
   			
</ul>
<br><br><br>

	<div id="mypageInfo">
 <c:choose>
 	<c:when test="${!empty fvo }">
 		<div class="container">
  		<div class="jumbotron">
  		<span id="bookingIcon"></span>
 			<h4 style='color:#3377ff'>${fvo.name } 님의 page입니다</h4><br>      
 			 <a class="btn btn-primary" href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${fvo.id}">
 			 booking
 			<span class="badge">
 			${fbookingcount}
 			</span></a>
 			
 			</div>
 			</div>
 	</c:when>
 	<c:otherwise>
 		<div class="container">
  			<div class="jumbotron">
 			<h3 style='color:#3377ff'>Mypage</h3><br>
 			<a class="btn btn-primary" href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${mvo.id}">booking
 			<span class="badge">
 			${bookingcount}
 			</span>
 			</a>
 			<div class="material-icons">&#xe88f;<span class='iconInfo'>당신이 즐겨찾기한 사람의 수를 나타냅니다</span></div><br><br><br>
 			<p>내가 최근 본 책</p>
 			<div  class="container">
 			<div class="row">
 			<img class="mySlides" src="${pageContext.request.contextPath}/images/bookcover/1.jpg" width="200px">
 			<img class="mySlides" src="${pageContext.request.contextPath}/images/bookcover/10.jpg" width="200px">
 			<img class="mySlides" src="${pageContext.request.contextPath}/images/bookcover/11.jpg" width="200px">
 			<img class="mySlides" src="${pageContext.request.contextPath}/images/bookcover/12.jpg" width="200px">
 			<img class="mySlides" src="${pageContext.request.contextPath}/images/bookcover/13.jpg" width="200px">
 			</div>
 			</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none"; 
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    x[myIndex].style.display = "block"; 
    x[myIndex+1].style.display = "block"; 
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
 		 </div>
 		</div>
 	</c:otherwise>   
 	</c:choose>
 	
 	
 	</div>
</div>
<!-- 여기까지 본문입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		
	</div>
</div>
			  
		<jsp:include page="/template/footer.jsp"></jsp:include>

</body>
</html>