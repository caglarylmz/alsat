<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<html lang=tr>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="AlSat Admin Dashboard">
	<meta name="keywords" content="alsay,admin,dashboard">
	<meta name="author" content="caglarylmz">
	<!-- Title -->
	<title>Alsat | Giriş- Kayıt</title>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${contextRoot}/resources/admin/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${contextRoot}/resources/admin/dist/css/adminlte.min.css">
	<!-- Custom style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/style.default.css">
	<!-- Carousel -->
	<link href="${pageContext.request.contextPath}/resources/eshopper/plugins/lightslider/dist/css/lightslider.min.css"
		rel="stylesheet">
	<!-- Custom style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/custom.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition sidebar-collapse layout-top-nav">
	<div class="wrapper">
		<!-- Navbar -->
		<tiles:insertAttribute name="header" />
		<!-- /.navbar -->
		<!-- Main Sidebar Container -->	
		<!-- Main Sidebar Container -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<div class="container">
				<div class="row">
					<div class="col-12">
						<tiles:insertAttribute name="content" />
					</div>
				</div>

			</div>


			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
	<!-- ./wrapper -->


	<!-- jQuery -->
	<script src="${contextRoot}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${contextRoot}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/eshopper/plugins/lightslider/dist/js/lightslider.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextRoot}/resources/admin/dist/js/adminlte.js"></script>
	<script src="${contextRoot}/resources/main/js/custom.js"></script>


</body>

</html>