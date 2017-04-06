<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mypage</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">

$(document).ready(function(){
	$("#sawBook").click(function(){
		//alert("본책을 보여줍니다");
		 $.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/DispatcherServlet",
			dataType:"json",
			data:"command=sawBookList&id=java",
			success:function(data){
			var info="";	
			for(var i=0;i<data.list.length;i++){
				//<div class='container-fluid bg-3 text-center'> <div class='row'> </div></div>
				info+=" <div class='col-sm-3'>";
				info+="<img src='http://placehold.it/260x390'><p>";
				info+=data.list[i].title+"<br>";
				info+=data.list[i].rate;
				info+="</p></div>";
			}
			
			
	/* 		
			<p class="paging">
			<c:if test="${requestScope.listVO.pagingBean.previousPageGroup}">
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list&nowPage=${requestScope.listVO.pagingBean.startPageOfPageGroup-1}"> ◀</a>
			</c:if>
				<c:forEach var="num"
					begin="${requestScope.listVO.pagingBean.startPageOfPageGroup}"
					end="${requestScope.listVO.pagingBean.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${num!=requestScope.listVO.pagingBean.nowPage }">
							<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list&nowPage=${num}">${num }</a>
						</c:when>
						<c:otherwise>
								${num }
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
					<c:if test="${requestScope.listVO.pagingBean.nextPageGroup}">
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list&nowPage=${requestScope.listVO.pagingBean.endPageOfPageGroup+1}">  ▶</a>
			</c:if>

			</p> */
			$("#mypageInfo").html(info);
				
						}
					}); 
	});
	$("#wishBook").click(function(){
		//alert("보고싶은책을 보여줍니다");
	});
});//ready


</script>



<body class="homepage"> 
	<div id="page-wrapper">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<div id="features-wrapper">
		
<!-- 여기서부터 본문입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			<div class="container">
<ul class="nav nav-tabs">
  <li class="active"><a href="#">Home</a></li>
  <li><a href="#" id="sawBook">본책 </a></li>
  <li><a href="#" id="wishBook">보고싶은책</a></li>
</ul>
<br><br><br>

<div id="mypageInfo">
 <h3>mypage 입니다</h3>
</div>

<!-- 여기까지 본문입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

			  
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

 




	<!-- Scripts       -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>