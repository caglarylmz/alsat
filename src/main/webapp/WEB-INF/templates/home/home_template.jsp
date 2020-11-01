<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang=tr>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="AlSat Admin Dashboard">
	<meta name="keywords" content="alsay,admin,dashboard">
	<meta name="author" content="caglarylmz">
	<!-- Title -->
	<title>Alsat | Admin</title>
	<link rel="stylesheet" href="${contextRoot}/resources/home/plugins/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${contextRoot}/resources/home/plugins/uikit/css/uikit.min.css" />

	<link rel="stylesheet" href="${contextRoot}/resources/home/plugins/fontawesome/css/all.min.css" />
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- SIDR -->
	<link rel="stylesheet" href="${contextRoot}/resources/home/plugins/sidr/stylesheets/jquery.sidr.light.min.css" />
	<link rel="stylesheet" href="${contextRoot}/resources/home/css/main.css" />

	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body>
	<!--****************************************************************************************************************-->
	<!-- Navbar -->
	<tiles:insertAttribute name="navbar_desktop"></tiles:insertAttribute>
	<!-- /.navbar -->
	<!-- Navbar -->
	<tiles:insertAttribute name="navbar_mobile"></tiles:insertAttribute>
	<!-- /.navbar -->
	<!--****************************************************************************************************************-->
	<!--****************************************************************************************************************-->
	<!--MAIN PAGE-->
	<div class="container mt20" id="app">
		<div class="row">
			<!--****************************************************************************************************************-->
			<!--LEFT MENU-->
			<div class="col-lg-3  d-none d-lg-block">
				<tiles:insertAttribute name="left_menu"></tiles:insertAttribute>
			</div>
			<!--LEFT MENU-->
			<!--****************************************************************************************************************-->
			<!--****************************************************************************************************************-->
			<!--CONTENT-->
			<div class="col-lg-9">
				<!--SLİDER REKLAM-->
				<div uk-slider="autoplay: true">
					<div class="uk-slider-container">
						<ul class="uk-slider-items uk-child-width-1-1">
							<li>
								<img src="${contextRoot}/resources/assets/images/reklam/reklam1.jpg"
									style="width: 100%; height: 200px;" alt="...">
							</li>
							<li>
								<img src="${contextRoot}/resources/assets/images/reklam/reklam2.png"
									style="width: 100%; height: 200px;" alt="...">
							</li>
							<li>
								<img src="${contextRoot}/resources/assets/images/reklam/reklam3.jpg"
									style="width: 100%; height: 200px;" alt="...">
							</li>
						</ul>
						<ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin-top"></ul>
					</div>
				</div>
				<!--SLİDER REKLAM-->
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
			</div>
			<!--CONTENT-->
			<!--****************************************************************************************************************-->
		</div>
	</div>
	<!--MAIN PAGE-->
	<!--****************************************************************************************************************-->
	<!--****************************************************************************************************************-->
	<!-- Footer -->
	<!-- Footer -->
	<!--****************************************************************************************************************-->

	<!-- Sidebar-->
	<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
	<!--/.Sidebar -->


	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script type="text/javascript" src="${contextRoot}/resources/home/plugins/jquery/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/resources/home/plugins/popper/umd/popper.js"></script>
	<script type="text/javascript" src="${contextRoot}/resources/home/plugins/uikit/js/uikit.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/resources/home/plugins/uikit/js/uikit-icons.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/resources/home/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- SIDR -->
	<script type="text/javascript" src="${contextRoot}/resources/home/plugins/sidr/jquery.sidr.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/resources/home/js/main.js"></script>

</body>

</html>