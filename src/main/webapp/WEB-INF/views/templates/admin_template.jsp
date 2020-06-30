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
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/jqvmap/jqvmap.min.css">
<!-- Jquery-steps -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/jquery-steps/jquery.steps.css">
<!-- FileInput -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/fileinput/css/fileinput.min.css"
	media="all">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/plugins/summernote/summernote-bs4.css">

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="${contextRoot}/resources/admin/dist/css/custom.css"
	rel="stylesheet">
</head>
<body
	class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed ">
	<div class="wrapper">

		<!-- Navbar -->
		<tiles:insertAttribute name="navbar"></tiles:insertAttribute>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->

		<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>

		<!--/. Main Sidebar Container -->

		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Footer -->
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${contextRoot}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="${contextRoot}/resources/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<!-- For Jquery -->
	<script>
		window.contextRoot = "${contextRoot}";
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="${contextRoot}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables -->
	<script
		src="${contextRoot}/resources/admin/plugins/datatables/jquery.dataTables.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
	<!--VUE -->
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.11"></script>
	<!-- AXIOS -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!-- ChartJS -->
	<script
		src="${contextRoot}/resources/admin/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${contextRoot}/resources/admin/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script
		src="${contextRoot}/resources/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="${contextRoot}/resources/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script
		src="${contextRoot}/resources/admin/plugins/moment/moment.min.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="${contextRoot}/resources/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Select2 -->
	<script
		src="${contextRoot}/resources/admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- SweetAlert2 -->
	<script
		src="${contextRoot}/resources/admin/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- Summernote -->
	<script
		src="${contextRoot}/resources/admin/plugins/summernote/summernote-bs4.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/jquery-steps/jquery.steps.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${contextRoot}/resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- fileinput -->
	<script
		src="${contextRoot}/resources/admin/plugins/fileinput/js/plugins/piexif.min.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/fileinput/js/plugins/sortable.min.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/fileinput/js/plugins/purify.min.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/fileinput/js/fileinput.min.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/fileinput/themes/fas/theme.min.js"></script>
	<script
		src="${contextRoot}/resources/admin/plugins/fileinput/js/locales/tr.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextRoot}/resources/admin/dist/js/bootbox.min.js"></script>
	<script src="${contextRoot}/resources/admin/dist/js/adminlte.min.js"></script>
	<script src="${contextRoot}/resources/admin/dist/js/demo.js"></script>
	<script src="${contextRoot}/resources/admin/dist/js/custom.js"></script>


</body>
</html>
