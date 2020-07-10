<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="mt" uri="http://localhost:8080/alsat/categoryList"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<html lang=tr>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Al-Sat | Ana Sayfa</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">
	<!-- Bootstrap CSS-->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/vendor/fontawesome/css/all.min.css">
	<!-- Google fonts - Roboto -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
	<!-- theme stylesheet-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/style.default.css"
		id="theme-stylesheet">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/custom.css">
	<!-- Favicon-->
	<link rel="icon" href="data:favicon.png">
	<!-- Tweaks for older IEs-->
	<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
	<header class="header">
		<div id="top">
			<!--topbar-->
			<tiles:insertAttribute name="topbar"></tiles:insertAttribute>
			<!--/topbar-->
			<!-- header-->
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
			<!-- header-->
	</header>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<!-- *** SIDEBAR *** -->
					<div class="col-lg-3">
						<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
					</div>
					<!-- *** SIDEBAR *** -->
					<!-- *** CONTAIN *** -->
					<div class="col-lg-9">
						<!-- *** FILTER *** -->

						<!-- *** FILTER *** -->

						<!-- *** FILTER *** -->

						<!-- *** VIEW *** -->
						<tiles:insertAttribute name="content"></tiles:insertAttribute>
						<!-- *** VIEW *** -->

					</div>
					<!-- *** CONTAIN *** -->
				</div>
			</div>
		</div>
	</div>


	<!--
		*** COPYRIGHT ***
		_________________________________________________________
		-->
	<div id="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-2 mb-lg-0">
					<p class="text-center text-lg-left">©2020 Al-Sat</p>
				</div>
				<div class="col-lg-6">
				</div>
			</div>
		</div>
	</div>
	<!-- *** COPYRIGHT END ***-->
	<!-- JavaScript files-->
	<script src="${pageContext.request.contextPath}/resources/main/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/main/vendor/poppr.js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/main/vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="${pageContext.request.contextPath}/resources/main/js/front.js"></script>
	<script src="${pageContext.request.contextPath}/resources/main/js/custom.js"></script>

</body>


</html>