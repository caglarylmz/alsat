<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="features_items">
	<!--features_items-->
	<h2 class="title text-center">Öne Çıkan İlanlar</h2>

	<c:forEach var="advert" items="${latestAdverts}">
		<c:set var="photo"
			value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}"></c:set>
		<div class="col-sm-4 col-md-3">
			<div class="product-image-wrapper">
				<div class="single-products">
					<div class="productinfo text-center">
						<a
							href="${pageContext.request.contextPath}/advert/details/${advert.id}">
							<c:if test="${photo.name eq null}">
								<img
									src="${pageContext.request.contextPath}/uploads/no_image.jpg"
									height="120" width="100" style="object-fit: contain;">
							</c:if> <c:if test="${photo.name eq 'no_image.jpg'}">
								<img
									src="${pageContext.request.contextPath}/uploads/${photo.name}"
									height="120" width="100" style="object-fit: contain;">
							</c:if> <c:if
								test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
								<img
									src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
									height="120" width="100" style="object-fit: contain;">
							</c:if>
						</a>
						<p>advert.title</p>
					</div>

				</div>
				<div class="choose">
					<ul class="nav nav-pills nav-justified">
						<li><a href="#"><i class="fa fa-plus-square"></i>Faveorilere
								Ekle</a></li>
						<li><a
							href="${pageContext.request.contextPath}/advert/details/${advert.id}"><i
								class="fa fa-plus-square"></i>İlanı İncele</a></li>
					</ul>
				</div>
			</div>
		</div>
	</c:forEach>

</div>