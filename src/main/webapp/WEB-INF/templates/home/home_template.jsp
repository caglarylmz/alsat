<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://localhost:8080/alsat/tags/breadcrumb" prefix="br" %>
<%@ taglib uri="http://localhost:8080/alsat/tags/breadcrumb-alternative" prefix="bra" %>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang=tr>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="AlSat">
	<meta name="keywords" content="alsat,hayvan,büyükbaş,buyukbas,inek,damızlık,boğa,kurban,kurbanlık">
	<meta name="author" content="caglarylmz">
	<!-- Title -->
	<title>Alsat | ${title}</title>
	<tiles:insertAttribute name="styles"></tiles:insertAttribute>
	<link rel="stylesheet" href="${contextRoot}/resources/home/css/main.css" />
	<link rel="stylesheet" href="${contextRoot}/resources/home/css/parent-category.css" />


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
	<c:if test="${isCategory || isAdvert}">
		<div class='container-fluid bg-dark m-0 d-none d-md-block'>
			<br:breadcrumb category="${category}" />
			<!--<bra:breadcrumb-alternative category="${category}" />-->

		</div>


	</c:if>

	<!--isMain-->
	<c:if test="${isMain}">
		<div class="container mt20">
			<div class="row">
				<!--****************************************************************************************************************-->
				<!--LEFT MENU-->
				<div class="col-lg-3  d-none d-lg-block">
					<tiles:insertAttribute name="main_left_menu"></tiles:insertAttribute>
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
	</c:if>
	<!--isMain-->
	<!--isSearch-->
	<c:if test="${isSearch}">
		<div class="container mt20">
			<div class="row">
				<!--****************************************************************************************************************-->
				<!--LEFT MENU-->
				<div class="col-lg-3  d-none d-lg-block">
					<tiles:insertAttribute name="main_left_menu"></tiles:insertAttribute>
				</div>
				<!--LEFT MENU-->
				<!--****************************************************************************************************************-->
				<!--****************************************************************************************************************-->
				<!--CONTENT-->
				<div class="col-lg-9">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>
				<!--CONTENT-->
				<!--****************************************************************************************************************-->
			</div>
		</div>
		<!--MAIN PAGE-->
	</c:if>
	<!--isSearch-->
	<!--isCategory-->
	<c:if test="${isCategory}">
		<div class="container mt20 arsiv">
			<div class="row">
				<!--****************************************************************************************************************-->
				<!--LEFT MENU-->
				<div class="col-lg-3 sidebar mb-3">
					<tiles:insertAttribute name="category_left_menu"></tiles:insertAttribute>

				</div>
				<!--LEFT MENU-->
				<!--****************************************************************************************************************-->
				<!--****************************************************************************************************************-->
				<!--CONTENT-->
				<div class="col-lg-9">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>
				<!--CONTENT-->
				<!--****************************************************************************************************************-->
			</div>
		</div>
		<!--MAIN PAGE-->
	</c:if>
	<!--isCategory-->

	<!--isAddAdvert-->
	<c:if test="${isAddAdvert || isAdvert}">
		<div class="container mt20 arsiv">
			<div class="row">
				<!--****************************************************************************************************************-->
				<!--CONTENT-->
				<div class="col-lg-12">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>
				<!--CONTENT-->
				<!--****************************************************************************************************************-->
			</div>
		</div>
		<!--MAIN PAGE-->
	</c:if>
	<!--isAddAdvert-->

	<!--****************************************************************************************************************-->
	<!-- Footer -->
	<!-- Footer -->
	<!--****************************************************************************************************************-->

	<!-- Sidebar-->
	<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
	<!--/.Sidebar -->


	<tiles:insertAttribute name="scripts"></tiles:insertAttribute>

	<script type="text/javascript" src="${contextRoot}/resources/home/js/main.js"></script>
	<c:if test="${isCategory}">
		<script type="text/javascript" src="${contextRoot}/resources/home/js/category-left.js"></script>
	</c:if>
	<c:if test="${isAddAdvert}">
		<script type="text/javascript" src="${contextRoot}/resources/home/js/add-advert.js"></script>
	</c:if>


</body>

</html>