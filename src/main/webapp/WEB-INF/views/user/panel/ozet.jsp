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
<div class="row">
	<div class="invoice p-3 mb-3">
		<!-- title row -->
		<div class="row">
			<div class="col-12">
				<h4>
					<a href="${pageContext.request.contextPath}/advert/details/${last_advert.id}"
						class="text-secondary">
						${last_advert.baslik}
						<small class="float-right">${toplamFiyat}</small>
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
							class="text-center">
							<c:if test="${photo.name eq null}">
								<img src="${pageContext.request.contextPath}/uploads/no_image.jpg" id="advert-image"
									class="img-fluid">
							</c:if>
							<c:if test="${photo.name eq 'no_image.jpg'}">
								<img src="${pageContext.request.contextPath}/uploads/${photo.name}" id="advert-image"
									class="img-fluid">
							</c:if>
							<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
								<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
									id="advert-image" class="img-fluid">
							</c:if>
						</a>
					</div>
				</address>
			</div>
			<!-- /.col -->
			<div class="col-sm-4 invoice-col">
				<address>
					${last_advert.category.name}<i
						class="fas fa-caret-right mx-1"></i>${last_advert.category.tips.get(0).name}<br>
					<button type="button" class="btn btn-light" data-container="body" data-toggle="popover"
						data-placement="bottom" data-content="Görüntülenme Sayısı">
						<i class="far fa-eye"></i>${totalViewCount}
					</button>
					<button type="button" class="btn btn-light" data-container="body" data-toggle="popover"
						data-placement="bottom" data-content="Favori Sayısı">
						<i class="far fa-star"></i>${last_advert.likes.size()}
					</button>

					<br>

					795 Folsom Ave, Suite 600<br>
					San Francisco, CA 94107<br>
					Phone: (555) 539-1037<br>
					Email: john.doe@example.com
				</address>
			</div>
			<!-- /.col -->
			<div class="col-sm-4 invoice-col">
				<b>Invoice #007612</b><br>
				<br>
				<b>Order ID:</b> 4F3S8J<br>
				<b>Payment Due:</b> 2/22/2014<br>
				<b>Account:</b> 968-34567
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

		<!-- Table row -->
		<div class="row">
			<div class="col-12 table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Qty</th>
							<th>Product</th>
							<th>Serial #</th>
							<th>Description</th>
							<th>Subtotal</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Call of Duty</td>
							<td>455-981-221</td>
							<td>El snort testosterone trophy driving gloves handsome</td>
							<td>$64.50</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Need for Speed IV</td>
							<td>247-925-726</td>
							<td>Wes Anderson umami biodiesel</td>
							<td>$50.00</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Monsters DVD</td>
							<td>735-845-642</td>
							<td>Terry Richardson helvetica tousled street art master</td>
							<td>$10.70</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Grown Ups Blue Ray</td>
							<td>422-568-642</td>
							<td>Tousled lomo letterpress</td>
							<td>$25.99</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

		<div class="row">
			<!-- accepted payments column -->
			<div class="col-6">
				<p class="lead">Payment Methods:</p>
				<img src="../../dist/img/credit/visa.png" alt="Visa">
				<img src="../../dist/img/credit/mastercard.png" alt="Mastercard">
				<img src="../../dist/img/credit/american-express.png" alt="American Express">
				<img src="../../dist/img/credit/paypal2.png" alt="Paypal">

				<p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
					Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem
					plugg
					dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
				</p>
			</div>
			<!-- /.col -->
			<div class="col-6">
				<p class="lead">Amount Due 2/22/2014</p>

				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<th style="width:50%">Subtotal:</th>
								<td>$250.30</td>
							</tr>
							<tr>
								<th>Tax (9.3%)</th>
								<td>$10.34</td>
							</tr>
							<tr>
								<th>Shipping:</th>
								<td>$5.80</td>
							</tr>
							<tr>
								<th>Total:</th>
								<td>$265.24</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

		<!-- this row will not appear when printing -->
		<div class="row no-print">
			<div class="col-12">
				<a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fas fa-print"></i>
					Print</a>
				<button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Submit
					Payment
				</button>
				<button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
					<i class="fas fa-download"></i> Generate PDF
				</button>
			</div>
		</div>
	</div>

	<!-- LINE CHART -->
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