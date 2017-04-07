<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function bookSearch() {
		$("#bookSearchForm").submit();
	}
</script>
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

		<div class="container">
			<div class="row">
				<div class="2u"></div>
				<div class="8u">
					<form action="${pageContext.request.contextPath}/DispatcherServlet"
						id="bookSearchForm">
						<div class="input-group input-group-lg">
							<input type="hidden" name="command" value="bookSearch"> <input
								type="text" class="form-control" name="title"> <span
								class="input-group-addon"> <i class="fa fa-search"
								onclick="bookSearch()"></i>
							</span>
						</div>
					</form>
				</div>
				<div class="2u"></div>
			</div>
		</div>
	</header>
</div>
