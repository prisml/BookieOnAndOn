<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function bookSearch() {
		$("#bookSearchForm").submit();
	}
</script>

<!-- Scripts -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<!-- Header -->
<div id="header-wrapper">
	<header id="header" class="container">

		<!-- Logo -->
		<div id="logo">
			<h1>
				<a href="index.jsp">Verti</a>
			</h1>
			<span>by HTML5 UP</span>
		</div>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li class="current"><a href="index.jsp">Welcome</a></li>
				<li><a href="#">Dropdown</a>
					<ul>
						<li><a href="#">Lorem ipsum dolor</a></li>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Phasellus consequat</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Phasellus consequat</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam dolore nisl</a></li>
							</ul></li>
						<li><a href="#">Veroeros feugiat</a></li>
					</ul></li>
				<li><a href="left-sidebar.html">Left Sidebar</a></li>
				<li><a href="right-sidebar.html">Right Sidebar</a></li>
				<li><a href="no-sidebar.html">No Sidebar</a></li>
			</ul>
		</nav>
	</header>
</div>

<!-- Banner : 도서 검색-->
<div id="banner-wrapper">
	<div id="banner" class="box container">
		<form action="DispatcherServlet" id="bookSearchForm">
			<div class="input-group input-group-lg">
				<input type="hidden" name="command" value="bookSearch"> <input
					type="text" class="form-control" name="title"> <span
					class="input-group-addon"> <i class="fa fa-search"
					onclick="bookSearch()"></i>
				</span>
			</div>
		</form>
	</div>
</div>

