<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>메인</title>
<jsp:include page="/template/script.jsp"></jsp:include>

<!-- script ajax -->
<script type="text/javascript">
 $(document).ready(function(){
	 $(".nav-justified li").click(function(){
		 // 클릭한 탭 active
		 $(".active").removeClass('active');
		 $(this).addClass("active");
		 // 장르 탭 클릭 시 리스트보기 ajax
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
							 if(i*4+j+1>data.list.length)
								break;
							 info+="<div class='col-md-3 portfolio-item'>";
							 info+="<a  href='<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%>/BookieOnAndOn/DispatcherServlet?command=detail&bookno=";
							 info+=data.list[i*4+j].bookno+"'>";
							 info+="<div class='w3-one'>";
							// info+="<img class='img-responsive' src='http://placehold.it/260x390' alt=''>";
							 info+="<div class=bookcover style='height:390px'>";
							 info+="<img height='390px' width='263px' src='${pageContext.request.contextPath}/images/bookcover/"+data.list[i*4+j].bookno+".jpg' alt=''>"
							 info+= "<div class='overlay'><div class='overlaytext'>";
							 info+="<h4>"+data.list[i*4+j].title+"</h4>";
							 info+="저자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.list[i*4+j].author+"<br>출판사&nbsp;&nbsp;&nbsp;"+data.list[i*4+j].pub;
							 info+="<br>출판일&nbsp;&nbsp;&nbsp;"+data.list[i*4+j].pubdate;
							 info+="</div></div></div>";
							 info+="</div><br><div style='text-align: center'>";
							 info+=data.list[i*4+j].title;
							 info+="<br><img width='17px' src='${pageContext.request.contextPath}/images/staron.png'>&nbsp;"+data.list[i*4+j].rate.toFixed(1)+"";
							 info+="</div></a></div>";
						 }
						 info+="</div>";
					 }			
					 var paging="";
					 for(var k=data.pagingBean.startPageOfPageGroup;k<=data.pagingBean.endPageOfPageGroup;k++){
						 paging+="<li><a href='#'>"+k+"</a></li>";
					 }
					 $(".genregage .pagination").html(paging);
					 $(".page .pagination").html("");
					 $("#showBookList").html(info);					
				}//success
			});//ajax
	 });// .nav-justified li click
	/*  $("#delink").on("click", function(){
		 location.href=${pageContext.request.contextPath}""/DispatcherServlet?command=detail&bookno";
	 } ) */
	 
	 $(".genregage .pagination").on("click", "li", function(){
		 event.preventDefault();
		 // 클릭한 페이지 active
		 $(".pagination .active").removeClass('active');
		 $(this).addClass("active"); 
		 // 장르 별 페이지 클릭 시 리스트 보기 ajax
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
						 info+="<a  href='<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%>/BookieOnAndOn/DispatcherServlet?command=detail&bookno=";
						 info+=data.list[i*4+j].bookno+"'>";
						 info+="<div class='w3-one'>";
						 info+="<div class=bookcover style='height:390px'>";
						 info+="<img height='390px' width='263px' src='${pageContext.request.contextPath}/images/bookcover/"+data.list[i*4+j].bookno+".jpg' alt=''>"
						 info+= "<div class='overlay'><div class='overlaytext'>";
						 info+="<h4>"+data.list[i*4+j].title+"</h4>";
						 info+="저자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.list[i*4+j].author+"<br>출판사&nbsp;&nbsp;&nbsp;"+data.list[i*4+j].pub;
						 info+="<br>출판일&nbsp;&nbsp;&nbsp;"+data.list[i*4+j].pubdate;
						 info+="</div></div></div>";
						 info+="</div><br><div style='text-align: center'>";
						 info+=data.list[i*4+j].title;
						 info+="<br><img width='17px' src='${pageContext.request.contextPath}/images/staron.png'>&nbsp;"+data.list[i*4+j].rate.toFixed(1)+"";
						 info+="</div></a></div>";
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
			
	<!-- Section -->
	<!-------------- 장르 별 탭 --------------->
	<ul class="nav nav-tabs nav-justified" style="align:center">	
   		<li class="active"><a href="${pageContext.request.contextPath}/index.jsp">전체</a></li>
 	    <li><a href="#">인문</a></li>
 	    <li><a href="#">소설</a></li>
  	    <li><a href="#">자기계발</a></li>
	    <li><a href="#">경영/경제</a></li>
 	    <li><a href="#">IT</a></li>
   		<li><a href="#">만화</a></li>
  	</ul>
  	<div class="box">
  	<br>
  	<!--------------- 책 리스트 -----------------> 
  	<c:set var="listVo" value="${requestScope.listVo}"/>  
  	<c:set var="size" value="${fn:length(listVo.list)}"/>
  	<div id="showBookList">  	
  	<c:forEach begin="0" end="2" var="i">
  		<div class="row">
  		<c:forEach begin="0" end="3" var="j">
  		<c:choose>
  			<c:when test="${(i*4+j+1)>size}">  				
  			</c:when>
  			<c:otherwise>
			<div class="col-md-3 portfolio-item">
				<a href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${listVo.list[i*4+j].bookno}">
					<div class="w3-one">
						<img height="390px" width="260px" src="${pageContext.request.contextPath}/images/bookcover/${listVo.list[i*4+j].bookno}.jpg" 
						alt="">
							<div class='overlay'><div class='overlaytext'>
								<h4>${listVo.list[i*4+j].title}</h4>
								저자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${listVo.list[i*4+j].author}<br>
								출판사&nbsp;&nbsp;&nbsp;${listVo.list[i*4+j].pub}<br>
								출판일&nbsp;&nbsp;&nbsp;${listVo.list[i*4+j].pubdate}
							</div></div><!-- overlay -->
					</div><br>
					<div style="text-align: center">
						${listVo.list[i*4+j].title}<br>
						<img width="17px" src="${pageContext.request.contextPath}/images/staron.png">&nbsp;
				 		<fmt:formatNumber value="${listVo.list[i*4+j].rate}" pattern="0.0"/>
					 </div>
				</a>		 
			</div>
			</c:otherwise>
		</c:choose>		
		</c:forEach><!-- j -->
		</div>
	</c:forEach><!-- i -->	
  	</div><!-- showBookList -->			
	<!---------------- 페이징 ------------------>
	<div class="row text-center">
		<div class="col-lg-12">
			<div class="page"><!-- 전체 리스트의 페이징 -->
				<ul class="pagination">
					<c:if test="${listVo.pagingBean.previousPageGroup}">
						<li>
							<a href="${pageContext.request.contextPath}/DispatcherServlet?command=main&pageNo=${listVo.pagingBean.startPageOfPageGroup-1}">◀</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${listVo.pagingBean.startPageOfPageGroup}" end="${listVo.pagingBean.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${num!=listVo.pagingBean.nowPage }">
								<li>
									<a id="pagelink" href="${pageContext.request.contextPath}/DispatcherServlet?command=main&pageNo=${num}">${num}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class='active'>
									<a>${num }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${listVo.pagingBean.nextPageGroup}">
						<li>
							<a href="${pageContext.request.contextPath}/DispatcherServlet?command=main&pageNo=${listVo.pagingBean.endPageOfPageGroup+1}">▶</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="genregage"><!-- 장르 리스트의 페이징 :ajax에서 --><ul class="pagination"></ul></div>
		</div><!-- col-lg-12 -->  	
	</div><!-- row text-center -->

			</div>
		</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>