<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<title>mypage</title>
<style>
 .imagecontainer {
  position: relative;
   display: block;
}

.overlay {
  dispaly: block;
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: black;
  overflow: hidden;
  width: 100%;
  height: 0;
  transition: .5s ease;
  
}

.imagecontainer:hover .overlay {
  height: 40%;
  opacity: 0.8;
}

.text {
  white-space: nowrap; 
  color: white;
  font-size: 14px;
  position: absolute;
  overflow: hidden;
  top: 10%;
  left: 7%;
  right: 7%;

}

</style>

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
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id=${fvo.id}" >${fvo.name }님의 page </a></li>
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&id=${fvo.id }" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList&id=${fvo.id }">보고싶은책</a></li>
 		</c:when>
 		<c:otherwise>
 			<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage" >mypage </a></li>
 			<li class="active"><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList" >본책 </a></li>
		    <li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=wishBookList">보고싶은책</a></li>
 		</c:otherwise>   
 	</c:choose>
</ul>
<br><br><br>


 <div id="mypageInfo">
 	<c:choose>
 		<c:when test="${!empty fvo }">
 		<c:set var="bvo" value="${requestScope.flistVO.list}"/>
 			<c:forEach begin="0" end="2" var="i">
  		<div class="row">
  		<c:forEach begin="0" end="3" var="j">
  		<c:choose>
  		<c:when test="${(i*4+j+1)>fn:length(requestScope.flistVO.list)}">  				
  			</c:when>
  			<c:otherwise>
					<div class='col-sm-3'>
					<a href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${bvo[i*4+j].bookno}">
					<div class='imagecontainer'>
						<img width='260' height="360" src='${pageContext.request.contextPath}/images/bookcover/${bvo[i*4+j].bookno}.jpg'>
						<div class="overlay">
					 <div class="text">
								<h4>${bvo[i*4+j].title }</h4>  
								 저자 : ${bvo[i*4+j].author}<br>
					 			출판사: ${bvo[i*4+j].pub }</div></div></div>
							${bvo[i*4+j].title } &nbsp;&nbsp;|&nbsp; <img width="17px" src="${pageContext.request.contextPath}/images/staron.png">&nbsp;
				 ${bvo[i*4+j].rate}</a>
						</div>
				</c:otherwise>
			</c:choose>		
		</c:forEach><!-- j -->
		</div>
	</c:forEach><!-- i -->	
			<div class='row text-center'>
   			<div class='container col-sm-12'>
   			<ul class='pagination'>
   			<c:if test="${requestScope.flistVO.pagingBean.previousPageGroup}">
			<li class='previous'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${requestScope.flistVO.pagingBean.startPageOfPageGroup-1}&id=${fvo.id}">Previous</a></li>
			</c:if>
   			<c:forEach var="num" begin="${requestScope.flistVO.pagingBean.startPageOfPageGroup}" end="${requestScope.flistVO.pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${num!=requestScope.flistVO.pagingBean.nowPage }">
				<li><a id='pagelink' href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${num}&id=${fvo.id}">${num }</a></li>
				
				</c:when>
				<c:otherwise>
					<li class='active'><a>${num }</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${requestScope.flistVO.pagingBean.nextPageGroup}">
			<li class='next'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${requestScope.flistVO.pagingBean.endPageOfPageGroup+1}&id=${fvo.id}">Next </a></li>
			</c:if>
			</ul>
			</div>
		</div>
 		</c:when>
 	<c:otherwise>
 	
 	<c:set var="bvo" value="${sessionScope.slistVO.list}"/>
 			<c:forEach begin="0" end="2" var="i">
  		<div class="row">
  		<c:forEach begin="0" end="3" var="j">
  		<c:choose>
  		<c:when test="${(i*4+j+1)>fn:length(sessionScope.slistVO.list)}">  				
  			</c:when>
  			<c:otherwise>
					<div class='col-sm-3'>
					<a href="${pageContext.request.contextPath}/DispatcherServlet?command=detail&bookno=${bvo[i*4+j].bookno}">
					<div class='imagecontainer'>
						<img width='260' height="360" src='${pageContext.request.contextPath}/images/bookcover/${bvo[i*4+j].bookno}.jpg'>
						<div class="overlay">
					 <div class="text">
							<h4>${bvo[i*4+j].title }</h4> 
					 저자 : ${bvo[i*4+j].author}<br>
					 					출판사: ${bvo[i*4+j].pub }</div></div></div>
							${bvo[i*4+j].title }(${bvo[i*4+j].rate})&nbsp;&nbsp;|&nbsp; <img width="17px" src="${pageContext.request.contextPath}/images/staron.png">&nbsp;
				 ${bvo[i*4+j].rate}</a>
						</div>
						</c:otherwise>
						</c:choose>		
		</c:forEach><!-- j -->
		</div>
	</c:forEach><!-- i -->	
			<div class='row text-center'>
   			<div class='container col-sm-12'>
   			<ul class='pagination'>
   			<c:if test="${sessionScope.slistVO.pagingBean.previousPageGroup}">
			<li class='previous'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${sessionScope.slistVO.pagingBean.startPageOfPageGroup-1}">Previous</a></li>
			</c:if>
   			<c:forEach var="num" begin="${sessionScope.slistVO.pagingBean.startPageOfPageGroup}" end="${sessionScope.slistVO.pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${num!=sessionScope.slistVO.pagingBean.nowPage }">
				<li><a id='pagelink' href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${num}">${num }</a></li>
				
				</c:when>
				<c:otherwise>
					<li class='active'><a>${num }</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${sessionScope.slistVO.pagingBean.nextPageGroup}">
			<li class='next'><a href="${pageContext.request.contextPath}/DispatcherServlet?command=sawBookList&nowPage=${sessionScope.slistVO.pagingBean.endPageOfPageGroup+1}">Next </a></li>
			</c:if>
			</ul>
			</div>
		</div>
 	
 	</c:otherwise>   
 </c:choose>
 	
 	
 	</div>		

<!-- 여기까지 본문입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

			  

			
			</div>						
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>

</body>
</html>