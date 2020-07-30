<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<fmt:formatNumber var="toplamFiyat" maxFractionDigits="0" type="currency" value="${last_advert.toplamFiyat}" />
<c:set var="mainPhoto"
	value="${last_advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}" />

<!--CARDS-->
<div class="row">
	<div class="col-lg-4 col-6">
		<!-- small box -->
		<div class="small-box bg-info">
			<div class="inner">
				<h3>${adverts_length}</h3>

				<p>Aktif İlan Sayısı</p>
			</div>
			<div class="icon">
				<i class="fas fa-ad"></i>
			</div>
			<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<div class="col-lg-4 col-6">
		<!-- small box -->
		<div class="small-box bg-danger">
			<div class="inner">
				<h3>65</h3>

				<p>Favori İlanlarınız</p>
			</div>
			<div class="icon">
				<i class="fas fa-heart"></i>
			</div>
			<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-4 col-6">
		<!-- small box -->
		<div class="small-box bg-secondary">
			<div class="inner">
				<h3>44</h3>

				<p>İlanlarınıza Gelen Mesajlar</p>
			</div>
			<div class="icon">
				<i class="fas fa-envelope"></i>
			</div>
			<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<!-- ./col -->

</div>
<!--CARDS-->
<!--LATEST ADVERT-->
<c:if test="${adverts_length>0}">
	<div class="row">
		<div class="card">
			<div class="card-header">
				Son Yayına Aldığım İlan
			</div>
			<div class="card-body">
				<div class="invoice p-3 mb-3">
					<!-- title row -->
					<div class="row">
						<div class="col-12">
							<h4>
								<a href="${pageContext.request.contextPath}/advert/details/${last_advert.id}"
									class="text-secondary">
									${last_advert.baslik}
									<span class="float-right text-danger">${toplamFiyat}</span>
								</a>
							</h4>
						</div>
						<!-- /.col -->
					</div>
					<!-- info row -->
					<div class="row invoice-info">
						<div class="col-2 invoice-col">
							<address>
								<div class="col-12 text-center">
									<a href="${pageContext.request.contextPath}/advert/details/${last_advert.id}"
										style="background-color: grey;" class="text-center">
										<c:if test="${photo.name eq null}">
											<img src="${pageContext.request.contextPath}/uploads/no_image.jpg"
												id="advert-image" class="img-fluid">
										</c:if>
										<c:if test="${photo.name eq 'no_image.jpg'}">
											<img src="${pageContext.request.contextPath}/uploads/${photo.name}"
												id="advert-image" class="img-fluid">
										</c:if>
										<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
											<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
												id="advert-image" class="img-fluid">
										</c:if>
										<span class="text-light">İlan No: ${last_advert.id}</span>
									</a>
								</div>
							</address>
						</div>
						<!-- /.col -->
						<div class="col-5 invoice-col">
							<address>
								${last_advert.category.name}<i
									class="fas fa-caret-right mx-1"></i>${last_advert.category.tips.get(0).name}<br><br>
								<a class="btn-light p-1" href="#" data-container="body" data-toggle="popover"
									data-placement="bottom" data-content="Görüntülenme Sayısı">
									<i class="far fa-eye mx-1"></i>${totalViewCount}
								</a>
								<a class="btn-light p-1" href="#" data-container="body" data-toggle="popover"
									data-placement="bottom" data-content="Favori Sayısı">
									<i class="far fa-star mx-1"></i>${last_advert.likes.size()}
								</a>
								<a class="btn-light p-1" href="#" data-container="body" data-toggle="popover"
									data-placement="bottom" data-content="Mesaj Sayısı">
									<i class="far fa-envelope mx-1"></i>${last_advert.likes.size()}
								</a><br>
							</address>

						</div>
						<div class="col-5 invoice-col">
							<address>
								adres <br>
								<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
									value="${last_advert.createdAt}" /><br>
								<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
									value="${last_advert.updatedAt}" /><br>
								yayından kalkacağı tarih<br>
							</address>

						</div>
						<!-- /.col -->
						<div class="col-12">
							<button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i>
								İşlemler
							</button>
							<button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
								<i class="fas fa-download"></i> Doping
							</button>
						</div>
					</div>
					<!-- /.row -->

					<!-- LINE CHART -->
					<div class="row">
						<div class="col-12">
							<div class="card bg-gradient-light">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-th mr-1"></i>
										Son İlana Ait Görüntülenme Sayıları
									</h3>


								</div>
								<div class="card-body">
									<div class="chart">
										<canvas id="line-chart"
											style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
									</div>
								</div>
							</div>
							<!-- /.card-footer -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${adverts_length==0}">
	<div class="row">
		<div class="card">
			<div class="card-header">
				Son Yayına Aldığım İlan
			</div>
			<div class="card-body">
				<h4>Yayında olan aktif bir ilan bulunmamaktadır</h4>
			</div>
		</div>
	</div>
</c:if>
<!--LATEST ADVERT-->