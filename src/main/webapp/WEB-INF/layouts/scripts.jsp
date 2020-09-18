<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="${contextRoot}/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${contextRoot}/resources/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- For Jquery -->
<script>
	window.contextRoot = "${contextRoot}";
	$.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="${contextRoot}/resources/adminlte/plugins/datatables/jquery.dataTables.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<!-- ChartJS -->
<script src="${contextRoot}/resources/adminlte/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${contextRoot}/resources/adminlte/plugins/sparklines/sparkline.js"></script>
<!--lightslider-->
<script src="${contextRoot}/resources/adminlte/plugins/lightslider/js/lightslider.min.js">
</script>
<!-- jQuery Knob Chart -->
<script src="${contextRoot}/resources/adminlte/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${contextRoot}/resources/adminlte/plugins/moment/moment.min.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${contextRoot}/resources/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js">
</script>
<!-- Select2 -->
<script src="${contextRoot}/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- SweetAlert2 -->
<script src="${contextRoot}/resources/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Summernote -->
<script src="${contextRoot}/resources/adminlte/plugins/summernote/summernote-bs4.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/jquery-steps/jquery.steps.min.js"></script>
<!-- overlayScrollbars -->
<script src="${contextRoot}/resources/adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- fileinput -->
<script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/plugins/piexif.min.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/plugins/sortable.min.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/plugins/purify.min.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/fileinput.min.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/fileinput/themes/fas/theme.min.js"></script>
<script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/locales/tr.js"></script>
<!-- Jquery Steps-->
<script src="${contextRoot}/resources/adminlte/plugins/jquery-steps/jquery.steps.min.js"></script>
<!-- adminLTE App -->
<script src="${contextRoot}/resources/adminlte/js/bootbox.min.js"></script>
<script src="${contextRoot}/resources/adminlte/js/adminlte.min.js"></script>
<script src="${contextRoot}/resources/adminlte/js/demo.js"></script>