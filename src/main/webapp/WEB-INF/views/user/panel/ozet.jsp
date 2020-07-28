<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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

<div class="row">
	<!-- LINE CHART -->

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