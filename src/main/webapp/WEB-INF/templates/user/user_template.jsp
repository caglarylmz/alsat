<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="br" uri="http://localhost:8080/alsat/tags/breadcrumb"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="tr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="AlSat - Kurbanlık, Süt, Tavuk Alım Satım">
	<meta name="keywords" content="alsat,kurbanlık,süt,inek,kuzu,tavuk,düve,yumurta,süt">
	<meta name="author" content="caglarylmz">

	<title>AlSat |
		${pageContext.request.userPrincipal.name} - ${title}
	</title>

	<tiles:insertAttribute name="styles"></tiles:insertAttribute>
	<!-- Custom style -->
	<link rel="stylesheet" href="${contextRoot}/resources/main/css/custom.css">
	<link rel="stylesheet" href="${contextRoot}/resources/adminlte/css/custom.css" rel="stylesheet">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition sidebar-collapse layout-top-nav" style="height: auto;">
	<div class="wrapper">
		<!-- Navbar -->
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-light-primary elevation-4">

			<!-- Sidebar -->
			<tiles:insertAttribute name="user-sidebar"></tiles:insertAttribute>
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
	<tiles:insertAttribute name="scripts"></tiles:insertAttribute>
	<script src="${contextRoot}/resources/user/dist/js/user.js"></script>
	<script src="${contextRoot}/resources/adminlte/js/custom.js"></script>

</body>

</html>