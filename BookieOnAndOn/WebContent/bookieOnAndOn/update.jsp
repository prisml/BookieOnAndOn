<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/template/script.jsp"></jsp:include>
<script type="text/javascript">

function cancel() {
	var f = confirm("수정을 취소하시겠습니까?");
	if (f)
		location.href = "${pageContext.request.contextPath}/index.jsp";
}
function reset(){
	var f=document.updateForm;
	f.reset();
}

	$(document).ready(function(){
		$("#id").css("background", "#FFF0F5");
		
		var pw = $("#password");
		var pwConfirm = $("#pwConfirm");
		pwConfirm.keyup(function(){
			if(pwConfirm.val() == pw.val()){
				$("#pwCheckResult").html("비밀번호가 일치합니다.");	
			}
			else{
				$("#pwCheckResult").html("비밀번호가 불일치합니다.");	
		}
	});
		var uf = $("#updateForm");
		uf.click(function(){
			alert("수정이 완료되었습니다.");
		});
});
</script>
</head>
<body>
 
	<article class="container">
	<div class="center-block" align="middle">
		<h1>
			<a href="${pageContext.request.contextPath}/index.jsp">
			<img src="${pageContext.request.contextPath}/images/Logo.png"> </a>
		</h1>
	</div>

	<div class="center-block" style="width: 300px; padding: 15px;">

		<form id="updateForm" name="updateForm" action="${pageContext.request.contextPath}/DispatcherServlet?command=update" name="updateForm">
			<div class="form-group">
				<label for="InputEmail">아이디</label>  
				<input type="text" class="form-control" name="id" id="id" value ="${mvo.id }" placeholder="아이디" readonly>			
				<span id="idCheckResult"></span>
			</div>
			<div class="form-group">
				<label for="InputPassword1">새 비밀번호</label> <input type="password"
					class="form-control" name="password" id="password"
					placeholder="비밀번호">			
			</div>
				<div class="form-group">
				<label for="InputPassword1">비밀번호 확인</label> <input type="password"
					class="form-control" name="pwConfirm" id="pwConfirm"
					placeholder="비밀번호 확인">				
			</div>

			<div class="form-group">
				<label for="username">이름</label> <input type="text"
					class="form-control" name="name" id="name"
					placeholder="이름을 입력해 주세요" value="${mvo.name }">
			</div>
			<div class="form-group">
				<label for="InputPassword1">휴대폰 번호</label> <input type="text"
					class="form-control" name="tel" id="tel" 
					placeholder="휴대폰 번호를 입력 해 주세요" value="${mvo.tel }">
			</div>
			<div class="form-group text-center" style="width:400px; margin-left:-63px;" align = "center">
				<button type="submit" class="btn btn-info btn-sm " id="updateForm">
					정보수정<i class="fa fa-check spaceLeft"></i>
				</button>
				<input type="hidden" name="command" value="update">				
				<button class="btn btn-danger btn-sm" type="button"  onclick = "cancel()">
					수정취소<i class="fa fa-times spaceLeft"></i>
				</button>
				<button class="btn btn-warning btn-sm" type="button"  onclick = "reset()">
					새로작성<i class="fa fa-times spaceLeft"></i>
				</button>
				<br>
				<div style = "margin-top:10px;">
					<a href="${pageContext.request.contextPath}/bookieOnAndOn/findId.jsp">아이디</a>/<a href="${pageContext.request.contextPath}/bookieOnAndOn/findPw.jsp">비밀번호 찾기</a>
				</div>　
			</div>
		</form>
	</div>
	</article>



	
</body>
</html>