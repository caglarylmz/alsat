<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<div class="row">
		<div class="col-lg-6 offer mb-3 mb-lg-0"><a href="#" class="btn btn-success btn-sm">Günün reklamı</a><a href="#"
				class="ml-1">Reklam!</a></div>
		<div class="col-lg-6 text-center text-lg-right">
			<ul class="menu list-inline mb-0">
				<li class="list-inline-item"><a href="contact.html">Contact</a></li>
			</ul>
		</div>
	</div>

	<nav class="navbar border-bottom navbar-light">
		<a href="/" class="nav-link">
			<img src="${contextRoot}/resources/assets/images/logo.png" height="40px" alt="" />
		</a>

		<div class="col-6 align-items-center">
			<form class="my-0" action="${pageContext.request.contextPath}/" method="POST">
				<div class="input-group align-self-center">
					<c:if test="${query.isEmpty()}">
						<input type="text" class="form-control" name="query" placeholder="İlan ara..." />
					</c:if>
					<c:if test="${!query.isEmpty()}">
						<input type="text" class="form-control" name="query" placeholder="İlan ara..."
							value="${query}" />
					</c:if>
					<div class="input-group-prepend">
						<button type="submit" class="btn rounded-right"
							style="background-color: #4fbfa8; color: white;">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<a class="d-block d-lg-none" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
		<ul class="list-inline mb-0 d-none d-lg-block">
			<sec:authorize access="!isAuthenticated()">
				<li class="list-inline-item">
					<a href="${pageContext.request.contextPath}/uye">
						<i class="btn btn-outline-primary btn-sm btn-round">
							<span>Giriş Yap</span>
						</i>
					</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="list-inline-item">
					<a href="${pageContext.request.contextPath}/user/panel/ilanlar/mesaj" data-toggle="tooltip"
						data-placement="right" title="İlan Mesajlarım" class="btn btn-outline-primary btn-sm btn-round">
						<i class="fas fa-envelope"></i>
					</a>
				</li>
				<li class="list-inline-item">
					<a href="${pageContext.request.contextPath}/user/panel/ilanlar/favori" data-toggle="tooltip"
						data-placement="right" title="Favori İlanlarım"
						class="btn btn-outline-primary btn-sm btn-round">
						<i class="fas fa-star"></i>
					</a>
				</li>
				<li class="list-inline-item">
					<div class="dropdown">
						<button class="btn btn-outline-primary btn-sm btn-circle" type="button" id="dropdownMenu"
							data-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-user-circle"></i> ${pageContext.request.userPrincipal.name}
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu" aria-expanded="false"
							aria-dropeffect="popup">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<a href="${pageContext.request.contextPath}/admin/panel"
									class="dropdown-item border-bottom  btn-outline-primary">Admin Panel</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_USER')">
								<a href="${pageContext.request.contextPath}/user/panel"
									class="dropdown-item border-bottom  btn-outline-primary">Panel</a>
								<a href="${pageContext.request.contextPath}/user/account/profile"
									class="dropdown-item border-bottom  btn-outline-primary">Profil</a>
							</sec:authorize>

							<a class="dropdown-item btn-outline-primary"
								href="${pageContext.request.contextPath}/uye/process-logout">
								<i class="fa fa-power-off m-0 mr-2"></i>Çıkış
							</a>
						</div>

					</div>
				</li>
			</sec:authorize>
			<li class="list-inline-item">
				<a href="${pageContext.request.contextPath}/user/advert/add_"><i
						class="btn btn-primary btn-sm btn-round">
						<span>İlan Ver</span>
					</i></a>
			</li>
			<li class="list-inline-item">
				<a href="${pageContext.request.contextPath}/advert"><i class="btn btn-primary btn-sm btn-round">
						<span>flow</span>
					</i></a>
			</li>
		</ul>
	</nav>
</div>