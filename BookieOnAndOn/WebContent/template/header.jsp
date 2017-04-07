<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function bookSearch() {
		$("#bookSearchForm").submit();
	}
</script>
<!-- Header -->
<script type="text/javascript">
	function logout() {
		var f = confirm("로그아웃 하시겠습니까?");
		if (f)
			location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=logout";
	}
</script>
<div id="header-wrapper">
	<c:choose>
		<c:when test="${sessionScope.mvo==null}">
			<header id="header" class="container">
				<!-- Logo -->
				<div id="logo">
					<a href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp"><img
						src="${pageContext.request.contextPath}/images/bookie.png"
						style="width: 250px;"></a>
				</div>
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp">welcome</a></li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/login.jsp">Login</a></li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/register.jsp">Register</a></li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/findIdPw.jsp">Find
								ID/PW</a></li>
					</ul>
				</nav>
			</header>
		</c:when>
		<c:otherwise>
			<header id="header" class="container">
				<div id="logo">
					<a href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp"><img
						src="${pageContext.request.contextPath}/images/Logo.png"
						style="width: 150px; padding: 15px;"></a>
				</div>
				<!-- Nav -->
				<nav id="nav">

					<ul>
						<li class="current"><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp">welcome</a></li>
						<li>${sessionScope.mvo.name}님<a href="javascript:logout()">Logout</a></li>
						<li><a href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage">마이페이지</a></li>

						<li><a href="${pageContext.request.contextPath}/bookieOnAndOn/update.jsp">회원정보수정</a></li>
					</ul>
				</nav>
			<div class="container">
				<div class="row">
					<div class="2u"></div>
					<div class="8u">
						<form
							action="${pageContext.request.contextPath}/DispatcherServlet"
							id="bookSearchForm">
							<div class="input-group input-group-lg">
								<input type="hidden" name="command" value="bookSearch">
								<input type="text" class="form-control" name="title"> <span
									class="input-group-addon"> <i class="fa fa-search"
									onclick="bookSearch()"></i>
								</span>
							</div>
						</form>
					</div>
					<div class="2u"></div>
				</div>
			</div>
			</header>
		</c:otherwise>
	</c:choose>
</div>