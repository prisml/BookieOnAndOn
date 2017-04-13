<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<script>
$(document).ready(function(){
	
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
	
	$("#updateBtn").click(function(){
		if($("#pwCheckResult").text() == "비밀번호가 일치합니다."){
			document.updateForm.submit();
		}
		else{
			alert("비밀번호를 확인해주세요.");
			return false;
		}
	});
	
	$("#updateResetBtn").click(function(){
		document.updateForm.reset();
		$("#pwCheckResult").html("");	
	});
	
	$("#updateCancelBtn").click(function(){
		if(confirm("수정을 취소하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/index.jsp";
		}
		else{
			return false;
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
		<form name="updateForm" action="${pageContext.request.contextPath}/DispatcherServlet" method = "post">
			<input type = "hidden" name = "command" value = "update">
			<div class="form-group">
				<label>아이디</label> 
				<input type="text" class="form-control" name="id" id = "id" value="${mvo.id }" placeholder="아이디" readonly> 
				<span id="idCheckResult"></span>
			</div>
			<div class="form-group">
				<label>새 비밀번호</label> 
				<input type="password" class="form-control" name="password" id = "password" placeholder="비밀번호" >
			</div>
			<div class="form-group">
				<label>비밀번호 확인</label> 
				<input type="password" class="form-control" name="pwConfirm" id = "pwConfirm" placeholder="비밀번호 확인"> 
				<span id="pwCheckResult"></span>
			</div>
			<div class="form-group">
				<label>이름</label> 
				<input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요" value="${mvo.name }">
			</div>
			<div class="form-group">
				<label>휴대폰 번호</label> 
				<input type="text" class="form-control" name="tel" placeholder="휴대폰 번호를 입력 해 주세요" value="${mvo.tel }" >
			</div>
		</form>
		<div class="form-group text-center" style="width: 400px; margin-left: -63px;" align="center">
				<button id = "updateBtn" class="btn btn-info btn-sm"> 
					정보수정
					<i class="fa fa-check spaceLeft"></i>
				</button>
				<button id = "updateCancelBtn" class="btn btn-danger btn-sm">
					수정취소
					<i class="fa fa-times spaceLeft"></i>
				</button>
				<button id = "updateResetBtn" class="btn btn-warning btn-sm">
					새로작성
					<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
	</div>
</article>
</body>
</html>