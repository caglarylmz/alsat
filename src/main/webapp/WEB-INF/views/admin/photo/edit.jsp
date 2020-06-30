<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">
					<b>${photo.id}</b> Edit
				</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/dashboard"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item "><a
						href="${pageContext.request.contextPath}/admin/advert"><i
						class="nav-icon fas fa-ad"></i></a></li>
					<li class="breadcrumb-item "><a
						href="${pageContext.request.contextPath}/admin/photo/${photo.advert.id}"><i
						class="nav-icon fas fa-ad"></i></a></li>
					<li class="breadcrumb-item active">Photos</li>
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
			<s:form method="post" modelAttribute="photo"
				enctype="multipart/form-data" id="edit-row-form"
				action="${pageContext.request.contextPath}/admin/photo/edit">
				<div class="card-body">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="name" name="file"
							accept="image/x-png,image/gif,image/jpeg"> <label
							class="custom-file-label" for="name">Fotoğraf</label>
					</div>
					<br> <br>

					<div class="form-group">
						<c:if test="${photo.name eq 'no_image.jpg'}">
							<td align="center" style="vertical-align: middle;"><img
								src="${pageContext.request.contextPath}/uploads/${photo.name}"
								height="100"></td>
						</c:if>
						<c:if test="${photo.name ne 'no_image.jpg'}">
							<td align="center" style="vertical-align: middle;"><img
								src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
								height="100" width="100" style="object-fit: cover;"></td>
						</c:if>
					</div>
					<div class="form-group">
						<label for="mainPhoto">Ana Fotoğraf mı? </label>
						<s:checkbox path="mainPhoto" cssClass="checkbox" id="mainPhoto" />
					</div>

					<div class="form-group">
						<label for="status">Aktif mi? </label>
						<s:checkbox path="status" cssClass="checkbox" id="status" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Vazgeç</button>
					<button type="submit" class="btn btn-success" id="myBtn">Sakla</button>
					<s:hidden path="advert.id" />
					<s:hidden path="id" />
				</div>
			</s:form>
		</div>
	</div>
</div>

