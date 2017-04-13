<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<script type="text/javascript">
   $(document).ready(function(){
      $("#id").keyup(function(){
         var id= $(this).val();
         if(id.length == 0){
            $("#idCheckResult").html("");
         }
         else if(id.length < 4 || id.length > 10){
            $("#idCheckResult").html("4자이상 10자이하만 가능");
         }else{
            $.ajax({
               type:"post",
               url:"${pageContext.request.contextPath}/DispatcherServlet?command=idCheck",
               data:{"id":id},
               success:function(data){
                  if(data=="ok"){
                     $("#idCheckResult").html("사용 가능한 아이디입니다");   
                  }else{
                     $("#idCheckResult").html("중복된 아이디 사용불가");   
                  }
               }//success   
            });//ajax
         }
      });//keyup
      
      var pw = $("#password");
      var pwConfirm = $("#pwConfirm");
   
      pwConfirm.keyup(function(){
      
      if(pwConfirm.val().length == 0){
         $("#pwCheckResult").html("");   
      }
      else if(pwConfirm.val() == pw.val()){
            $("#pwCheckResult").html("비밀번호가 일치합니다.");   
         }
         else{
            $("#pwCheckResult").html("비밀번호가 불일치합니다.");   
         }
      });
      
      $("#registerBtn").click(function(){
         if($("#id").val().length == 0 || $("#idCheckResult").text() == "" || $("#idCheckResult").text() == "4자이상 10자이하만 가능" || $("#idCheckResult").text() == "중복된 아이디 사용불가"){
            alert("아이디를 확인해주세요.");
         }
         
         if($("#password").val().length == 0 || $("#pwConfirm").val().length == 0 || $("#pwCheckResult").text() == "" || $("#pwCheckResult").text() == "비밀번호가 불일치합니다."){
            alert("비밀번호를 확인해주세요.");
         }
         
         if($("#name").val().length == 0){
            alert("이름을 확인해주세요.");
         }
         
         if($("#tel").val().length == 0){
            alert("휴대폰 번호를 확인해주세요.");
         }
         
          if($("#idCheckResult").text() == "사용 가능한 아이디입니다" && $("#pwCheckResult").text() == "비밀번호가 일치합니다."
                  && $("#name").val().length!=0 && $("#tel").val().length!=0){         
                  document.registerForm.submit();
            }
            else{
                document.registerForm.reset();
                  $("#idCheckResult").html("");
                  $("#pwCheckResult").html("");   
            }
   });
      
      $("#registerCancelBtn").click(function(){
         if(confirm("가입을 취소하시겠습니까?")){
            location.href="${pageContext.request.contextPath}/index.jsp";
         }
         else{
            document.registerForm.reset();
            $("#idCheckResult").html("");
            $("#pwCheckResult").html("");   
         }
      });
   });
</script>
</head>
<body>
   <article class="container">
   <div class="center-block" align="middle">
      <h1>
         <a href="${pageContext.request.contextPath}/index.jsp"> <img
            src="${pageContext.request.contextPath}/images/Logo.png">
         </a>
      </h1>
   </div>

   <div class="center-block" style="width: 300px; padding: 15px;">
      <form name="registerForm"
         action="${pageContext.request.contextPath}/DispatcherServlet">
         <input type="hidden" name="command" value="register">
         <div class="form-group">
            <label>아이디</label> <input type="text" class="form-control" name="id"
               id="id" placeholder="아이디"> <span id="idCheckResult"></span>
         </div>
         <div class="form-group">
            <label>비밀번호</label> <input type="password" class="form-control"
               name="password" id="password" placeholder="비밀번호">
         </div>
         <div class="form-group">
            <label>비밀번호 확인</label> <input type="password" class="form-control"
               name="pwConfirm" id="pwConfirm" placeholder="비밀번호 확인"> <span
               id="pwCheckResult"></span>
         </div>
         <div class="form-group">
            <label>이름</label> <input type="text" class="form-control"
               name="name" id="name" placeholder="이름">
         </div>
         <div class="form-group">
            <label>휴대폰 번호</label> <input type="text" class="form-control"
               name="tel" id="tel" placeholder="휴대폰 번호">
         </div>
      </form>
   </div>
   </article>
   <div style = "text-align: center; margin-top:-100px;">
         <button id="registerBtn" class="btn btn-info ">
            회원가입 <i class="fa fa-check spaceLeft"></i>
         </button>
         <button id="registerCancelBtn" class="btn btn-danger">
            가입취소 <i class="fa fa-times spaceLeft"></i>
         </button>
         <div style="margin-top: 10px">
            <a
               href="${pageContext.request.contextPath}/bookie/findId.jsp">아이디</a>/<a
               href="${pageContext.request.contextPath}/bookie/findPw.jsp">비밀번호
               찾기</a>
         </div>
      </div>
</body>
</html>