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
	<!-- Title -->
	<title>AlSat |
		${pageContext.request.userPrincipal.name} - ${title}
	</title>
	<script src="${contextRoot}/resources/assets/js/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<tiles:insertAttribute name="styles"></tiles:insertAttribute>
	<link rel="stylesheet" href="${contextRoot}/resources/assets/css/user/add_advert.css">

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


	<!-- REQUIRED SCRIPTS -->
	<tiles:insertAttribute name="scripts"></tiles:insertAttribute>
	<script src="${contextRoot}/resources/user/dist/js/user.js"></script>
	<script src="${contextRoot}/resources/assets/js/user/add_advert.js"></script>





</body>

</html>