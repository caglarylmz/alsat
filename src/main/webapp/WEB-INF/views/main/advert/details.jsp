<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="br" uri="http://localhost:8080/alsat/tags/breadcrumb"%>

<c:set var="mainPhoto" value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}">
</c:set>
<div class="card card-solid">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Ana Sayfa</a></li>
			<li class="breadcrumb-item active"><a
					href="${pageContext.request.contextPath}/category/${advert.category.parentCategory.id}/adverts">${advert.category.parentCategory.name}</a>
			</li>
			<li class="breadcrumb-item active"><a
					href="${pageContext.request.contextPath}/category/${advert.category.id}/adverts">${advert.category.name}</a>
			</li>
		</ol>
	</nav>
	<div class="card-header">
		${advert.baslik}

	</div>
	<div class="card-body">
		<div class="row">
			<!--CAROUSEL-->
			<div class="col-12 col-md-5">
				<div class="view-product">
					<c:if test="${advert.photos eq null or advert.photos.size()==0 }">
						<ul id="imageGallery">
							<li data-thumb="${pageContext.request.contextPath}/uploads/no_image.jpg"
								data-src="${pageContext.request.contextPath}/uploads/no_image.jpg">
								<img src="${pageContext.request.contextPath}/uploads/no_image.jpg">
							</li>
						</ul>
					</c:if>
					<ul id="imageGallery">
						<c:forEach var="photo" items="${advert.photos}">
							<c:if test="${photo.name eq null}">
								<li data-thumb="${pageContext.request.contextPath}/uploads/no_image.jpg"
									data-src="${pageContext.request.contextPath}/uploads/no_image.jpg">
									<img src="${pageContext.request.contextPath}/uploads/no_image.jpg">

								</li>
							</c:if>
							<c:if test="${photo.name eq 'no_image.jpg'}">
								<li data-thumb="${pageContext.request.contextPath}/uploads/${photo.name}"
									data-src="${pageContext.request.contextPath}/uploads/${photo.name}">
									<img src="${pageContext.request.contextPath}/uploads/${photo.name}">
								</li>
							</c:if>
							<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
								<li data-thumb="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
									data-src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}">
									<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}">
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!--CAROUSEL-->
			<!--ADVERT DETAIL-->
			<div class="col-12 col-md-4">
				<div class="bg-gray py-2 px-3">
					<h2 class="mb-0"> ${advert.toplamFiyat} ₺ </h2>
				</div>
				<ul class="list-group list-group-unbordered mb-3">
					<li class="list-group-item">
						<b class="text-dark ml-3">İlan No</b> <a class="text-dark float-right mr-3">${advert.id}</a>
					</li>
					<li class="list-group-item">
						<b class="text-dark ml-3">İlan Tarihi</b> <a class="text-dark float-right mr-3">
							<fmt:formatDate type="date" value="${advert.createdAt}" />
						</a>
					</li>
					<li class="list-group-item">
						<b class="text-dark ml-3">İlan Kategori</b> <a
							class="text-dark float-right mr-3">${advert.category.name}</a>
					</li>
					<li class="list-group-item">
						<b class="text-dark ml-3">Toplam Hayvan Adedi</b> <a
							class="text-dark float-right mr-3">${advert.toplamAdet}</a>
					</li>
					<li class="list-group-item">
						<b class="text-dark ml-3">Kimden</b> <a class="text-dark float-right mr-3">${advert.kimden}</a>
					</li>
				</ul>

			</div>
			<div class="col-12 col-md-3">
				<div class="card card-widget widget-user-2">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-warning">
						<h3 class="widget-user-username">${advert.account.fullName}</h3>
						<h5 class="widget-user-desc">${advert.account.phone}</h5>

					</div>
					<div class="card-body p-0">
						<ul class="nav flex-column">
							<li class="nav-item bg-light">
								<button class="btn-block btn-danger">Favori Satıcılarıma Ekle</button>
							</li>
						</ul>
						<ul class="nav flex-column">
							<li class="nav-item">
								<button class="btn-block btn-info">İlan Sahibine Soru Sor</button>
							</li>
						</ul>
					</div>
					<div class="card-footer p-0">
						<ul class="nav flex-column">
							<li class="nav-item">
								<a href="#" class="nav-link">
									Tüm İlanları <span class="float-right badge bg-primary">31</span>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									Üyelik Tarihi <span class="float-right badge bg-info">
										<fmt:formatDate type="date" value="${advert.account.createdAt}" /></span>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									Güvenilirlik <span class="float-right badge bg-success">* * * * *</span>
								</a>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<nav class="w-100">
				<div class="nav nav-tabs" id="product-tab" role="tablist">
					<a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc"
						role="tab" aria-controls="product-desc" aria-selected="true">İlan Detayı</a>
					<a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments"
						role="tab" aria-controls="product-comments" aria-selected="false">Comments</a>
					<a class="nav-item nav-link" id="product-rating-tab" data-toggle="tab" href="#product-rating"
						role="tab" aria-controls="product-rating" aria-selected="false">Rating</a>
				</div>
			</nav>
			<div class="tab-content p-3" id="nav-tabContent">
				<div class="tab-pane fade active show" id="product-desc" role="tabpanel"
					aria-labelledby="product-desc-tab">
					<table class="table table-striped">
						<thead>

							<tr>
								<th style="width: 1%">
									#
								</th>
								<th style="width: 20%">
									Tip
								</th>							
								<th style="width: 30%">
									Adet
								</th>
								<th>
									Fiyat
								</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="detail" items="${advert.advertDetails}">
								<tr>
									<td>
										#
									</td>
									<td>
										<a>
											${detail.tip.name}
										</a>
										<br>

									</td>
									
									<td>
										<a>
											${detail.adet}
										</a>
										<br>

									</td>
									<td>
										<a>
											${detail.fiyat}
										</a>
										<br>

									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
				<div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">
					Vivamus rhoncus nisl sed venenatis luctus. Sed condimentum risus ut tortor feugiat laoreet.
					Suspendisse potenti. Donec et finibus sem, ut commodo lectus. Cras eget neque dignissim, placerat
					orci interdum, venenatis odio. Nulla turpis elit, consequat eu eros ac, consectetur fringilla urna.
					Duis gravida ex pulvinar mauris ornare, eget porttitor enim vulputate. Mauris hendrerit, massa nec
					aliquam cursus, ex elit euismod lorem, vehicula rhoncus nisl dui sit amet eros. Nulla turpis lorem,
					dignissim a sapien eget, ultrices venenatis dolor. Curabitur vel turpis at magna elementum hendrerit
					vel id dui. Curabitur a ex ullamcorper, ornare velit vel, tincidunt ipsum. </div>
				<div class="tab-pane fade" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab">
					Cras ut ipsum ornare, aliquam ipsum non, posuere elit. In hac habitasse platea dictumst. Aenean
					elementum leo augue, id fermentum risus efficitur vel. Nulla iaculis malesuada scelerisque. Praesent
					vel ipsum felis. Ut molestie, purus aliquam placerat sollicitudin, mi ligula euismod neque, non
					bibendum nibh neque et erat. Etiam dignissim aliquam ligula, aliquet feugiat nibh rhoncus ut.
					Aliquam efficitur lacinia lacinia. Morbi ac molestie lectus, vitae hendrerit nisl. Nullam metus
					odio, malesuada in vehicula at, consectetur nec justo. Quisque suscipit odio velit, at accumsan urna
					vestibulum a. Proin dictum, urna ut varius consectetur, sapien justo porta lectus, at mollis nisi
					orci et nulla. Donec pellentesque tortor vel nisl commodo ullamcorper. Donec varius massa at semper
					posuere. Integer finibus orci vitae vehicula placerat. </div>
			</div>
		</div>
	</div>
</div>