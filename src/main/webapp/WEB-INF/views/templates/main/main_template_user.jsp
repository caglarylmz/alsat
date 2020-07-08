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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Al-Sat | Ana Sayfa</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">
	<!-- Bootstrap CSS-->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/vendor/fontawesome/css/all.min.css">
	<!-- Google fonts - Roboto -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
	<!-- theme stylesheet-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/style.default.css"
		id="theme-stylesheet">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/custom.css">
	<!-- Favicon-->
	<link rel="icon" href="data:favicon.png">
	<!-- Tweaks for older IEs-->
	<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
	<header class="header">
		<div id="top">
			<!--topbar-->
			<tiles:insertAttribute name="topbar"></tiles:insertAttribute>
			<!--/topbar-->
			<!-- header-->
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
			<!-- header-->
	</header>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- breadcrumb-->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li aria-current="page" class="breadcrumb-item active">Ladies</li>
							</ol>
						</nav>
					</div>
					<!-- *** SIDEBAR *** -->
					<div class="col-lg-3">
						<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
						<div class="banner"><a href="#"><img
									src="${pageContext.request.contextPath}/resources/main/img/banner.jpg"
									alt="sales 2014" class="img-fluid"></a></div>
					</div>
					<!-- *** SIDEBAR *** -->
					<!-- *** CONTAIN *** -->
					<div class="col-lg-9">
						<!-- *** FILTER *** -->
						<div class="box info-bar">
							<div class="row">
								<div class="col-md-12 col-lg-4 products-showing">Showing <strong>12</strong> of
									<strong>25</strong> products</div>
								<div class="col-md-12 col-lg-7 products-number-sort">
									<form
										class="form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row">
										<div class="products-number"><strong>Show</strong><a
												href="${pageContext.request.contextPath}/resources/main/#"
												class="btn btn-sm btn-primary">12</a><a
												href="${pageContext.request.contextPath}/resources/main/#"
												class="btn btn-outline-secondary btn-sm">24</a><a
												href="${pageContext.request.contextPath}/resources/main/#"
												class="btn btn-outline-secondary btn-sm">All</a><span>products</span>
										</div>
										<div class="products-sort-by mt-2 mt-lg-0"><strong>Sort by</strong>
											<select name="sort-by" class="form-control">
												<option>Price</option>
												<option>Name</option>
												<option>Sales first</option>
											</select>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- *** FILTER *** -->

						<!-- *** FILTER *** -->

						<!-- *** VIEW *** -->
						<tiles:insertAttribute name="content"></tiles:insertAttribute>
						<!-- *** VIEW *** -->

					</div>
					<!-- *** CONTAIN *** -->
				</div>
			</div>
		</div>
	</div>
	<!--
		*** FOOTER ***
		_________________________________________________________
		-->
	<div id="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<h4 class="mb-3">Pages</h4>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath}/resources/main/text.html">About us</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/text.html">Terms and
								conditions</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/faq.html">FAQ</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/contact.html">Contact us</a></li>
					</ul>
					<hr>
					<h4 class="mb-3">User section</h4>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath}/resources/main/#" data-toggle="modal"
								data-target="#login-modal">Login</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/register.html">Regiter</a></li>
					</ul>
				</div>
				<!-- /.col-lg-3-->
				<div class="col-lg-3 col-md-6">
					<h4 class="mb-3">Top categories</h4>
					<h5>Men</h5>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath}/resources/main/category.html">T-shirts</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/category.html">Shirts</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/category.html">Accessories</a>
						</li>
					</ul>
					<h5>Ladies</h5>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath}/resources/main/category.html">T-shirts</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/category.html">Skirts</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/category.html">Pants</a></li>
						<li><a href="${pageContext.request.contextPath}/resources/main/category.html">Accessories</a>
						</li>
					</ul>
				</div>
				<!-- /.col-lg-3-->
				<div class="col-lg-3 col-md-6">
					<h4 class="mb-3">Where to find us</h4>
					<p><strong>Obaju Ltd.</strong><br>13/25 New Avenue<br>New Heaven<br>45Y
						73J<br>England<br><strong>Great Britain</strong></p><a
						href="${pageContext.request.contextPath}/resources/main/contact.html">Go to contact page</a>
					<hr class="d-block d-md-none">
				</div>
				<!-- /.col-lg-3-->
				<div class="col-lg-3 col-md-6">
					<h4 class="mb-3">Get the news</h4>
					<p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
						turpis egestas.</p>
					<form>
						<div class="input-group">
							<input type="text" class="form-control"><span class="input-group-append">
								<button type="button" class="btn btn-outline-secondary">Subscribe!</button></span>
						</div>
						<!-- /input-group-->
					</form>
					<hr>
					<h4 class="mb-3">Stay in touch</h4>
					<p class="social"><a href="#" class="facebook external"><i class="fa fa-facebook"></i></a><a
							href="#" class="twitter external"><i class="fa fa-twitter"></i></a><a
							href="${pageContext.request.contextPath}/resources/main/#" class="instagram external"><i
								class="fa fa-instagram"></i></a><a
							href="${pageContext.request.contextPath}/resources/main/#" class="gplus external"><i
								class="fa fa-google-plus"></i></a><a
							href="${pageContext.request.contextPath}/resources/main/#" class="email external"><i
								class="fa fa-envelope"></i></a></p>
				</div>
				<!-- /.col-lg-3-->
			</div>
			<!-- /.row-->
		</div>
		<!-- /.container-->
	</div>
	<!-- /#footer-->
	<!-- *** FOOTER END ***-->


	<!--
		*** COPYRIGHT ***
		_________________________________________________________
		-->
	<div id="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-2 mb-lg-0">
					<p class="text-center text-lg-left">©2019 Your name goes here.</p>
				</div>
				<div class="col-lg-6">
				</div>
			</div>
		</div>
	</div>
	<!-- *** COPYRIGHT END ***-->
	<!-- JavaScript files-->
	<script src="${pageContext.request.contextPath}/resources/main/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/main/vendor/poppr.js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/main/vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="${pageContext.request.contextPath}/resources/main/js/front.js"></script>
	<script src="${pageContext.request.contextPath}/resources/main/js/custom.js"></script>

</body>


</html>