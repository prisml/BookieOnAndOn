<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#nav{
   font-size: 17px;
}

.tab{
	font-size: 18px;
}

#tags {
	height: 60px;
}

#tagsSpan {
	height: 60px;
}

#tagsI {
	width: 40px;
}
</style>
<script>
	document.onkeyup = Esc;
	function Esc() {
		var KeyID = event.keyCode;
		if (KeyID == 27) {
			$("#backgroundMusic").attr("volume", -3400);
		}
	}
	function logout() {
		var f = confirm("로그아웃 하시겠습니까?");
		if (f)
			location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=logout";
	}

	$(document).ready(function() {
		$("#tagsI").mouseover(function() {
			$("#tagsSpan").css("background", "white");
		});

		$("#tagsI").mouseout(function() {
			$("#tagsSpan").css("background", "");
		});

	});

	function bookSearch() {
		if ($("#tags").val() == 0) {
			return;
		} else {
			$("#bookSearchForm").submit();
		}
	}

	
	$(function() {
		$("#tags")
				.autocomplete(
						{
							source : function(request, response) {
								$
										.ajax({
											type : "get",
											url : "${pageContext.request.contextPath}/DispatcherServlet?command=bookAutoComplete",
											dataType : "json",
											data : {
												"title" : request.term
											},
											success : function(data) {
												var bookAutoCompleteList = [];
												var temp = JSON.parse(JSON
														.stringify(data));

												for (var i = 0; i < temp.length; i++) {
													bookAutoCompleteList
															.push(temp[i].title);
												}

												return response(bookAutoCompleteList);
											}
										});
							}
						});
	});
</script>
<embed id="backgroundMusic" src="${pageContext.request.contextPath}/music/boogieonandon.mp3" width="0px" height="0px">
<c:choose>
   <c:when test="${sessionScope.mvo==null}">
      <!-- Header -->
      <div id="header-wrapper">
         <header id="header" class="container">
            <!-- Logo -->
            <a href="${pageContext.request.contextPath}/index.jsp"> <img
               src="${pageContext.request.contextPath}/images/Logo.png"
               style="width: 250px;">
            </a>

           <!-- Nav -->
            <nav id="nav">
            <br>
               <ul>
                  <li class="current"><a class = "tab"
                     href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
                  <li><a class = "tab"
                     href="${pageContext.request.contextPath}/bookie/login.jsp">로그인</a></li>
                  <li><a class = "tab"
                     href="${pageContext.request.contextPath}/bookie/register.jsp">회원가입</a></li>
                  <li><a class = "tab"
                     href="${pageContext.request.contextPath}/bookie/findId.jsp">아이디 찾기</a></li>
                     <li style = "padding:0px;">/</li>
                  <li style = "margin-left:-25px;"><a class = "tab"
                     href="${pageContext.request.contextPath}/bookie/findPw.jsp">비밀번호 찾기</a></li>
               </ul>

            </nav>
            <br>
            <div class="container">
               <div class="row">
                  <div class="2u"></div>
                  <div class="8u">
                     <form
                        action="${pageContext.request.contextPath}/DispatcherServlet"
                        id="bookSearchForm">
                        <div class="ui-widget">
                           <div class="input-group input-group-lg">
                              <input type="hidden" name="command" value="bookSearch">
                              <input id="tags" type="text" class="form-control" name="title"
                                 style="border-color: #cccccc"> <span
                                 class="input-group-addon" id="tagsSpan"> <i
                                 class="fa fa-search" id="tagsI" onclick="bookSearch()"></i>
                              </span>
                           </div>
                        </div>
                     </form>
                  </div>
                  <div class="2u"></div>
               </div>
            </div>
         </header>
      </div>
   </c:when>
   <c:otherwise>
      <!-- Header -->
      <div id="header-wrapper">
         <header id="header" class="container">
            <div id="logo">
               <a href="${pageContext.request.contextPath}/index.jsp"><img
                  src="${pageContext.request.contextPath}/images/Logo.png"
                  style="width: 250px;"></a>
            </div>
             <br>
            <!-- Nav -->
            <nav id="nav">
            <br>
               <ul>
               <li class="current"><a class = "tab" href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
               <li><a class = "tab" href="javascript:logout()">${sessionScope.mvo.name}님 &nbsp; 로그아웃</a></li>
               <li><a class = "tab" href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage">마이페이지</a></li>
               <li><a class = "tab" href="${pageContext.request.contextPath}/bookie/update.jsp">회원정보수정</a></li>
            </ul>
            </nav>
				<div class="container">
					<div class="row">
						<div class="2u"></div>
						<div class="8u">
							<form action="${pageContext.request.contextPath}/DispatcherServlet" id="bookSearchForm">
								<div class="ui-widget">
									<div class="input-group input-group-lg">
										<input type="hidden" name="command" value="bookSearch">
										<input id="tags" type="text" class="form-control" name="title" style="border-color: #cccccc"> 
										<span class="input-group-addon" id="tagsSpan"> 
											<i class="fa fa-search" id="tagsI" onclick="bookSearch()"></i>
										</span>
									</div>
								</div>
							</form>
						</div>
						<div class="2u"></div>
					</div>
				</div>
			</header>
		</div>
   </c:otherwise>
</c:choose>
