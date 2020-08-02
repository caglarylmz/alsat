<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-12">
		<h3>Favori Listem</h3>
	</div>
</div>

<!--LATEST ADVERT-->
<c:if test="${!user_adverts.isEmpty()}">
	<div class="row">
		<div class="card">
			<!--CARD HEADER-->
			<div class="card-header">
				<div class="row">
					<div class="col-12">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="İlan No veya Kelime İle Ara"
								aria-label="Ara">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button">Ara</button>
							</div>
						</div>
					</div>
					<div class="col-12">
						<address class="float-left">Toplam ${user_adverts.size()} adet favori ilanınız bulunmaktadır
						</address>

						<div class="float-right">
							<select class="form-control" id="exampleFormControlSelect1">
								<option>İlan Tarihine Göre (Artan)</option>
								<option>İlan Tarihine Göre (Azalan)</option>
								<option>Fiyata Göre (Artan)</option>
								<option>Fiyata Göre (Azalan)</option>
								<option>Bildirime Göre</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!--CARD HEADER-->
			<!--Advert TABLE-->
			<div class="card-body">
				<c:forEach var="a" items="${user_adverts}">
					<c:if test="${a.status}">
						<fmt:formatNumber var="toplamFiyat" maxFractionDigits="0" type="currency"
							value="${a.toplamFiyat}" />
						<c:set var="mainPhoto"
							value="${a.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}" />

						<div class="invoice p-3 mb-3 advert-card">
							<!-- title row -->
							<div class="row">
								<div class="col-12">
									<h4>
										<a href="${pageContext.request.contextPath}/advert/details/${a.id}"
											class="text-secondary">
											${a.baslik}
											<span class="float-right text-danger">${toplamFiyat}</span>
										</a>
									</h4>
								</div>
								<!-- /.col -->
							</div>
							<!-- info row -->
							<div class="row invoice-info">
								<div class="col-md-3 col-sm-6 invoice-col">
									<address class="address">
										<div class="col-12 text-center">
											<a href="${pageContext.request.contextPath}/advert/details/${a.id}"
												class="text-center btn-block">
												<c:if test="${photo.name eq null}">
													<img src="${pageContext.request.contextPath}/uploads/no_image.jpg"
														alt="" id="advert-image" class="img-fluid">
												</c:if>
												<c:if test="${photo.name eq 'no_image.jpg'}">
													<img src="${pageContext.request.contextPath}/uploads/${photo.name}"
														alt="" id="advert-image" class="img-fluid">
												</c:if>
												<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
													<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
														alt="" id="advert-image" class="img-fluid">
												</c:if>

											</a>
											<span>İlan No: ${a.id}</span>
										</div>
									</address>
								</div>
								<!-- /.col -->
								<div class="col-md-5 col-sm-6 invoice-col">
									<address class="address">
										${a.category.name}<i
											class="fas fa-caret-right mx-1"></i><br><br>
										Yayınlanma Tarihi :
										<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
											value="${a.createdAt}" /><br>
										Son Yayınlanma Tarihi :
										<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
											value="${a.updatedAt}" /><br><br>
										<a class="btn-light p-1" href="#" data-container="body" data-toggle="popover"
											data-placement="bottom" data-content="Görüntülenme Sayısı">
											<i class="far fa-eye mx-1"></i>${a.views.size()}
										</a>
										<a class="btn-light p-1" href="#" data-container="body" data-toggle="popover"
											data-placement="bottom" data-content="Favori Sayısı">
											<i class="far fa-star mx-1"></i>${a.likes.size()}
										</a>
										<a class="btn-light p-1" href="#" data-container="body" data-toggle="popover"
											data-placement="bottom" data-content="Mesaj Sayısı">
											<i class="far fa-envelope mx-1"></i>${a.likes.size()}
										</a><br>
									</address>

								</div>
								<div class="col-md-4 col-sm-12 invoice-col">
									<div class="col-12">
										<button type="button" class="btn btn-secondary btn-sm float-left">
											İlanı Öne Çıkar
										</button>

										<div class="btn-group float-right" role="group">
											<button id="btnGroupDrop1" type="button"
												class="btn btn-primary btn-sm  dropdown-toggle" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												İşlemler
											</button>
											<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
												<a class="dropdown-item" href="#">Düzenle</a>
												<a class="dropdown-item" href="#">İlan Tarihi Güncelle</a>
												<a class="dropdown-item" href="#">Görüntülenme Raporu</a>
												<c:if test="${user.id eq a.account.id}">
													<a class="dropdown-item" href="#">Yayından Kaldır</a>

												</c:if>
												<a class="dropdown-item" href="#">Yayına Al</a>

												<a class="dropdown-item" href="#">İlana Not Ekle</a>

											</div>
										</div>

									</div>
								</div>
								<!-- /.col -->

							</div>
							<!-- /.row -->
						</div>
					</c:if>
				</c:forEach>
				<!--Advert TABLE-->
			</div>
		</div>
	</div>
</c:if>
<c:if test="${user_adverts.isEmpty()}">
	<div class="row">
		<div class="card">
			<!--CARD HEADER-->
			<div class="card-header">
				<div class="row">
					<div class="col-12">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="İlan No veya Kelime İle Ara"
								aria-label="Ara">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button">Ara</button>
							</div>
						</div>
					</div>
					<div class="col-12">
						<c:if test="${active}">
							<address class="float-left">Toplam ${user_adverts.size()} adet aktif ilanınız bulunmaktadır
							</address>
						</c:if>
						<c:if test="${!active}">
							<address class="float-left">Toplam ${user_adverts.size()} adet pasif ilanınız bulunmaktadır
							</address>
						</c:if>
						<div class="float-right">
							<select class="form-control" id="exampleFormControlSelect1">
								<option>İlan Tarihine Göre (Artan)</option>
								<option>İlan Tarihine Göre (Azalan)</option>
								<option>Fiyata Göre (Artan)</option>
								<option>Fiyata Göre (Azalan)</option>
								<option>Bildirime Göre</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!--CARD HEADER-->
			<div class="card-body">
				<h4>Favori ilanınız bulunmamaktadır</h4>

			</div>
		</div>
	</div>
</c:if>
<!--LATEST ADVERT-->