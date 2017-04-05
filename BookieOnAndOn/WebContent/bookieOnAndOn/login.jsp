<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min-register.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" media="screen" title="no title" charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <article class="container">
        <div class="center-block" align="middle"><br>
          <h1><a href="${pageContext.request.contextPath}/bookieOnAndOn/main.jsp"><img src="${pageContext.request.contextPath}/images/logo.png"> </a></h1>
        </div>
        <br>
        <div class="center-block" style="width: 300px;padding:15px;">
          <form role="form">
            <div class="form-group">
              <label for="InputEmail">아이디</label>
              <input type="text" class="form-control" id="InputEmail" placeholder="아이디">
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호">
            </div>       
            <div class="form-group text-center">
             <h3> <button type="submit" class="btn btn-info btn-lg">로그인<i class="fa fa-check spaceLeft" ></i></button></h3>
             <a href="findIdPw.jsp">아이디/비밀번호 찾기</a><br>
             <a href="register.jsp">회원가입</a>
            </div>
          </form>
        </div>
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>