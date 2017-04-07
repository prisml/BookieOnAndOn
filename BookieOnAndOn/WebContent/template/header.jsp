<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	
<!-- Header -->
	<script type="text/javascript">
		function logout(){
			var f=confirm("로그아웃 하시겠습니까?");
			if(f)
				location.href="${pageContext.request.contextPath}/DispatcherServlet?command=logout";
		}
	</script>
				<div id="header-wrapper">
				    <c:choose>
						<c:when test="${sessionScope.mvo==null}">					
					<header id="header" class="container">
						<!-- Logo -->
							<div id="logo">
								<a href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 150px;padding:15px;"></a>							
							</div>
						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li class="current"><a href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp">welcome</a></li>								
									<li><a href="${pageContext.request.contextPath}/bookieOnAndOn/login.jsp">Login</a></li>
									<li><a href="${pageContext.request.contextPath}/bookieOnAndOn/register.jsp">Register</a></li>
									<li><a href="${pageContext.request.contextPath}/bookieOnAndOn/findIdPw.jsp">Find ID/PW</a></li>
								</ul>
							</nav>
					</header>
					</c:when>
						<c:otherwise>
						<header id="header" class="container">
								<div id="logo">
								<a href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 150px;padding:15px;"></a>							
							</div>
						<!-- Nav -->
							<nav id="nav">
							
								<ul>
									<li class="current"><a href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp">welcome</a></li>								
									<li>${sessionScope.mvo.name}님<a href="javascript:logout()">Logout</a></li>
								</ul>
							</nav>
							</header>
						</c:otherwise>
					</c:choose>	
				</div>			
				
				<!-- Banner -->
				<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							<div class="7u 12u(medium)">
								<h2>Hi. This is Verti.</h2>
								<p>It's a free responsive site template by HTML5 UP</p>
							</div>
							<div class="5u 12u(medium)">
								<ul>
									<li><a href="#" class="button big icon fa-arrow-circle-right">Ok let's go</a></li>
									<li><a href="#" class="button alt big icon fa-question-circle">More info</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>