<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<title>Login</title>
</head>
<body>
<body class="homepage">

	<article class="container">
	<div class="center-block" align="middle">
		<br>
		<h1>
			<a href="${pageContext.request.contextPath}/index.jsp"><img
				src="${pageContext.request.contextPath}/images/Logo.png"> </a>
		</h1>
	</div>
	<br>
	<div class="center-block" style="width: 250px; padding: 15px;">
		<form name="loginForm" method="post"
			action="${pageContext.request.contextPath}/DispatcherServlet">
			<input type="hidden" name="command" value="login">
			<div class="form-group">
				<label for="id">아이디</label> <input name="id" type="text"
					class="form-control" id="id" required="required" placeholder="아이디">
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label> <input name="password"
					type="password" class="form-control" id="password"
					placeholder="비밀번호">
			</div>
			<div class="form-group text-center">
				<h3>
					<button class="btn btn-info btn-lg">
						로그인<i class="fa fa-check spaceLeft"></i>
					</button>
				</h3>
				<a href="findIdPw.jsp">아이디/비밀번호 찾기</a><br> <a
					href="register.jsp">회원가입</a>
			</div>
		</form>
	</div>
	</article>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->

</body>
</html>