<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="br" uri="http://localhost:8080/alsat/tags/breadcrumb"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<c:set var="mainPhoto" value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}" />
<fmt:formatNumber var="toplamFiyat" maxFractionDigits="0" type="currency" value="${advert.toplamFiyat}" />

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
		<div class="row">
			<div class="col-8">
				<a class="nav-link">
					<b>${advert.baslik} </b>
				</a>
			</div>
			<div class="col-4">
				<c:if test="${!isLiked}">
					<s:form method="post" modelAttribute="advert"
						action="${pageContext.request.contextPath}/user/advert/addFavourites">

						<button type="submit" class="btn btn-sm btn-outline-danger float-right nav-link">
							<i class="far fa-heart"></i> Favori İlanlarıma Ekle
						</button>
						<s:hidden path="id" />
					</s:form>

				</c:if>
				<c:if test="${isLiked}">
					<s:form method="post" modelAttribute="advert"
						action="${pageContext.request.contextPath}/user/advert/removeFavourites">
						<button type="submit" class="btn btn-sm btn-danger float-right nav-link">
							<i class="far fa-heart"></i> Favori İlanlarımdan Çıkar
						</button>
						<s:hidden path="id" />
					</s:form>
				</c:if>

			</div>
		</div>



	</div>
	<div class="card-body">
		<div class="row">
			<!--CAROUSEL-->
			<div class="col-12 col-lg-5">
				<div class="view-product text-center">
					<c:if test="${advert.photos eq null or advert.photos.isEmpty()}">
						<img src="${pageContext.request.contextPath}/uploads/no_image.jpg" style="width: fit-content;">
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
			<div class="col-12 col-lg-7">
				<div class="row">
					<!--DETAIL-->
					<div class="col-12 col-sm-7">
						<div class="bg-gray py-2 px-3">
							<h4 class="mb-0">
								${toplamFiyat}</h4>
						</div>
						<ul class="list-group list-group-unbordered mb-3">
							<li class="list-group-item">
								<b class="text-dark ml-3">İlan No</b> <a
									class="text-dark float-right mr-3">${advert.id}</a>
							</li>
							<li class="list-group-item">
								<b class="text-dark ml-3">İlan Tarihi</b> <a class="text-dark float-right mr-3">
									<fmt:formatDate type="date" value="${advert.createdAt}" />
								</a>
							</li>
							<li class="list-group-item">
								<b class="text-dark ml-3">Kategori</b> <a
									class="text-dark float-right mr-3">${advert.category.name}</a>
							</li>
							<li class="list-group-item">
								<b class="text-dark ml-3">Toplam Hayvan Adedi</b> <a
									class="text-dark float-right mr-3">${advert.toplamAdet}</a>
							</li>
							<li class="list-group-item">
								<b class="text-dark ml-3">Kimden</b> <a
									class="text-dark float-right mr-3">${advert.kimden}</a>
							</li>
						</ul>

					</div>
					<!--DETAIL-->
					<!--User Card-->
					<div class="col-5 d-none d-sm-block" id="advert-user-card">
						<div class="widget-user-header bg-gray ">
							<h4 class="widget-user-username py-2 px-3">${advert.account.fullName}</h4>

						</div>
						<div class="info-box">
							<span class="info-box-icon bg-info text-center"><i class="fas fa-envelope"></i></span>

							<div class="info-box-content">
								<span class="info-box-number">${advert.account.email}</span>
							</div>
							<!-- /.info-box-content -->
						</div>

						<c:if test="${advert.account.phone!=null}">
							<div class="info-box">
								<span class="info-box-icon bg-info text-center"><i class="fas fa-phone"></i></span>

								<div class="info-box-content">
									<span class="info-box-number">${advert.account.phone}</span>
								</div>
								<!-- /.info-box-content -->
							</div>
						</c:if>
						<div class="card-body p-0">
							<ul class="nav flex-column">
								<li class="nav-item">
									<a class="nav-link "><b>
											Tüm İlanları</b> <span
											class="float-right badge bg-gray">${advert.account.adverts.size()}</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link">
										<b>Üyelik Tarihi </b><span class="float-right badge bg-gray">
											<fmt:formatDate type="date" value="${advert.account.createdAt}" />
										</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link">
										<b>Güvenilirlik</b>
										<span class="badge  bg-gray float-right rating">
											<i class="fa fa-star checked" id="one"></i>
											<i class="fa fa-star checked" id="two"></i>
											<i class="fa fa-star checked" id="three"></i>
											<i class="fa fa-star unchecked" id="four"></i>
											<i class="fa fa-star unchecked" id="five"></i>
										</span>

									</a>
								</li>

							</ul>
						</div>
						<div class="card-footer p-0 my-1">
							<div class="row">
								<div class="col-12 mb-1">
									<button type="button" class="btn btn-block btn-sm btn-outline-danger" id="btn-user">
										<i class="far fa-heart"></i> Favori Satıcılara ekle
									</button>
								</div>

								<div class="col-12">
									<button type="button" class="btn btn-block btn-sm btn-outline-info" id="btn-user">
										<i class="fas fa-envelope "></i> İlan Sahibine Soru Sor
									</button>
								</div>

							</div>

						</div>
					</div>
					<!--User Card-->
				</div>

			</div>
			<!--ADVERT DETAIL-->

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
			<div class="tab-content p-3 w-100" id="nav-tabContent">

				<div class="tab-pane fade active show" id="product-desc" role="tabpanel"
					aria-labelledby="product-desc-tab">
					<div class="row w-100">
						<div class="col-md-6 float-left">
							<p>
								<address> ${advert.aciklama}</address>
							</p>
						</div>
						<div class="col-md-6  float-right">
							<table class="table table-striped">
								<thead>
									<tr>
										<th style="width: 100%">
											Tip
										</th>
										<th style="width: 50%">
											Adet
										</th>
										<th style="width: 50%">
											Yaş
										</th>
										<th>
											Adet Fiyatı
										</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="detail" items="${advert.advertDetails}">
										<tr>
											<td>
												<a>
													${detail.tip.name}
												</a>

											</td>
											<td>
												<a>
													${detail.adet}
												</a>

											</td>
											<td>
												<a>
													${detail.yas.name}
												</a>
											</td>
											<td>
												<a>
													<fmt:formatNumber maxFractionDigits="0" type="currency"
														value="${detail.fiyat}" />
												</a>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>

						</div>
					</div>
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