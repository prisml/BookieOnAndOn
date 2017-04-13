<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<script type="text/javascript">
	function login() {
	location.href = "${pageContext.request.contextPath}/bookie/login.jsp";
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