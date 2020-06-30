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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | AlSat</title>
<link
	href="${pageContext.request.contextPath}/resources/eshopper/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/eshopper/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/eshopper/css/prettyPhoto.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/eshopper/css/price-range.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/eshopper/css/animate.css"
	rel="stylesheet">
<!-- Carousel -->
<link
	href="${pageContext.request.contextPath}/resources/eshopper/plugins/lightslider/dist/css/lightslider.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/eshopper/css/main.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/eshopper/css/responsive.css"
	rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath}/resources/eshopper/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/eshopper/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/eshopper/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/resources/eshopper/images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
	<!--header-->
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<!--/header-->

	<section>
		<div class="container-fluid" style="margin-left: 20px; margin-right: 20px;">
			<div class="row">
				<div class="col-sm-3 hidden-xs">
					<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>

					<!--<mt:categoryList />-->
				</div>
				<!-- Content -->
				<div class="col-sm-9 padding-right">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>
			</div>
		</div>
	</section>
	<!--Footer-->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	<!--/Footer-->



	<script
		src="${pageContext.request.contextPath}/resources/eshopper/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/eshopper/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/eshopper/js/jquery.scrollUp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/eshopper/js/price-range.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/eshopper/js/jquery.prettyPhoto.js"></script>
	<!-- carousel -->
	<script
		src="${pageContext.request.contextPath}/resources/eshopper/plugins/lightslider/dist/js/lightslider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/eshopper/js/main.js"></script>


</body>
</html>