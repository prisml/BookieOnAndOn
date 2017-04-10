<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/template/script.jsp"></jsp:include>
<script>
	function logout() {
		var f = confirm("로그아웃 하시겠습니까?"); 
		if (f)
			location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=logout";
	}

	function bookSearch() {
		if ($("#tags").val() == 0) {
			return;
		} else {
			$("#bookSearchForm").submit();
		}
	}

	$(function() {
		$("#tags")
				.autocomplete(
						{
							source : function(request, response) {
								$
										.ajax({
											type : "get",
											url : "${pageContext.request.contextPath}/DispatcherServlet?command=bookAutoComplete",
											dataType : "json",
											data : {
												"title" : request.term
											},
											success : function(data) {
												var bookAutoCompleteList = [];
												var temp = JSON.parse(JSON
														.stringify(data));

												for (var i = 0; i < temp.length; i++) {
													bookAutoCompleteList
															.push(temp[i].title);
												}

												return response(bookAutoCompleteList);
											}
										});
							}
						});
	});
</script>

<c:choose>
	<c:when test="${sessionScope.mvo==null}">
		<!-- Header -->
		<div id="header-wrapper">
			<header id="header" class="container">
				<!-- Logo -->
				<a href="${pageContext.request.contextPath}/index.jsp">
					<img src="${pageContext.request.contextPath}/images/Logo.png"
					style="width: 250px;">
				</a>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a
							href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
							<li>|</li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/login.jsp">Login</a></li>
							<li>|</li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/register.jsp">Register</a></li>
							<li>|</li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/findId.jsp">Find	ID</a></li>
							<li>/</li>
						<li><a 
							href="${pageContext.request.contextPath}/bookieOnAndOn/findPw.jsp">PW</a></li>
							<li>|</li>
					</ul>
				</nav>

				<div class="container">
					<div class="row">
						<div class="2u"></div>
						<div class="8u">
							<form
								action="${pageContext.request.contextPath}/DispatcherServlet"
								id="bookSearchForm">
								<div class="ui-widget">
									<div class="input-group input-group-lg">
										<input type="hidden" name="command" value="bookSearch">
										<input id="tags" type="text" class="form-control" name="title">
										<span class="input-group-addon"> <i
											class="fa fa-search" onclick="bookSearch()"></i>
										</span>
									</div>
								</div>
							</form>
						</div>
						<div class="2u"></div>
					</div>
				</div>
			</header>
		</div>
	</c:when>
	<c:otherwise>
			<!-- Header -->
		<div id="header-wrapper">
		<header id="header" class="container">
			<div id="logo">
				<a href="${pageContext.request.contextPath}/index.jsp"><img
					src="${pageContext.request.contextPath}/images/Logo.png"
					style="width: 220px;"></a>
			</div>
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a
						href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
					<li>${sessionScope.mvo.name}님<a href="javascript:logout()">Logout</a></li>
					<li><a
						href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage">마이페이지</a></li>
					<li><a
						href="${pageContext.request.contextPath}/bookieOnAndOn/update.jsp">회원정보수정</a></li>
				</ul>
			</nav>

			<div class="container">
				<div class="row">
					<div class="2u"></div>
					<div class="8u">
						<form
							action="${pageContext.request.contextPath}/DispatcherServlet"
							id="bookSearchForm">
							<div class="ui-widget">
								<div class="input-group input-group-lg">
									<input type="hidden" name="command" value="bookSearch">
									<input id="tags" type="text" class="form-control" name="title">
									<span class="input-group-addon"> <i class="fa fa-search"
										onclick="bookSearch()"></i>
									</span>
								</div>
							</div>
						</form>
					</div>
					<div class="2u"></div>
				</div>
			</div>
		</header>
		</div>
	</c:otherwise>
</c:choose>
