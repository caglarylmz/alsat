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
					<b>${advert.id}</b> ID'li ilana ait fotoğraflar
				</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/panel"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item "><a
						href="${pageContext.request.contextPath}/admin/advert"><i
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
			<div class="card-header">
				<button type="button" class="btn btn-primary float-right "
					data-toggle="modal" data-target="#addPhotoModal">Fotoğraf
					Ekle</button>
				<button class="btn btn-secondary float-left" type="button"
					name="back" onclick="history.back()">
					<i class="fas fa-arrow-alt-circle-left"></i>
				</button>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<table id="table" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Photo</th>
							<th>Ana Fotoğraf</th>
							<th>Durum</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${photos}">
							<tr>
								<c:if test="${p.name eq 'no_image.jpg'}">
									<td align="center" style="vertical-align: middle;"><img
										src="${pageContext.request.contextPath}/uploads/${p.name}"
										height="100"></td>
								</c:if>
								<c:if test="${p.name ne 'no_image.jpg'}">
									<td align="center" style="vertical-align: middle;"><img
										src="${pageContext.request.contextPath}/uploads/advert_images/${p.name}"
										height="100" width="100" style="object-fit: cover;"></td>
								</c:if>
								<td align="center"><input type="checkbox" class="switch"
									${p.mainPhoto? 'checked' :''} /></td>
								<td align="center"><input type="checkbox" class="switch"
									${p.status ? 'checked' :''} /></td>
								<td style="vertical-align: middle;"><a
									class="btn btn-sm btn-warning"
									href="${pageContext.request.contextPath}/admin/photo/edit/${p.id}">
										<i class="fas fa-edit"></i>
								</a> <a class="btn btn-sm btn-danger"
									href="#deletePhotoModal_${p.id}" data-toggle="modal"> <i
										class="fas fa-trash"></i>
								</a></td>
							</tr>

							<!-- DeleteCategoryModal -->
							<div id="deletePhotoModal_${p.id}" class="modal fade"
								tabindex="-1">
								<div class="modal-dialog modal-confirm">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">Emin misiniz?</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<p>
												<span class="mr-1">id:${p.id} name : ${p.name}</span> öğesini silmek
												üzeresiniz. Bu işlem geri alınamaz!
											</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Vazgeç</button>
											<button type="button" class="btn btn-danger" id="action"
												onclick="location.href='${pageContext.request.contextPath}/admin/photo/delete/${p.id}'">Delete</button>
										</div>
									</div>
								</div>
							</div>
							<!-- ./DeleteCategoryModal -->

						</c:forEach>
					</tbody>
					
				</table>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
</div>

<!-- Add Category Modal -->
<s:form method="post" modelAttribute="photo"
	enctype="multipart/form-data" id="add-row-form"
	action="${pageContext.request.contextPath}/admin/photo/add">
	<div class="modal fade" id="addPhotoModal" tabindex="-1" role="dialog"
		aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Fotoğraf Ekle</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="name" name="file"
							accept="image/x-png,image/gif,image/jpeg"> <label
							class="custom-file-label" for="name">Fotoğraf</label>
					</div>
					<div class="form-group">
						<s:checkbox path="mainPhoto" cssClass="checkbox" id="mainPhoto" />
						<label for="mainPhoto">Ana Fotoğraf mı? </label>
					</div>

					<div class="form-group">
						<s:checkbox path="status" cssClass="checkbox" id="status" />
						<label for="status">Aktif mi? </label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Vazgeç</button>
					<button type="submit" class="btn btn-success" id="myBtn">Ekle</button>
					<s:hidden path="advert.id" />
				</div>
			</div>
		</div>
	</div>
</s:form>
