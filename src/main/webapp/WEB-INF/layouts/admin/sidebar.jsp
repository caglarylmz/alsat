<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<div class="user-panel  d-flex">
		<a href="${pageContext.request.contextPath}/" class="brand-link">
			<img
			src="${pageContext.request.contextPath}/resources/admin/dist/img/logo.png"
			class="brand-image img-circle elevation-3" style="opacity: .8;">
			<img class="brand-text font-weight-light"
			src="${pageContext.request.contextPath}/resources/eshopper/images/home/logo.png"
			style="width: 100px; margin-bottom: 10px;" />
		</a>

	</div>
	<div class="sidebar">

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/panel"
					class="nav-link"> <i class="nav-icon fas fa-tachometer-alt"></i>
						<p>Panel</p>
				</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/admin/account"
						class="nav-link"> <i class="nav-icon fas fa-users"></i></i>
							<p>Kullanıcı Yönetimi</p>
					</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/admin/category"
						class="nav-link"> <i class="nav-icon fas fa-th-list"></i>
							<p>Kategori Yönetimi</p>
					</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/admin/advert"
						class="nav-link"> <i class="nav-icon fas fa-ad"></i>
							<p>İlan Yönetimi</p>
					</a></li>
				</sec:authorize>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/advert"
					class="nav-link"> <i class="nav-icon fas fa-ad"></i>
						<p>İlanlarım</p>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/account/profile"
					class="nav-link"> <i class=" nav-icon fas fa-inbox"></i>
						<p>Mesajlarım</p>
				</a></li>

				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/admin/account/profile"
					class="nav-link"> <i class="nav-icon fas fa-user"></i>
						<p>Profilim</p>
				</a></li>

				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/uye/process-logout"
					class="nav-link"><i class="nav-icon fas fa-power-off"></i>
						<p>Çıkış</p></a></li>
			</ul>

			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Control sidebar content goes here -->
</aside>