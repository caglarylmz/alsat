<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">İlanlar</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/panel"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item active">İlanlar</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /.content-header -->
<c:if test="${message!=null }">
	<div class="alert alert-success alert-dismissible">${message}
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>

</c:if>
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<a type="button" class="btn btn-success float-right"
					href="${pageContext.request.contextPath}/admin/advert/add">İlan
					Ekle</a>

			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<table id="table" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>İlan Sahibi</th>
							<th>Kategori</th>
							<th>Miktar</th>
							<th>Fiyat(₺)</th>
							<th>İlan Tipi</th>
							<th>Durum</th>
							<th>Vitrin</th>
							<th>Farklı</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${adverts}">
							<tr>
								<td>${a.id }</td>
								<td>${a.account.username }</td>
								<td>${a.category.name }</td>
								<td>${a.toplamAdet }</td>
								<td>${a.toplamFiyat }</td>
								<td>${a.topluSatis ? 'TOPLU': 'DETAYLI'}</td>
								<td align="center"><input type="checkbox" class="switch"
									${a.status ? 'checked' :''} /></td>
								<td align="center"><input type="checkbox" class="switch"
									${a.showcase ? 'checked' :''} /></td>
								<td align="center"><input type="checkbox" class="switch"
									${a.different ? 'checked' :''} /></td>
								<td style="vertical-align: middle;"><a
									class="btn btn-sm btn-default"
									href="${pageContext.request.contextPath}/admin/advert/detail/${a.id}"><i
										class="fas fa-list mr-1"></i>Detay</a> <a
									class="btn btn-sm btn-default"
									href="${pageContext.request.contextPath}/admin/photo/advert/${a.id}"><i
										class="far fa-images mr-1"></i>Photos</a><a
									class="btn btn-sm btn-warning"
									href="${pageContext.request.contextPath}/admin/advert/edit/${a.id}">
										<i class="fas fa-edit"></i>
								</a> <a class="btn btn-sm btn-danger"
									href="#deleteCategoryModal_${a.id}" data-toggle="modal"> <i
										class="fas fa-trash"></i>
								</a></td>
							</tr>

							<!-- DeleteCategoryModal -->
							<div id="deleteCategoryModal_${a.id}" class="modal fade"
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
												<span class="mr-1">${a.id}</span>'li ilanı silmek
												üzeresiniz. Bu işlem geri alınamaz!
											</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Vazgeç</button>
											<button type="button" class="btn btn-danger" id="action"
												onclick="location.href='${pageContext.request.contextPath}/admin/advert/delete/${a.id}'">Delete</button>
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

