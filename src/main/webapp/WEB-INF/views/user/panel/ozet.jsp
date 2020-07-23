<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

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
	<div class="card bg-gradient-info">
		<div class="card-header border-0">
			<h3 class="card-title">
				<i class="fas fa-th mr-1"></i>
				Sales Graph
			</h3>

			<div class="card-tools">
				<button type="button" class="btn bg-info btn-sm" data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn bg-info btn-sm" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<div class="card-body">
			<canvas class="chart" id="line-chart"
				style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		</div>
		<!-- /.card-body -->
		<div class="card-footer bg-transparent">
			<div class="row">
				<div class="col-4 text-center">
					<input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60"
						data-fgColor="#39CCCC">

					<div class="text-white">Mail-Orders</div>
				</div>
				<!-- ./col -->
				<div class="col-4 text-center">
					<input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60"
						data-fgColor="#39CCCC">

					<div class="text-white">Online</div>
				</div>
				<!-- ./col -->
				<div class="col-4 text-center">
					<input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60"
						data-fgColor="#39CCCC">

					<div class="text-white">In-Store</div>
				</div>
				<!-- ./col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.card-footer -->
	</div>
</div>