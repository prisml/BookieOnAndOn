<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#findIdbtn").click(function(){
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/DispatcherServlet?command=findPw",
				data:{"id":$("#id").val(), "name":$("#name").val(), "tel":$("#tel").val()},
				success:function(pw){
					if(pw == "null"){
						alert("찾는 정보 없습니다.");
					}
					else{
						alert(pw);
					}
				}
			});
		});
		$("#loginBtn").click(function(){
			location.href="${pageContext.request.contextPath}/bookie/login.jsp";
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
                 <label>아이디</label>
              <input id="id" type="text" class="form-control" placeholder="아이디"><br>
              <label>이름</label>
              <input id="name" type="text" class="form-control" required="required" placeholder="이름" ><br>
          	
              <label>전화번호</label>
              <input id="tel" type="text" class="form-control" placeholder="전화번호">        
            </div>
            <div class="form-group text-center">
             <button class="btn btn-warning " id = "loginBtn">로그인하러 가기<i class="fa fa-check spaceLeft" ></i></button>
             <button class="btn btn-info " id = "findIdbtn">비밀번호 찾기<i class="fa fa-check spaceLeft" ></i></button>            
             <div style="margin-top:10px">
             <a href="${pageContext.request.contextPath}/bookie/register.jsp">회원가입</a>
             </div>
            </div>
        
        </div>
      </article>
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
  
</body>
</html>