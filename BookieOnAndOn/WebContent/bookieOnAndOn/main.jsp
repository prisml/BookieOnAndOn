<%@page import="model.PagingBean"%>
<%@page import="model.VO"%>
<%@page import="model.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>메인</title>
<title>Verti by HTML5 UP</title>

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
							 info+="<a href='http://localhost:8888/BookieOnAndOn/DispatcherServlet?command=detail&bookno=";
							 info+=data.list[i*4+j].bookno;
							 info+="'><img class='img-responsive' src='http://placehold.it/260x390' alt=''>";
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
  	<!--------------- 책 리스트 -----------------> 
  	<% ListVO listVo = (ListVO)request.getAttribute("listVo");
  		 ArrayList<VO> list=listVo.getList();
  		 PagingBean pb=listVo.getPagingBean();
  	%>
  	<div id="showBookList">
   	<%for(int i=0; i<3; i++){ %>
  		<div class="row">
  		<%for(int j=0; j<4; j++){%>	
  				<%if(i*4+j+1>list.size()){
					break;} %>
			<div class="col-md-3 portfolio-item">
				<a href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=<%=((BookVO)list.get(i*4+j)).getBookno()%>">
				<img class="img-responsive" src="http://placehold.it/260x390" alt="">
				<%=((BookVO)list.get(i*4+j)).getTitle()%></a>
			</div>
		<%}%>
		</div>
	<%}%> 
  	</div><!-- showBookList -->			
	<hr>	
	<!---------------- 페이징 ------------------>
	<div class="row text-center">
			<div class="col-lg-12">
			<div class="page"><!-- 전체 리스트의 페이징 -->
			<ul class="pagination">
			<c:if test="${requestScope.listVo.pagingBean.previousPageGroup}">
							<li><a
								href="${pageContext.request.contextPath}/DispatcherServlet?command=main&pageNo=${requestScope.listVo.pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
						</c:if>
						<c:forEach var="num"
							begin="${requestScope.listVo.pagingBean.startPageOfPageGroup}"
							end="${requestScope.listVo.pagingBean.endPageOfPageGroup}">
							<c:choose>
								<c:when test="${num!=requestScope.listVo.pagingBean.nowPage }">
									<li><a id='pagelink'
										href="${pageContext.request.contextPath}/DispatcherServlet?command=main&pageNo=${num}">${num }</a></li>

								</c:when>
								<c:otherwise>
									<li class='active'><a>${num }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${requestScope.listVo.pagingBean.nextPageGroup}">
							<li><a
								href="${pageContext.request.contextPath}/DispatcherServlet?command=main&pageNo=${requestScope.listVo.pagingBean.endPageOfPageGroup+1}">&raquo;
							</a></li>
						</c:if>
			</ul></div>
			<div class="genregage"><!-- 장르 리스트의 페이징 :ajax에서 --><ul class="pagination"></ul></div>
		</div><!-- col-lg-12 -->  	
		</div><!-- row text-center -->

			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>