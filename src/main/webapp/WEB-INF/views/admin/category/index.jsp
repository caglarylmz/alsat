<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col">
				<ol class="breadcrumb float-sm-left">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/panel"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item active"><i class="fas fa-th-list"></i></li>
				</ol>
				<c:if test="${errorMsg!=null }">
					<div class="alert alert-danger alert-dismissible">${errorMsg}
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
				</c:if>
				<c:if test="${successMsg!=null }">
					<div class="alert alert-success alert-dismissible">${successMsg}
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
				</c:if>
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
					data-toggle="modal" data-target="#addCategoryModal">Ana
					Kategori Ekle</button>

			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<table id="table" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Katagori Adı</th>
							<th>Alt Kategori Sayısı</th>
							<th>Durum</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${categories}">
							<tr>
								<td style="vertical-align: middle;"><a
									class="btn btn-sm btn-default"
									href="/admin/category/subcategory/${c.id}">${c.name }</a></td>
								<td style="vertical-align: middle;">${c.subCategories.size() }</td>
								<td style="vertical-align: middle;">${c.status ? 'Aktif' : 'Pasif' }</td>
								<td style="vertical-align: middle;"><a
									class="btn btn-sm btn-default"
									href="/admin/category/subcategory/${c.id}"><i
										class="fas fa-list"></i> Alt Kategori</a> <a
									class="btn btn-sm btn-warning"
									href="${pageContext.request.contextPath}/admin/category/edit/${c.id}">
										<i class="fas fa-edit"></i>
								</a> <a class="btn btn-sm btn-danger"
									href="#deleteCategoryModal_${c.id}" data-toggle="modal"> <i
										class="fas fa-trash"></i>
								</a></td>
							</tr>

							<!-- DeleteCategoryModal -->
							<div id="deleteCategoryModal_${c.id}" class="modal fade"
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
												<span class="mr-1">${c.name}</span> öğesini silmek
												üzeresiniz. Bu işlem geri alınamaz!
											</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Vazgeç</button>
											<button type="button" class="btn btn-danger" id="action"
												onclick="location.href='${pageContext.request.contextPath}/admin/category/delete/${c.id}'">Delete</button>
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
<s:form method="post" modelAttribute="category" id="add-row-form"
	action="${pageContext.request.contextPath}/admin/category">
	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Ana Kategori Ekle</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="name">Kategori</label>
						<s:input path="name" cssClass="form-control" id="name"
							placeholder="Ad" type="text" required="required" />
					</div>
					<div class="checkbox">
						<label> <s:checkbox path="status" cssClass="form-checkbox" />Aktif
							mi?
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Vazgeç</button>
					<button type="submit" class="btn btn-primary" id="myBtn">Ekle</button>
				</div>
			</div>
		</div>
	</div>
</s:form>
