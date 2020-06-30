<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">İlan Ekle</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/dashboard"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item active">İlan Ekle</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /.content-header -->
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<div class="progress" style="height: 30px;">
					<div class="progress-bar bg-info" role="
						progressbar"
						style="width: 75%;" id="progressbar">
						<b class="lead" id="progressText">Step-3</b>
					</div>
				</div>
			</div>
			<div class="card-body">
				<!-- form start -->
				<s:form method="post" modelAttribute="advert"
					action="${pageContext.request.contextPath}/admin/advert/add-detail"
					id="addAdvertForm">
					<h5 class="text-center text-light bg-secondary mb-2 p-2 rounded">İlan
						Bilgileri</h5>
					<div id="accordion">

						<c:forEach var="i" begin="1" end="${advert.toplamAdet}">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapse${i}"> ${i}. Hayvan Bilgileri </a>
									</h5>
								</div>
								<div id="collapse${i}" class="panel-collapse collapse in">
									<div class="card-body">
										<div class="form-group">
											<label for="advertDetails[${i}].tur">Hayvanın Türü</label>
											<s:select path="advertDetails[${i}].tur"
												cssClass="form-control" required="required">
												<c:forEach var="item" items="${turTypes}">
													<option value="${item}">${item.tur}</option>
												</c:forEach>
											</s:select>
										</div>
										<div class="form-group">
											<label for="advertDetails[${i}].irk">Hayvanın Irkı</label>
											<s:select path="advertDetails[0].irk" cssClass="form-control">
												<c:forEach var="item" items="${irkTypes}">
													<option value="${item}">${item.irk}</option>
												</c:forEach>
											</s:select>
										</div>
										<div class="form-group">
											<label for="advertDetails[${i}].yas">Hayvanın Yaşı</label>
											<s:select path="advertDetails[${i}].yas"
												cssClass="form-control">
												<c:forEach var="item" items="${yasTypes}">
													<option value="${item}">${item.yas}</option>
												</c:forEach>
											</s:select>
										</div>
										<div class="form-group">
											<label for="advertDetails[${i}].adet">Hayvan Adedi</label>
											<s:input path="advertDetails[${i}].adet"
												cssClass="form-control" type="number" required="required" />

										</div>
										<div class="form-group">
											<label for="advertDetails[${i}].fiyat">Bir hayvanını
												fiyatı(₺)</label>
											<s:input path="advertDetails[${i}].fiyat"
												cssClass="form-control" type="number" required="required" />

										</div>
									</div>
								</div>
							</div>

						</c:forEach>
						<!-- ./end of accordion -->
					</div>
					<div class="form-footer float-right">
						<button type="button" class="btn btn-warning"
							onclick="history.back()">Geri</button>
						<button type="submit" class="btn btn-primary">Kaydet</button>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>



<!-- /.card -->