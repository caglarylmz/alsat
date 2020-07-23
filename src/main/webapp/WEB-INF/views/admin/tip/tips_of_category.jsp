<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/panel"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item "><a
						href="${pageContext.request.contextPath}/admin/category"><i
							class="fas fa-th-list"></i></a></li>
					<li class="breadcrumb-item "><a
						href="${pageContext.request.contextPath}/admin/category/subcategory/${cat.parentCategory.id}">${cat.parentCategory.name}</a></li>
					<li class="breadcrumb-item active">${cat.name }<i class="fas fa-long-arrow-alt-right mx-1"></i>Tip</li>
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
					data-toggle="modal" data-target="#addTipModal">Tip Ekle</button>
				
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
							<th>Tip Adı</th>
							<th>Durum</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="t" items="${tips}">
							<tr>
								<td>${t.name}</td>
								<td style="vertical-align: middle;">${t.status ? 'Aktif' : 'Pasif' }</td>
								<td style="vertical-align: middle;"><a
									class="btn btn-sm btn-warning"
									href="${pageContext.request.contextPath}/admin/tip/edit/${t.id}">
										<i class="fas fa-edit"></i>
								</a> <a class="btn btn-sm btn-danger" href="#deleteTipModal_${t.id}"
									data-toggle="modal"> <i class="fas fa-trash"></i>
								</a></td>
							</tr>

							<!-- DeleteTipModal -->
							<div id="deleteTipModal_${t.id}" class="modal fade" tabindex="-1">
								<div class="modal-dialog modal-confirm">
									<div class="modal-content">
										<div class="modal-header">

											<h4 class="modal-title">Emin misiniz?</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<p>
												<span class="mr-1">${t.name}</span> öğesini silmek
												üzeresiniz. Bu işlem geri alınamaz!
											</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Vazgeç</button>
											<button type="button" class="btn btn-danger" id="action"
												onclick="location.href='${pageContext.request.contextPath}/admin/tip/delete/${t.id}'">Delete</button>
										</div>
									</div>
								</div>
							</div>
							<!-- ./DeleteTipModal -->
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

<div class="modal fade" id="addTipModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<s:form method="post" modelAttribute="tip" id="add-row-form"
		action="${pageContext.request.contextPath}/admin/tip/category/${cat.id}">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title col-8" id="myModalLabel">Tip Ekle</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="name">Tip</label>
						<s:input path="name" cssClass="form-control" placeholder="Tip Adı"
							required="required" />
					</div>

					<div class="checkbox">
						<label> <s:checkbox path="status" class="form-checkbox" />Aktif
							mi?
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Vazgeç</button>
					<button type="submit" class="btn btn-primary" id="add-tip">Ekle</button>
					<s:hidden path="id" />
					<s:hidden path="category" />

				</div>
			</div>
		</div>
	</s:form>
</div>


