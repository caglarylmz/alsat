<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!--ANA KATEGORİ-->
<c:if test="${isMain}">
	<div class="card sidebar-menu mb-4">
		<ul class="nav nav-pills flex-column category-menu border-bottom">
			<li><a href="#" onclick="location.href='${pageContext.request.contextPath}/category/${c.id}/adverts'"
					class="nav-link"><span class="badge badge-primary text-light">F</span>Fiyatı Düşenler
				</a>
				<a href="#" onclick="location.href='${pageContext.request.contextPath}/category/${c.id}/adverts'"
					class="nav-link"><span class="badge badge-primary text-light">S</span>Son 24 Saat
				</a>
		</ul>
		<div class="card-body" id="sidebar-body">
			<c:forEach var="c" items="${parentCategories}">
				<c:if test="${c.subCategories != null}">
					<ul class="nav nav-pills flex-column category-menu">
						<li class="border"><a href="#"
								onclick="location.href='${pageContext.request.contextPath}/category/${c.id}/adverts'"
								class="nav-link">${c.name}
							</a>
							<c:forEach var="c_sub1" items="${c.subCategories}">
								<ul class="list-unstyled">
									<li><a href="#"
											onclick="location.href='${pageContext.request.contextPath}/category/${c_sub1.id}/adverts'"
											class="nav-link">${c_sub1.name}<span
												class="badge badge-primary text-white">${c_sub1.adverts.size()}</span></a>
									</li>
								</ul>
							</c:forEach>
						</li>
					</ul>
				</c:if>

				<c:if test="${c.subCategories==null}">
					<a href="#" onclick="location.href='${pageContext.request.contextPath}/${c.id}/adverts'"
						class="nav-link">${c.name}
						<span class="badge badge-secondary">${c.adverts.size()}</span></a>
				</c:if>
			</c:forEach>
		</div>
	</div>
</c:if>
<!--ALT KATEGORİ(Alt kategoriye sahip)-->
<c:if test="${!isMain && !isSub}">
	<div class="card sidebar-menu mb-4">
		<div class="card-header">
			<h3 class="h4 card-title">${categories[0].parentCategory.name}</h3>
		</div>
		<div class="card-body" id="sidebar-body">
			<c:forEach var="c" items="${categories}">
				<c:if test="${c.subCategories != null}">
					<ul class="nav nav-pills flex-column category-menu">
						<li><a href="#" onclick="location.href='${pageContext.request.contextPath}/category/${c.id}/adverts'"
								class="nav-link">${c.name}
							</a>
							<c:forEach var="c_sub1" items="${c.subCategories}">
								<ul class="list-unstyled">
									<li><a href="#"
											onclick="location.href='${pageContext.request.contextPath}/category/${c_sub1.id}/adverts'"
											class="nav-link">${c_sub1.name}<span
												class="badge badge-secondary">${c_sub1.adverts.size()}</span></a> </li>
								</ul>
							</c:forEach>
						</li>
					</ul>
				</c:if>

				<c:if test="${c.subCategories==null}">
					<a href="#" onclick="location.href='${pageContext.request.contextPath}/${c.id}/adverts'"
						class="nav-link">${c.name}
						<span class="badge badge-secondary">42</span></a>
				</c:if>
			</c:forEach>
		</div>
	</div>
</c:if>
<!--EN ALT KATEGORİ-->
<c:if test="${!isMain && isSub}">
	<div class="card sidebar-menu mb-4">
		<div class="card-header">
			<h3 class="h4 card-title">${category.name}</h3>
		</div>
		<div class="card-body" id="sidebar-body">
			<c:forEach var="t" items="${category.tips}">

				<ul class="nav nav-pills flex-column category-menu">
					<ul class="list-unstyled">
						<li><a href="#" onclick="location.href='${pageContext.request.contextPath}/tip/${t.id}/adverts'"
								class="nav-link">${t.name}</a> </li>
					</ul>
				</ul>

			</c:forEach>
		</div>
	</div>
</c:if>

<!--TIP-->
<c:if test="${!isMain && isSub}">
	<div class="card sidebar-menu mb-4">
		<div class="card-header">
			<h3 class="h4 card-title">${category.name}</h3>
		</div>
		<div class="card-body" id="sidebar-body">
			<c:forEach var="t" items="${category.tips}">

				<ul class="nav nav-pills flex-column category-menu">
					<ul class="list-unstyled">
						<li><a href="#" onclick="location.href='${pageContext.request.contextPath}/tip/${t.id}/adverts'"
								class="nav-link">${t.name}</a> </li>
					</ul>
				</ul>

			</c:forEach>
		</div>
	</div>
</c:if>
<div class="card sidebar-menu mb-4">
	<div class="card-header">
		<h3 class="h4 card-title">Brands </h3>
	</div>
</div>
<div class="banner"><a href="#"><img src="${pageContext.request.contextPath}/uploads/no_image.jpg"
			class="img-fluid">Reklam</a>
</div>