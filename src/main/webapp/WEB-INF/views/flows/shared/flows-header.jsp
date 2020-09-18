<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<html lang=tr>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="AlSat - Kurbanlık, Süt, Tavuk Alım Satım">
    <meta name="keywords" content="alsat,kurbanlık,süt,inek,kuzu,tavuk,düve,yumurta,süt">
    <meta name="author" content="caglarylmz">
    <!-- Title -->
    <title>Alsat | ${title}</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- DataTables -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/select2/css/select2.min.css">
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Carousel -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/lightslider/css/lightslider.min.css">
    <!-- Jquery-steps -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/jquery-steps/jquery.steps.css">
    <!-- FileInput -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/fileinput/css/fileinput.min.css" media="all">
    <!-- overlayScrollbars -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/summernote/summernote-bs4.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/css/adminlte.min.css">
    <link rel="stylesheet" href="${contextRoot}/resources/main/css/style.default.css">
    <link rel="stylesheet" href="${contextRoot}/resources/assets/css/select-category.css">

    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition sidebar-collapse layout-top-nav">
    <div class="wrapper">
        <!-- Navbar -->
        <%@include file="../shared/flows-navbar.jsp"%>

        <!-- /.navbar -->
        <div class="content-wrapper">
            <!-- Main content -->