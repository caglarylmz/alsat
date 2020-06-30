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
					<div class="progress-bar bg-info" role="
						progressbar"
						style="width: 25%;" id="progressbar">
						<b class="lead" id="progressText">Kategori</b>
					</div>
				</div>

			</div>
			<div class="card-body">
				<!-- form start -->
				<s:form method="post" modelAttribute="advert"
					action="${pageContext.request.contextPath}/admin/advert/add"
					id="addAdvertForm" enctype="multipart/form-data">
					<p class="text-center text-light bg-secondary mb-2 p-2 rounded"
						id="cat-crumb"></p>
					<!-- step-1 -->
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

						<div class="form-group" id="category">
							<s:label path="category">Seçilen Kategori</s:label>
							<a href="#" id="resetSelectedCat">Değiştir</a>
							<s:select path="category" id="categoryCat"
								cssClass="form-control">
							</s:select>
						</div>

						<div class="form-footer float-right">
							<a href="#" class="btn btn-warning" onclick="history.back()">Vazgeç</a>
							<a id="next-2" href="#" class="btn btn-primary">İleri</a>
						</div>
					</div>
					<!-- ./step-1 -->
					<!-- step-2 -->
					<div id="step-2">
						<div class="form-group">
							<s:input path="baslik" cssClass="form-control" id="baslik"
								placeholder="İlan Başlığı" type="text" required="required" />
							<b class="form-text text-danger" id="baslik-error"></b>

						</div>
						<div class="form-group">
							<s:checkbox path="different"
								title="Kalın Yazı ve Renkli Çerçeve 5₺"
								label="İlanınız farklı görünsün mü?" />
						</div>
						<div class="form-group">
							<s:textarea path="aciklama" cssClass="form-control" id="aciklama"
								placeholder="Açıklama" required="required" />
							<b class="form-text text-danger" id="aciklama-error"></b>
						</div>

						<div class="form-footer float-right">
							<a id="back-1" href="#" class="btn btn-warning">Geri</a> <a
								id="next-3" href="#" class="btn btn-primary">İleri</a>
						</div>
					</div>
					<!-- ./step-2 -->
					<!-- step-3 -->
					<div id="step-3">
						<div class="form-group">
							<input id="input-fcount-1" name="files[]" multiple type="file"
								accept="image/*">
						</div>
						<div class="form-group">
							<label for="toplamAdet">Toplam adet</label>
							<s:input path="toplamAdet" cssClass="form-control"
								id="toplamAdet" type="number" required="required" />
							<b class="form-text text-danger" id="toplamAdet-error"></b>
						</div>
						<div class="form-group">
							<label for="toplamFiyat">Toplam fiyat (₺)</label>
							<s:input path="toplamFiyat" cssClass="form-control"
								id="toplamFiyat" type="number" required="required" />
							<b class="form-text text-danger" id="toplamFiyat-error"></b>
						</div>
						<div class="form-group">
							<s:checkbox path="topluSatis"
								title="Hayvanlarınızı toplu halde satmak istiyorsanız seçeneği işaretleyiniz!"
								label="Toplu Satış mı?" />
						</div>

						<div class="form-footer float-right">
							<a id="back-2" href="#" class="btn btn-warning">Geri</a>
							<button type="submit" id="next-4" class="btn btn-primary">İleri</button>
						</div>
					</div>

					<!-- ./step-3 -->

				</s:form>
			</div>
		</div>
	</div>
</div>



<!-- /.card -->