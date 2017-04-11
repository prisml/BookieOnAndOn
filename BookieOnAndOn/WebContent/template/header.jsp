<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
<<<<<<< HEAD
#nav{
   font-size: 17px;
=======
#nav {
	font-size: 17px;
}

#tags {
	height: 60px;
}

#tagsSpan {
	height: 60px;
}

#tagsI {
	width: 40px;
>>>>>>> branch 'master' of https://github.com/prisml/BookieOnAndOn.git
}
</style>
<script>
   function logout() {
      var f = confirm("로그아웃 하시겠습니까?");
      if (f)
         location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=logout";
   }

<<<<<<< HEAD
   function bookSearch() {
      if ($("#tags").val() == 0) {
         return;
      } else {
         $("#bookSearchForm").submit();
      }
   }
=======
	function bookSearch() {
		if ($("#tags").val() == 0) {
			return;
		} else {
			$("#tagsSpan").css("background", "white");
			$("#bookSearchForm").submit();
		}
	}
>>>>>>> branch 'master' of https://github.com/prisml/BookieOnAndOn.git

<<<<<<< HEAD
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

   $(document).ready(function() {
      $("#tags").css("height", "60px");
      $("#tagsSpan").css("height", "60px");
      $("#tagsI").css("width", "40px");
   });
=======
	$(function() {
		$("#tags").autocomplete({source : function(request, response) {
			$.ajax({
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
>>>>>>> branch 'master' of https://github.com/prisml/BookieOnAndOn.git
</script>

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

<<<<<<< HEAD
            <!-- Nav -->
            <nav id="nav">
               <ul>
                  <li class="current"><a
                     href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
                     <li>|</li>
                  <li><a
                     href="${pageContext.request.contextPath}/bookieOnAndOn/login.jsp">Login</a></li>
                     <li>|</li>
                  <li><a
                     href="${pageContext.request.contextPath}/bookieOnAndOn/register.jsp">Register</a></li>
                     <li>|</li>
                  <li><a
                     href="${pageContext.request.contextPath}/bookieOnAndOn/findId.jsp">Find   ID</a></li>
                     <li>/</li>
                  <li><a 
                     href="${pageContext.request.contextPath}/bookieOnAndOn/findPw.jsp">PW</a></li>
                     <li>|</li>
               </ul>

            </nav>
            <br>
            <br>
            <br>
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
            <!-- Nav -->
            <nav id="nav">
               <ul>
               <li class="current"><a
                  href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
               <li><a href="javascript:logout()">${sessionScope.mvo.name}님 &nbsp; Logout</a></li>
               <li><a
                  href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage">마이페이지</a></li>
               <li><a
                  href="${pageContext.request.contextPath}/bookieOnAndOn/update.jsp">회원정보수정</a></li>
            </ul>
            </nav>
=======
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a
							href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
						
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/login.jsp">로그인</a></li>
						
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/register.jsp">회원가입</a></li>
						
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/findId.jsp">아이디 찾기</a></li>
						<li>/</li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/findPw.jsp">비밀번호 찾기</a></li>
						
					</ul>
				</nav>
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
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a
							href="${pageContext.request.contextPath}/index.jsp">welcome</a></li>
						<li><a href="javascript:logout()">${sessionScope.mvo.name}님
								&nbsp; Logout</a></li>
						<li><a
							href="${pageContext.request.contextPath}/DispatcherServlet?command=mypage">마이페이지</a></li>
						<li><a
							href="${pageContext.request.contextPath}/bookieOnAndOn/update.jsp">회원정보수정</a></li>
					</ul>
				</nav>
>>>>>>> branch 'master' of https://github.com/prisml/BookieOnAndOn.git

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
                              <input id="tags" type="text" class="form-control" name="title">
                              <span class="input-group-addon"> <i
                                 class="fa fa-search" onclick="bookSearch()"></i>
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