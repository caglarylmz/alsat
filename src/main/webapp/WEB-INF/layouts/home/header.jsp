<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<header id="header">
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> 90 555 821
									6565</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>
									info@alsat.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 ">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header_top-->

	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-md-4 clearfix">
					<div class="logo pull-left">
						<a href="${pageContext.request.contextPath}/"><img
							src="${pageContext.request.contextPath}/resources/eshopper/images/home/logo.png"
							height="40" alt="" /></a>
					</div>

				</div>
				<div class="col-md-4 clearfix mx-auto shop-menu" id="header_search">

					<form>
						<div class="input-group ">
							<input type="text" class="form-control" placeholder="Search">
							<div class="input-group-btn">
								<button class="btn btn-info" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>


				<div class="col-md-4 clearfix">
					<div class="shop-menu clearfix pull-right">
						<ul class="nav navbar-nav">
							<sec:authorize access="!isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/uye"><i
										class="fa fa-lock"></i> Giriş Yap</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li class="dropdown"><a
									class="btn btn-default dropdown-toggle" type="button"
									id="userDropDown" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="true"><i class="glyphicon glyphicon-user"></i>
										<sec:authentication property="name" /></a>
									<ul class="dropdown-menu" aria-labelledby="userDropDown">
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<li><a
												href="${pageContext.request.contextPath}/admin/panel">Benim
													Alanım</a></li>
											<li><a href="#">İlanlarım</a></li>
											<li><a href="#">Favorilerim</a></li>
											<li><a href="#">Satışlarım</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/account/profile">Profilim</a></li>
											<li><a href="${pageContext.request.contextPath}/uye/process-logout">Çıkış Yap</a></li>
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_USER')">
											<li><a
												href="${pageContext.request.contextPath}/user/panel">Benim
													Alanım</a></li>
											<li><a href="#">İlanlarım</a></li>
											<li><a href="#">Favorilerim</a></li>
											<li><a href="#">Satışlarım</a></li>
											<li><a href="${pageContext.request.contextPath}/user/account/profile">Profilim</a></li>
											<li><a href="${pageContext.request.contextPath}/uye/process-logout">Çıkış Yap</a></li>
										</sec:authorize>
									</ul></li>

							</sec:authorize>
							<li><a href="${pageContext.request.contextPath}/admin/advert/add"><i
									class="glyphicon glyphicon-new-window"></i> İlan Ver</a></li>

						</ul>
					</div>
				</div>



			</div>
		</div>
	</div>
	<!--/header-middle-->
	<!--header-bottom
	<div class="header-bottom">		
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="index.html" class="active">Home</a></li>
							<li class="dropdown"><a href="#">Shop<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="shop.html">Products</a></li>
									<li><a href="product-details.html">Product Details</a></li>
									<li><a href="checkout.html">Checkout</a></li>
									<li><a href="cart.html">Cart</a></li>
									<li><a href="login.html">Login</a></li>
								</ul></li>
							<li class="dropdown"><a href="#">Blog<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="blog.html">Blog List</a></li>
									<li><a href="blog-single.html">Blog Single</a></li>
								</ul></li>
							<li><a href="404.html">404</a></li>
							<li><a href="contact-us.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="search_box pull-right">
						<input type="text" placeholder="Search" />
					</div>
				</div>
			</div>
		</div>
	</div>
	/header-bottom-->
</header>