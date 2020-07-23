<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="sidebar">
	<!-- Sidebar user (optional) -->
	<sec:authorize access="isAuthenticated()">
		<div class="user-panel mt-2">
			<button class="btn-block p-0  btn-outline-primary" data-toggle="collapse" aria-expanded="false"
				data-target="#userControls" aria-expanded="false" aria-controls="userControls">
				<img src="${pageContext.request.contextPath}/resources/assets/images/user.png"
					class="img-circle elevation-2 mr-2" alt="User Image">${pageContext.request.userPrincipal.name}
				</a>
				<div class="collapse" id="userControls">
					<div class="bg-light">
						<ul class="nav nav-pills nav-sidebar flex-column">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li>
									<a href="${pageContext.request.contextPath}/admin/dashboard"
										class="dropdown-item border-bottom  btn-outline-primary">Panel</a>
								</li>

							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_USER')">
								<li>
									<a href="${pageContext.request.contextPath}/user/panel"
										class="dropdown-item border-bottom  btn-outline-primary">Panel</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user/account/profile"
										class="dropdown-item border-bottom  btn-outline-primary"><i
											class="fa fa-user m-0 mr-2"></i>Profil</a>

								</li>
							</sec:authorize>

							<li>
								<a class="dropdown-item  btn-outline-primary"
									href="${pageContext.request.contextPath}/uye/process-logout">
									<i class="fa fa-power-off m-0 mr-2"></i>Çıkış
								</a>
							</li>
						</ul>
					</div>
				</div>
		</div>
		<div class="user-panel mt-2">
			<a class="btn-block p-0 btn btn-round  btn-primary"
				href="${pageContext.request.contextPath}/admin/advert/add">İlan ver</a>
		</div>
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
		<div class="user-panel mt-2">
			<a class="btn-block p-0 btn  btn-round btn-outline-primary"
				href="${pageContext.request.contextPath}/uye">Giriş Yap</a>
		</div>
		<div class="user-panel mt-2">
			<a class="btn-block p-0 btn  btn-round btn-primary"
				href="${pageContext.request.contextPath}/admin/advert/add">İlan ver</a>
		</div>
	</sec:authorize>
	<!-- Sidebar Menu -->
	<nav class="mt-2">
		<ul class="nav nav-pills nav-sidebar flex-column  nav-compact nav-child-indent" data-widget="treeview"
			role="menu" data-accordion="false">
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link">
					<i class="nav-icon fas fa-tachometer-alt"></i>
					<p>
						İlan Yönetimi
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/user/panel" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Özet</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>İlanlarım</p>
						</a>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link">
					<i class="nav-icon fas fa-tachometer-alt"></i>
					<p>
						Favoriler
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="../../index.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Favori İlanlar</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Favori Satıcılar</p>
						</a>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link">
					<i class="nav-icon fas fa-tachometer-alt"></i>
					<p>
						Mesajlar
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="../../index.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>İlan Mesajlarım</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Bilgilendirmeler</p>
						</a>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link">
					<i class="nav-icon fas fa-tachometer-alt"></i>
					<p>
						İşlemler
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="../../index.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Hesap Hareketlerim</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Kayıtlı Kredi Kartlarım</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Engellediklerim</p>
						</a>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link">
					<i class="nav-icon fas fa-tachometer-alt"></i>
					<p>
						Üyelik
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="../../index.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Kişisel Bilgiler</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Eposta</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Cep Telefonu</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Şifre</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Üyelik İptali</p>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>
	<!-- /.sidebar-menu -->
</div>