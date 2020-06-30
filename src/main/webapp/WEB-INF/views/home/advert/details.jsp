<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="br" uri="http://localhost:8080/alsat/tags/breadcrumb"%>

<c:set var="mainPhoto"
	value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}"></c:set>
<br:breadcrumb category="${advert.category}" />
<div class="product-details">
	<div class="row" style="margin-left: 1rem; margin-right: 1rem;">
		<div style="float: left">
			<h4>${advert.baslik }</h4>
		</div>
		<div style="float: right">
			<h5>
				<a href="#"> <span class="glyphicon glyphicon-star"
					aria-hidden="true"></span>Favori İlanlarıma Ekle
				</a>
			</h5>
		</div>
	</div>

	<!--advert-details-->
	<div class="col-sm-5">
		<div class="view-product">
			<ul id="imageGallery">
				<c:forEach var="photo" items="${advert.photos}">
					<c:if test="${photo.name eq null}">
						<li
							data-thumb="${pageContext.request.contextPath}/uploads/no_image.jpg"
							data-src="${pageContext.request.contextPath}/uploads/no_image.jpg">
							<img
							src="${pageContext.request.contextPath}/uploads/no_image.jpg">

						</li>
					</c:if>
					<c:if test="${photo.name eq 'no_image.jpg'}">
						<li
							data-thumb="${pageContext.request.contextPath}/uploads/${photo.name}"
							data-src="${pageContext.request.contextPath}/uploads/${photo.name}">
							<img
							src="${pageContext.request.contextPath}/uploads/${photo.name}">
						</li>
					</c:if>
					<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
						<li
							data-thumb="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
							data-src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}">
							<img
							src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}">
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>

	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title" style="font-size: 20;">${advert.toplamFiyat}&nbsp;₺</h2>
			</div>
			<div class="panel-body">

				<div class="row" style="margin: 1rem">
					<div style="float: left">
						<b>İlan No</b>
					</div>
					<div style="float: right">${advert.id}</div>
				</div>
				<div class="row" style="margin: 1rem">
					<div style="float: left">
						<b>İlan Tarihi</b>
					</div>
					<div style="float: right">${advert.createdAt}</div>
				</div>
				<div class="row" style="margin: 1rem">
					<div style="float: left">
						<b>Kategori</b>
					</div>
					<div style="float: right">${advert.category.name }</div>
				</div>
				<div class="row" style="margin: 1rem">
					<div style="float: left">
						<b>Toplu Satış mı</b>
					</div>
					<div style="float: right">
						<c:if test="${advert.topluSatis eq true}">Evet</c:if>
						<c:if test="${advert.topluSatis eq false}">Hayır</c:if>
						<c:if test="${advert.topluSatis eq null}">Belirtilmemiş</c:if>
					</div>
				</div>
				<div class="row" style="margin: 1rem">
					<div style="float: left">
						<b>Kimden</b>
					</div>
					<div style="float: right">${advert.account.fullName}</div>
				</div>

			</div>

		</div>

		<!--/product-information-->
	</div>
	<div class="card col-sm-3" id="advert_user_card">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title" style="font-size: 20">${advert.account.fullName }</h3>
			</div>
			<div class="panel-body">
				<h3 class="text-center">
					<c:if
						test="${!advert.account.phone.isEmpty() or advert.account.phone ne null }">
						<span class="badge" style="font-size: 18;">${advert.account.phone}</span>
					</c:if>
					<c:if
						test="${advert.account.phone.isEmpty()  or advert.account.phone eq null }">
						<span class="badge" style="font-size: 18;">${advert.account.mail}</span>
					</c:if>
				</h3>

				<h3 class="text-center">
					<a href="#" style="font-size: 11">Kullanıcıya Mesaj At</a>
				</h3>

			</div>
			<div class="panel-footer text-center">
				<a href="#" style="font-size: 11">Tüm İlanları</a> <span
					class="badge" style="margin-left: 1rem; margin-right: 1rem;">
				</span> <a href="#" style="font-size: 11">Favori Satıcılarıma Ekle</a>
			</div>
		</div>

	</div>
</div>
<div>
	<div class="category-tab shop-details-tab">
		<!--category-tab-->
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#details" data-toggle="tab">Açıklama</a></li>
				<li><a href="#companyprofile" data-toggle="tab">Detaylar</a></li>
				<li><a href="#tag" data-toggle="tab">Tag</a></li>
				<li><a href="#reviews" data-toggle="tab">Reviews </a></li>
			</ul>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade active in" id="details">
				${advert.aciklama}</div>
			<div class="tab-pane fade" id="companyprofile"></div>

			<div class="tab-pane fade" id="tag"></div>

			<div class="tab-pane fade" id="reviews"></div>
		</div>

	</div>
</div>



<!--/product-details-->


<!--/category-tab-->