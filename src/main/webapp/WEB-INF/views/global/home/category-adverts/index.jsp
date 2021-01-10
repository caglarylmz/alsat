<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid" id="category-adverts">

	<c:choose>
		<c:when test="${categoryAdverts.isEmpty()}">
			<div uk-filter="target: .js-filter">
				<!--HEADER-->
				<div class="uk-flex uk-column-1-2@s uk-flex-between" uk-grid>
					<!--FILTER-->

					<div class="uk-column-width-1">
						<ul class="uk-subnav uk-subnav-pill">
							<li class="uk-active" uk-filter-control><a href="#">Tüm İlanlar</a></li>
							<li uk-filter-control="[data-color='sahibinden']"><a href="#">Sahibinden</a></li>
							<li uk-filter-control="[data-color='firmadan']"><a href="#">Firmadan</a></li>
						</ul>
					</div>
					<!--FILTER-->
					<!--SHOW TYPE-->
					<div class="uk-column-width-1 text-right uk-visible@m">
						<div class="btn-group">
							<button class="uk-button-orange"><span uk-icon="grid"></span>
							</button>
							<button class="uk-button-default"><span uk-icon="list"></span>
							</button>
							<select class="custom-select">
								<option selected>Sıralama</option>
								<option value="1">&#xf151; Fiyata Göre</option>
								<option value="2">&#xf150; Fiyata Göre</option>
								<option value="3">&#xf151; Tarihe Göre</option>
								<option value="4">&#xf150; Tarihe Göre</option>
							</select>
						</div>
					</div>
					<!--SHOW TYPE-->
				</div>
				<!--HEADER-->
				<div class="uk-alert-danger" uk-alert>
					<p class="uk-text-center">Bu kategoriye ait bir ilan bulanamdı</p>
				</div>
			</div>
		</c:when>
		<c:when test="${!categoryAdverts.isEmpty()}">
			<div uk-filter="target: .js-filter">
				<!--HEADER-->
				<div class="uk-flex uk-column-1-2@s uk-flex-between" uk-grid>
					<!--FILTER-->

					<div class="uk-column-width-1">
						<ul class="uk-subnav uk-subnav-pill">
							<li class="uk-active" uk-filter-control><a href="#">Tüm İlanlar</a></li>
							<li uk-filter-control="[data-color='sahibinden']"><a href="#">Sahibinden</a></li>
							<li uk-filter-control="[data-color='firmadan']"><a href="#">Firmadan</a></li>
						</ul>
					</div>
					<!--FILTER-->
					<!--SHOW TYPE-->
					<div class="uk-column-width-1 text-right uk-visible@m">
						<div class="btn-group">
							<button class="uk-button-orange"><span uk-icon="grid"></span>
							</button>
							<button class="uk-button-default"><span uk-icon="list"></span>
							</button>
							<select class="custom-select">
								<option selected>Sıralama</option>
								<option value="1">&#xf151; Fiyata Göre</option>
								<option value="2">&#xf150; Fiyata Göre</option>
								<option value="3">&#xf151; Tarihe Göre</option>
								<option value="4">&#xf150; Tarihe Göre</option>
							</select>
						</div>
					</div>
					<!--SHOW TYPE-->
				</div>
				<!--HEADER-->
				<!--BODY-->
				<ul class="js-filter uk-child-width-1-2@m uk-text-center uk-grid-small" uk-grid>
					<!--ITEM-->
					<c:forEach var="advert" items="${categoryAdverts}">
						<c:set var="photo"
							value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}">
						</c:set>
						<fmt:formatNumber var="toplamFiyat" maxFractionDigits="0" type="currency"
							value="${advert.toplamFiyat}" />
						<li data-color="${advert.kimden}">
							<div class="uk-card uk-card-default uk-card-large">
								<div class="text-left p-1">
									<label class="label">${advert.baslik}</label>
								</div>
								<a href="${pageContext.request.contextPath}/ilan/${advert.id}">
									<div class="uk-card-body p-1">
										<div class="advert-container">
											<div class="advert-image">
												<c:if test="${photo.name eq null}">
													<img src="${pageContext.request.contextPath}/uploads/no_image.jpg"
														alt="" uk-image>

												</c:if>
												<c:if test="${photo.name eq 'no_image.jpg'}">
													<img src="${pageContext.request.contextPath}/uploads/${photo.name}"
														alt="" uk-image>

												</c:if>
												<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
													<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
														alt="" uk-image>
												</c:if>
											</div>
											<div class="advert-details p-1">
												<label class="uk-text-muted uk-text-small label"
													style="font-weight: normal;">#${advert.id}</label>
												<label class="uk-text-danger label mb-3">${toplamFiyat}</label>
												<div class="item">
													<div class="tit uk-text-truncate">İlan Tarihi</div>
													<div class="val">
														<fmt:formatDate type="date" value="${advert.createdAt}" />
													</div>
												</div>

												<div class="item">
													<div class="tit uk-text-truncate">İl</div>
													<div class="val">
														${advert.advertAdress.il}
													</div>
												</div>
												<div class="item">
													<div class="tit uk-text-truncate">İlçe</div>
													<div class="val">
														${advert.advertAdress.ilce}
													</div>
												</div>
											</div>
										</div>
									</div>
								</a>
							</div>
						</li>
					</c:forEach>
					<!--ITEM-->


				</ul>
				<!--BODY-->

			</div>
		</c:when>
		<c:otherwise>
			...
		</c:otherwise>
	</c:choose>

</div>

<style scoped>
	select {
		font-family: 'Lato', 'Font Awesome 5 Free';
		font-weight: 900;
	}

	.uk-subnav-pill>.uk-active>a {
		background-color: orange;
		color: #fff;
	}

	.uk-button-orange {
		background-color: orange;
		color: #fff;
		border: 1px solid transparent;
	}

	.label {
		margin-bottom: 0;
		margin-left: 3px;
		font-weight: 800;
		text-align: left;

	}

	.advert-container {
		display: flex;
		box-sizing: content-box;
		align-items: center;
		justify-content: center;

	}

	.advert-image {
		flex: 2;
		justify-content: center;
	}

	.advert-details {
		display: flex;
		flex: 3;
		flex-direction: column;


	}

	.advert-details .item {
		display: flex;
	}

	.advert-details .item .tit {
		flex: 1;
		text-align: left;
		padding-left: 3px;
		font-weight: 700;
		font-size: small;
	}

	.advert-details .item .val {
		flex: 1;
		text-align: left;
		font-size: small;
	}



	@media (max-width: 636px) {
		.advert-container {
			flex-direction: column;
		}

		.advert-image {
			flex: 1;
		}

		.advert-image img {
			height: 200px !important;
		}

		.advert-details {
			display: flex;
			margin: 10px;
			flex: 2;
			width: 100%;
		}

	}

	.uk-card-body {
		padding: 10px 10px;
	}

	.fontkucuk {
		font-size: smaller;
	}
</style>