<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
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
					<li class="breadcrumb-item active"><i class="fas fa-users"></i></li>
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
					data-toggle="modal" data-target="#addAccountModal">Kullanıcı
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
							<th></th>
							<th></th>
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
										class="fas fa-list"></i> Adverts</a></td>
								<td style="vertical-align: middle;"><a
									class="btn btn-sm btn-warning"
									href="${pageContext.request.contextPath}/admin/account/edit/${a.id}">
										<i class="fas fa-edit"></i>
								</a> <a class="btn btn-sm btn-danger"
									href="#deleteUserModal_${a.id}" data-toggle="modal"> <i
										class="fas fa-trash"></i>
								</a></td>
							</tr>

							<!-- DeleteUserModal -->
							<div id="deleteUserModal_${a.id}" class="modal fade"
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

<!-- Add User Modal -->
<div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Kullanıcı Ekle</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<s:form method="post" modelAttribute="account"
					class="form form-vertical"
					action="${pageContext.request.contextPath}/admin/account/profile"
					id="profileForm" enctype="multipart/form-data">
					<div class="row">
						<div class="col mt-3">
							<div class="row ">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="email">Email</label>
										<s:input path="email" type="email" name="email"
											class="form-control" required="required" />
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="username">Username</label>
										<s:input path="username" type="text" class="form-control"
											name="username" required="required" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="password">New Password</label> <input
											type="password" class="form-control" name="password"
											id="password" />
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="newPassword">Confirm Password</label> <input
											type="password" class="form-control" name="newPassword"
											id="newPassword" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="fullName">Full Name</label>
										<s:input path="fullName" class="form-control" name="fullName"
											required="required" />
									</div>

								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="phone">Telefon</label>
										<s:input path="phone" class="form-control" name="phone" />
									</div>

								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="adressDetail">Adres</label>
										<s:input path="adressDetail" class="form-control"
											name="adressDetail" />
									</div>

								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="town">İlçe</label>
										<s:input path="town" class="form-control" name="town" />
									</div>

								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="city">Şehir</label>
										<s:input path="city" class="form-control" name="city" />
									</div>

								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Vazgeç</button>
						<button type="submit" class="btn btn-primary" id="myBtn">Ekle</button>
					</div>
				</s:form>

			</div>
		</div>
	</div>
</div>