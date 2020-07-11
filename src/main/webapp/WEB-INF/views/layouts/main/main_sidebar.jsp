<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="sidebar">
	<!-- Sidebar user (optional) -->
	<sec:authorize access="isAuthenticated()">
		<div class="user-panel mt-2">
			<button class="btn-block p-0" data-toggle="collapse" aria-expanded="false" data-target="#userControls"
				aria-expanded="false" aria-controls="userControls">
				<img src="${pageContext.request.contextPath}/resources/assets/images/user.png"
					class="img-circle elevation-2 mr-2" alt="User Image">Admin
				</a>
				<div class="collapse" id="userControls">
					<div class="bg-olive">
						<ul class="nav nav-pills nav-sidebar flex-column">
							<li>
								<a href="${pageContext.request.contextPath}/user/dashboard"
									class="dropdown-item border-bottom bg-olive">Panel</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user/account/profile"
									class="dropdown-item border-bottom bg-olive"><i
										class="fa fa-user m-0 mr-2"></i>Profil</a>

							</li>
							<li>
								<a class="dropdown-item bg-olive"
									href="${pageContext.request.contextPath}/uye/process-logout">
									<i class="fa fa-power-off m-0 mr-2"></i>Çıkış
								</a>
							</li>
						</ul>
					</div>
				</div>
		</div>
		<div class="user-panel mt-2">
			<a class="btn-block p-0 btn btn-outline-secondary btn-round bg-olive"
				href="${pageContext.request.contextPath}/admin/advert/add">İlan ver</a>
		</div>
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
		<div class="user-panel mt-2">
			<a class="btn-block p-0 btn btn-outline-secondary btn-round bg-olive"
				href="${pageContext.request.contextPath}/uye">Giriş Yap</a>
		</div>
		<div class="user-panel mt-2">
			<a class="btn-block p-0 btn btn-outline-secondary btn-round bg-olive"
				href="${pageContext.request.contextPath}/admin/advert/add">İlan ver</a>
		</div>
	</sec:authorize>
	<!-- Sidebar Menu -->
	<nav class="mt-2">
		<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
			<!--ANA KATEGORİ-->
			<c:if test="${isMain}">
				<c:forEach var="c" items="${parentCategories}">
					<li class="nav-item has-treeview menu-open">
						<a href="#" class="nav-link">
							<i class="nav-icon fas fa-tachometer-alt"></i>
							<p>
								${c.name}
								<i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview" >
							<c:forEach var="c_sub1" items="${c.subCategories}">
								<li class="nav-item">
									<a href='${pageContext.request.contextPath}/category/${c_sub1.id}/adverts'
										class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>${c_sub1.name}</p>
										<span
											class="badge badge-secondary text-white float-right">${c_sub1.adverts.size()}</span>
									</a>
								</li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</c:if>
			<!--ANA KATEGORİ-->
			<!--ALT KATEGORİ(Alt kategoriye sahip)-->
			<c:if test="${isHaveSub}">
				<li class="nav-item has-treeview menu-open">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							${categories[0].parentCategory.name}
							<i class="right fas fa-angle-left"></i>
						</p>
					</a>
					<ul class="nav nav-treeview ">
						<c:forEach var="c" items="${categories}">
							<li class="nav-item">
								<a href='${pageContext.request.contextPath}/category/${c.id}/adverts' class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>${c.name}</p>
									<span
										class="badge badge-secondary text-white float-right">${c.adverts.size()}</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</li>
			</c:if>
			<!--ALT KATEGORİ(Alt kategoriye sahip)-->
			<!--EN ALT KATEGORİ-->
			<c:if test="${isSub}">
				<li class="nav-item has-treeview menu-open">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							${category.name}
							<i class="right fas fa-angle-left"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<c:forEach var="t" items="${category.tips}">
							<c:if test="${t.id == tip.id}">
								<li class="nav-item">
									<a href='${pageContext.request.contextPath}/tip/${t.id}/adverts'
										class="nav-link active">
										<i class="far fa-circle nav-icon"></i>
										<p>${c.name}${t.name}</p>
									</a>
								</li>
							</c:if>
							<c:if test="${t.id != tip.id}">
								<li class="nav-item">
									<a href='${pageContext.request.contextPath}/tip/${t.id}/adverts' class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>${c.name}${t.name}</p>
									</a>
								</li>
							</c:if>

						</c:forEach>
					</ul>
				</li>
			</c:if>
			<!--EN ALT KATEGORİ-->
			<!--TIP
			<c:if test="${isTip}">
				<li class="nav-item has-treeview">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							${tip.name}
							<i class="right fas fa-angle-left"></i>
						</p>
					</a>
				</li>
			</c:if>
			TIP-->


		</ul>
	</nav>
	<!-- /.sidebar-menu -->
</div>