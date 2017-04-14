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

.mySlides {display:none;}
.mySlide{display:none;}

.image {
    position:relative;
   /*  float:left; /* optional */
}
.image .text {
	font-size:181%;
    position:absolute;
    top:65%; /* in conjunction with left property, decides the text position */
    left:0%;
}
.text{
	width: 100%;
}

</style>
<script type="text/javascript">

   $(document).ready(function(){
      $.ajax({
         type:"get",
         url:"DispatcherServlet",
         data:"command=bookingCheck&senderid=${sessionScope.mvo.id}&receiverid=${fvo.id }",
         success:function(data){
            
            if(data=="true"){
               //덮힌 책,부킹할 수 잇다
               $("#bookingIcon").html("<span><img style='width:50px' src='${pageContext.request.contextPath}/images/bookingoff.png'></span>");
            }else{
               //펼쳐진 책,부킹이 이미 되어있어서 할 수 없다
               $("#bookingIcon").html("<span><img style='width:50px' src='${pageContext.request.contextPath}/images/bookingon.png'></span>");
            }//if
         }//success
      });//ajax
      
      
      $("#bookingIcon").on("click","span",function(){
         $.ajax({
            type:"get",
            url:"DispatcherServlet",
            data:"command=addBooking&senderid=${sessionScope.mvo.id}&receiverid=${fvo.id }",
            success:function(data){
                  
                  if(data=="true"){
                     $("#bookingIcon").empty();
                     alert("Booking 되었습니다");
                     $("#bookingIcon").html("<span><img style='width:50px' src='${pageContext.request.contextPath}/images/bookingon.png'></span>");
                  }else{
                     alert("이미 Booking되어 있습니다\nBooking을 해제하시려면 Booking에 들어가서 취소해주세요");
                  }
               
            
               }//success
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
         <c:choose>
       	<c:when test="${!empty fvo }">
         <h3><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${fvo.id}">&nbsp;&nbsp;&nbsp;&nbsp;${fvo.name }님의 PAGE</a>
         &nbsp;&nbsp;<span id="bookingIcon"></span></h3>
         
         </c:when>         
          <c:otherwise>
          <h3><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage" >&nbsp;&nbsp;&nbsp;&nbsp;MY PAGE</a></h3>
          </c:otherwise>
          </c:choose><br>
   <div id="mypageInfo">
 	<c:choose>
 	<c:when test="${!empty fvo }">
 		<div class="container">
  		<div class="jumbotron">  		
 			<div class="col-3" align="center">
  			<div style="padding:50px" class="image">  
  			<a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${fvo.id}">
  			<img alt="" src="${pageContext.request.contextPath}/images/bookingcount.png"></a>
  			<div align="center" class="text">  			
 			${fbookingcount}
  			</div></div> 
  			<div style="padding:50px" class="image">  
  			<a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&id=${fvo.id}">
  			<img alt="" src="${pageContext.request.contextPath}/images/sawcount.png"></a>
  			<div align="center" class="text">  			
 			${requestScope.SawTotal}
  			</div></div>
  			<div style="padding:50px" class="image">  
			<a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&id=${fvo.id}">
			<img alt="" src="${pageContext.request.contextPath}/images/wishcount.png"></a>
  			<div align="center" class="text">  			
 			${requestScope.WishTotal}
  			</div></div>
  			</div>
 			<!-- 슬라이드 -->
 			<br><br><br>
 			<c:if test="${!empty requestScope.fsawSlide }">
 			<p>${fvo.name}님의  본 책</p>		
 			<div class="container">
 				<div class="row">
 			<c:forEach items="${fsawSlide }" var="fsawSlide">
 			<img class="mySlide" src="${pageContext.request.contextPath}/images/bookcover/${fsawSlide.bookno }.jpg" style="width: 200px;">
 			</c:forEach>
 				</div>
 			</div>
 			</c:if>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlide");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
     if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";
     if (myIndex+1 > x.length) {myIndex = 1} 
    x[myIndex].style.display = "block";
     if (myIndex+2 > x.length) {myIndex = 1} 
    x[myIndex+1].style.display = "block";
     if (myIndex+3 > x.length) {myIndex = 1} 
    x[myIndex+2].style.display = "block";
     if (myIndex+4 > x.length) {myIndex = 1} 
    x[myIndex+3].style.display = "block";
   
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
 			
 			</div><!-- jumbo -->
 			</div><!--container -->
 	</c:when>
 	
 	<c:otherwise>
 		<div class="container">
  			<div class="jumbotron">
  			<br><br>
  			<div class="col-3" align="center">
  			<div style="padding:50px" class="image">  
  			<a href="${pageContext.request.contextPath}/DispatcherServlet?command=bookingList&id=${mvo.id}">
  			<img alt="" src="${pageContext.request.contextPath}/images/bookingcount.png"></a>
  			<div align="center" class="text">  			
 			${sessionScope.bookingcount}
  			</div></div> 
  			<div style="padding:50px" class="image">  
  			<a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList">
  			<img alt="" src="${pageContext.request.contextPath}/images/sawcount.png"></a>
  			<div align="center" class="text">  			
 			${sessionScope.SawTotalContent}
  			</div></div>
  			<div style="padding:50px" class="image">  
			<a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList">
			<img alt="" src="${pageContext.request.contextPath}/images/wishcount.png"></a>
  			<div align="center" class="text">  			
 			${sessionScope.WishTotalContent}
  			</div></div>
  			</div>
 			
 			<!-- 슬라이드 -->
 			<br><br><br><br>
 			<c:if test="${!empty sessionScope.sawSlide }">
 			<p>내가 본 책</p>
 			<div class="container">
 				<div class="row">
 				<c:forEach items="${sessionScope.sawSlide }" var="sawSlide">
 					<img class="mySlides" src="${pageContext.request.contextPath}/images/bookcover/${sawSlide.bookno }.jpg" style="width: 200px;">
 				</c:forEach>
 				</div>
 			</div>
 			</c:if>

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
     if (myIndex+1 > x.length) {myIndex = 1} 
    x[myIndex].style.display = "block";
     if (myIndex+2 > x.length) {myIndex = 1} 
    x[myIndex+1].style.display = "block";
     if (myIndex+3 > x.length) {myIndex = 1} 
    x[myIndex+2].style.display = "block";
     if (myIndex+4 > x.length) {myIndex = 1}
    x[myIndex+3].style.display = "block";
   
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