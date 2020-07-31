<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">Kullanıcılar</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/dashboard"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item active">Accounts</li>
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
				<button type="button" class="btn btn-success float-right "
					data-toggle="modal" data-target="#addCategoryModal">Kullanıcı
					Ekle</button>

			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<table id="table" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Adı-Soyadı</th>
							<th>Kullanıcı Adı</th>
							<th>Email</th>
							<th>Role</th>
							<th>Durum</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="a" items="${accounts}">
							<tr>
								<td style="vertical-align: middle;">${a.fullName }</td>
								<td style="vertical-align: middle;">${a.username }</td>
								<td style="vertical-align: middle;">${a.email }</td>
								<td style="vertical-align: middle;">${a.role.name }</td>							
								<td align="center"><input type="checkbox" class="switch"
									${a.status ? 'checked' :''} /></td>
								<td style="vertical-align: middle;"><a
									class="btn btn-sm btn-default"
									href="/admin/account/adverts/${a.id}"><i
										class="fas fa-list"></i> Adverts</a> <a
									class="btn btn-sm btn-warning"
									href="${pageContext.request.contextPath}/admin/account/edit/${a.id}">
										<i class="fas fa-edit"></i>
								</a> <a class="btn btn-sm btn-danger"
									href="#deleteUserModal_${a.id}" data-toggle="modal"> <i
										class="fas fa-trash"></i>
								</a></td>
							</tr>

							<!-- DeleteUserModal -->
							<div id="#deleteUserModal_${a.id}" class="modal fade"
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
												<span class="mr-1">${a.username}</span> öğesini silmek
												üzeresiniz. Bu işlem geri alınamaz!
											</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Vazgeç</button>
											<button type="button" class="btn btn-danger" id="action"
												onclick="location.href='${pageContext.request.contextPath}/admin/account/delete/${a.id}'">Delete</button>
										</div>
									</div>
								</div>
							</div>
							<!-- ./DeleteUserModal -->

						</c:forEach>
					</tbody>
					
				</table>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
</div>

