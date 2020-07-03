<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="card sidebar-menu mb-4">
	<div class="card-header">
		<h3 class="h4 card-title">Categories</h3>
	</div>
	<div class="card-body" id="sidebar-body">
		<c:forEach var="c" items="${parentCategories}">
			<c:if test="${c.subCategories != null}">
				<ul class="nav nav-pills flex-column category-menu">
					<li><a href="#" onclick="location.href='${pageContext.request.contextPath}/category/${c.id}'"
							class="nav-link">${c.name}
							<span class="badge badge-secondary">42</span></a>
						<c:forEach var="c_sub1" items="${c.subCategories}">
							<ul class="list-unstyled">
								<li><a href="#"
										onclick="location.href='${pageContext.request.contextPath}/category/${c.id}'"
										class="nav-link">${c_sub1.name}</a></li>
							</ul>
						</c:forEach>

				</ul>
			</c:if>

			<c:if test="${c.subCategories==null}">
				<a href="#" onclick="location.href='${pageContext.request.contextPath}/${c.id}'"
					class="nav-link">${c.name}
					<span class="badge badge-secondary">42</span></a>
			</c:if>
		</c:forEach>
	</div>
</div>
<div class="card sidebar-menu mb-4">
	<div class="card-header">
		<h3 class="h4 card-title">Brands </h3>
	</div>
</div>
<div class="banner"><a href="#"><img src="${pageContext.request.contextPath}/uploads/no_image.jpg"
			class="img-fluid">Reklam</a>
		</div>