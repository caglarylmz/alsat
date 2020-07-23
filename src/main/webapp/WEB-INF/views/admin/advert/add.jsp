<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						href="${pageContext.request.contextPath}/admin/panel"><i
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

<c:if test="${errorMessage!=null }">
	<div class="alert alert-danger alert-dismissible">${errorMessage}
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
</c:if>
<c:if test="${successMessage!=null }">
	<div class="alert alert-success alert-dismissible">${successMessage}
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
</c:if>
<div class="row">

	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<div class="progress" id="progress" style="height: 30px;">
					<div class="progress-bar bg-gradient-success"
						role="
						progressbar" style="width: 20%;" id="progressbar">
						<b class="lead" id="progressText">Kategori Seçimi</b>
					</div>
				</div>
			</div>
			<div class="card-body">
				<!-- form start -->
				<s:form method="post" modelAttribute="advert"
					action="${pageContext.request.contextPath}/admin/advert/add"
					id="addAdvertForm" enctype="multipart/form-data">
					<div id="step-1">
						<b class="form-text text-center text-danger" id="category-error"></b>
						<div class="row mb-5">
							<div class=col-2 id="parent">
								<select class="custom-select" name="parentCat" id="parentCat"
									size="${parentCats.size()}">
									<c:forEach var="c" items="${parentCats}">
										<option value="${c.id}">${c.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-2" id="sub1">
								<select class="custom-select" name="sub1Cat" id="sub1Cat"
									size="${parentCats.size()}">
								</select>
							</div>
							<div class="col-2" id="sub2">
								<select class="custom-select" name="sub2Cat" id="sub2Cat"
									size="${parentCats.size()}">
								</select>
							</div>
							<div class="col-2" id="sub3">
								<select class="custom-select" name="sub3Cat" id="sub3Cat"
									size="${parentCats.size()}">

								</select>
							</div>
							<div class="col-2" id="sub4">
								<select class="custom-select" name="sub4Cat" id="sub4Cat"
									size="${parentCats.size()}">

								</select>
							</div>
							<div class="col-2" id="sub5">
								<select class="custom-select" name="sub5Cat" id="sub5Cat"
									size="${parentCats.size()}">
								</select>
							</div>

						</div>
						<div class="row">
							<div class="col">
								<div class="form-group" id="category">
									<s:label path="category">Seçilen Kategori</s:label>
									<a href="#" id="resetSelectedCat">Değiştir</a>
									<s:select path="category" id="categoryCat"
										cssClass="form-control">
									</s:select>
								</div>
								<div class="form-footer float-right">
									<a href="#" class="btn btn-default" onclick="history.back()">Vazgeç</a>
									<a id="next-2" href="#" class="btn btn-primary">İleri</a>
								</div>
							</div>
						</div>

					</div>
					<div id="step-2">
						<div class="row ">
							<div class="col">
								<div class="form-group">
									<label for="baslik">İlan Başlığı</label>
									<s:input path="baslik" cssClass="form-control" id="baslik"
										placeholder="İlan Başlığı" type="text" required="required" />
									<b class="form-text text-danger" id="baslik-error"></b>

								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="toplamAdet">Toplam adet</label>
											<s:input path="toplamAdet" cssClass="form-control"
												id="toplamAdet" type="number" required="required" />
											<b class="form-text text-danger" id="toplamAdet-error"></b>
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="toplamFiyat">Toplam fiyat (₺)</label>
											<s:input path="toplamFiyat" cssClass="form-control"
												id="toplamFiyat" type="number" required="required" />
											<b class="form-text text-danger" id="toplamFiyat-error"></b>
										</div>
									</div>
								</div>


								<div class="form-group">
									<label>Lütfen Seçilen Kategoride Sahip Olduğunuz Hayvan
										Tiplerini Seçiniz</label> <b class="form-text text-primary"
										id="tips-info"></b>
									<div class="select2-info">
										<select class="tips" multiple="multiple" id="tips" name="tips"
											data-placeholder="Sahip olduğunuz hayvanlara ait tipleri seçiniz (CTRL ile çoklu seçim)"
											data-dropdown-css-class="select2-info" style="width: 100%;">
										</select>
									</div>
									<b class="form-text text-danger" id="tips-error"></b>
								</div>
								<div class="form-footer float-right">
									<a id="back-1" href="#" class="btn btn-default">Geri</a> <a
										id="next-3" href="#" class="btn btn-primary">İleri</a>
								</div>
							</div>
						</div>
					</div>
					<div id="step-3">
						<div class="row">
							<div class="col">
								<label>Tip</label>
							</div>
							<div class="col">
								<label>Adet</label>
							</div>
							<div class="col">
								<label>Adet Fiyatı</label>
							</div>
						</div>
						<div class=col id="advert-detail"></div>
						<div class="form-footer float-right">
							<a id="back-2" href="#" class="btn btn-default">Geri</a> <a
								id="next-4" href="#" class="btn btn-primary">İleri</a>
						</div>
					</div>
					<div id="step-4">
						<div class="form-group">
							<label for="input-fotos">Fotoğraflar</label>
								<input id="input-fotos" name="files[]" type="file"
									accept="image/*" multiple>
							<b class="form-text text-danger" id="resim-error"></b>
						</div>

						<div class="form-group">
							<label for="aciklama">İlan Açıklaması</label>
							<s:textarea path="aciklama" cssClass="form-control" id="aciklama"
								placeholder="Açıklama" required="required" />
							<b class="form-text text-danger" id="aciklama-error"></b>
						</div>
						<div class="form-footer float-right">
							<a id="back-3" href="#" class="btn btn-default">Geri</a>
							<button type="submit" class="btn btn-primary">Kaydet</button>
						</div>
					</div>


				</s:form>
			</div>
		</div>
	</div>
</div>



<!-- /.card -->