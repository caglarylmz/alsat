<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="br" uri="http://localhost:8080/alsat/tags/breadcrumb"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="tr">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">

	<title>AlSat | Ana Sayfa</title>

	<!-- Font Awesome -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/admin/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/dist/css/adminlte.min.css">
	<!-- Custom style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/style.default.css">
	<!-- Custom style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/custom.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition sidebar-collapse layout-top-nav">
	<div class="wrapper">
		<!-- Navbar -->
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-light-primary elevation-4">

			<!-- Sidebar -->
			<tiles:insertAttribute name="main-sidebar"></tiles:insertAttribute>
			<!-- /.sidebar -->
		</aside>
		<!-- Main Sidebar Container -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<div class="container">
				<div class="row">
					<!-- *** SIDEBAR *** -->
					<div class="col-lg-3 d-none d-lg-block">
						<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
					</div>
					<!-- *** SIDEBAR *** -->

					<!-- *** CONTAIN *** -->
					<div class="col-lg-9 col-12">

						<!-- *** VIEW *** -->
						<tiles:insertAttribute name="content"></tiles:insertAttribute>
						<!-- *** VIEW *** -->

					</div>
					<!-- *** CONTAIN *** -->
				</div>
				<!-- /.row -->
			</div><!-- /.container-fluid -->
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- Main Footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<script src="${pageContext.request.contextPath}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js">
	</script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/resources/admin/dist/js/adminlte.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/main/js/custom.js"></script>

</body>

</html>