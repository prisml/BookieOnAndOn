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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#findIdbtn").click(function(){
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/DispatcherServlet?command=findId",
				data:{"name":$("#name").val(), "tel":$("#tel").val()},
				success:function(id){
					if(id == null){
						alert("찾는 정보 없어 개년아");
					}
					else{
						alert(id);
					}
				}
			});
		});
	});
</script>

  <article class="container">
        <div class="center-block" align="middle"><br>
          <h1><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/Logo.png"> </a></h1>
        </div>
        <br>
        <div class="center-block" style="width: 300px;padding:15px;">
            <div class="form-group" >
              <label>이름</label>
              <input id="name" type="text" class="form-control" required="required" placeholder="이름" >
            </div>
            <div class="form-group">
              <label>전화번호</label>
              <input id="tel" type="text" class="form-control" placeholder="전화번호">
            </div>
            <div class="form-group text-center">
             <button class="btn btn-info " id = "findIdbtn">아이디 찾기<i class="fa fa-check spaceLeft" ></i></button>            
             <br><br>
             <a href="register.jsp">회원가입</a>
            </div>
        
        </div>
      </article>
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
  
</body>
</html>