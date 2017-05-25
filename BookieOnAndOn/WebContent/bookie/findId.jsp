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
				url:"${pageContext.request.contextPath}/DispatcherServlet?command=findId",
				data:{"name":$("#name").val(), "tel":$("#tel").val()},
				success:function(id){
					if(id == "null"){
						alert("찾는 정보가 없습니다.");
						document.findIdForm.reset();
					}
					else{
						alert(id);
					}
				}
			});
		});
		$("#loginBtn").click(function(){
			location.href="${pageContext.request.contextPath}/bookie/login.jsp";
		});
		$("#findIdbtn").click(function(){
			
		});
	});
</script>

  <article class="container">
        <div class="center-block" align="middle"><br>
          <h1><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/Logo.png"> </a></h1>
        </div>
        <br>
        <div class="center-block" style="width: 300px;padding:15px;">
            <form name="findIdForm">
            <div class="form-group" >
              <label>이름</label>
              <input id="name" type="text" class="form-control" required="required" placeholder="이름" >
            </div>
            <div class="form-group">
              <label>전화번호</label>
              <input id="tel" type="text" class="form-control" placeholder="전화번호">
            </div>
            </form>
            <div class="form-group text-center">
             <button class="btn btn-info " id = "findIdbtn">아이디 찾기<i class="fa fa-check spaceLeft" ></i></button>            
             <button class="btn btn-warning" id = "loginBtn">로그인 하기<i class="fa fa-check spaceLeft" ></i></button>
             <div style="margin-top:10px">
             <a href="${pageContext.request.contextPath}/bookieOnAndOn/register.jsp">회원가입</a>
             </div>
            </div>
        
        </div>
      </article>
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
  
</body>
</html>