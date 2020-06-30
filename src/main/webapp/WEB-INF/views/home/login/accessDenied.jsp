<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<div class="container">
	<div class="row text-center">
		<div class="error-page">
			<span class="glyphicon glyphicon-warning-sign fa-4x" style="color: red"></span>

			<div class="col-12">

				<div class="row">
					<div class="col-12 text-center">
						<h2 class="text-danger">500 Yetki Hatası</h2>
						<h5 class="error-page-bottom-text">${msg}</h5>

					</div>
					<div class="col-12 text-center">
						<a href="#" onclick="history.back()" class="btn btn-primary">Return
							Back</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>