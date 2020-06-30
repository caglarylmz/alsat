<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
			href="#"><i class="fas fa-bars"></i></a></li>
	</ul>

	<!-- SEARCH FORM -->
	<div class="col-6">
		<form class="form ml-3 pt-2">
			<div class="input-group input-group-sm">
				<input class="form-control form-control-navbar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-navbar" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<ul class="navbar-nav ml-auto">
		<!-- User Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link"
			data-toggle="dropdown" href="#" aria-expanded="false"> <i
				class="far fa-user"></i>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header">${pageContext.request.userPrincipal.name}</span>
				
				<div class="dropdown-divider"></div>
				<a href="${pageContext.request.contextPath}/admin/account/profile"
					class="dropdown-item"> <i class="fas fa-user-cog mr-2"></i>Yönetici
					Ayarları
				</a>

				<div class="dropdown-divider"></div>
				<a href="${pageContext.request.contextPath}/login/process-logout"
					class="dropdown-item"><i
					class="fas fa-sign-out-alt mr-2"></i>Çıkış</a>
			</div></li>

	</ul>
</nav>