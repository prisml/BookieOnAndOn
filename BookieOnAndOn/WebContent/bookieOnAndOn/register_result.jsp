<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min-register.css"
	media="screen" title="no title" charset="utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css"
	media="screen" title="no title" charset="utf-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function login() {
	location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=login";
}
	function home(){
		location.href = "${pageContext.request.contextPath}/index.jsp";
	}
</script>
</head>
<body>
<br><br><br>
<div class="center-block" align="middle">
<img src="${pageContext.request.contextPath}/images/Logo.png" align="middle">
</div>

<div class="center-block" style="width: 230px;padding:15px;">
<button type="submit" class="btn btn-info" onclick = "login()">	로그인<i class="fa fa-check spaceLeft" ></i></button>
<button type="submit" class="btn btn-info" onclick = "home()">	홈으로<i class="fa fa-check spaceLeft" ></i></button>

</div>
</body>
</html>