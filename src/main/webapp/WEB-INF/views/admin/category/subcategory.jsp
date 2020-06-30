<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/dashboard"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/category"><i
							class="fas fa-th-list"></i></a></li>
					<c:if test="${category.parentCategory!=null }">
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/admin/category/subcategory/${category.parentCategory.id}">${category.parentCategory.name}</a></li>
					</c:if>
					<li class="breadcrumb-item active">${category.name}</li>
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
					data-toggle="modal" data-target="#addCategoryModal">Alt
					Kategori Ekle</button>
				<button class="btn btn-secondary float-left" type="button"
					name="back" onclick="history.back()">
					<i class="fas fa-arrow-alt-circle-left"></i>
				</button>
			</div>
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
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${category.subCategories}">
						<tr>
							<td style="vertical-align: middle;">${c.name }</td>
							<td style="vertical-align: middle;">${c.subCategories.size() }</td>
							<td style="vertical-align: middle;">${c.status ? 'Aktif' : 'Pasif' }</td>
							<td style="vertical-align: middle;"><a
								class="btn btn-sm btn-info"
								href="${pageContext.request.contextPath}/admin/tip/category/${c.id}">Tip</a><span></span></td>
							<td style="vertical-align: middle;"><a
								class="btn btn-sm btn-default"
								href="${pageContext.request.contextPath}/admin/category/subcategory/${c.id}"><i
									class="fas fa-list"></i> Alt Kategori</a> <a
								class="btn btn-sm btn-warning"
								href="${pageContext.request.contextPath}/admin/category/editsubcategory/${c.id}">
									<i class="fas fa-edit"></i>
							</a> <a class="btn btn-sm btn-danger"
								href="#deleteCategoryModal_${c.id}" data-toggle="modal"> <i
									class="fas fa-trash"></i>
							</a>
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
											onclick="location.href='${pageContext.request.contextPath}/admin/category/deletesubcategory/${c.id}'">Delete</button>
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

<!-- Add Category Modal -->
<s:form method="post" modelAttribute="subcategory" id="add-row-form"
	action="${pageContext.request.contextPath}/admin/category/subcategory/${subcategory.parentCategory.id }">
	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title col-8" id="myModalLabel">Kategori Ekle</h4>
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
					<button type="submit" class="btn btn-success" id="addCategori">Ekle</button>
					<s:hidden path="parentCategory.id" />
					<s:hidden path="id" />

				</div>
			</div>
		</div>
	</div>
</s:form>