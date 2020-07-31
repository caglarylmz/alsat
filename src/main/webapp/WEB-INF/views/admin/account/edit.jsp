<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/panel"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/account"><i
							class="fas fa-users"></i></a></li>

					<li class="breadcrumb-item active">${account.username}</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>

<!-- Main content -->
<div class="card card-primary">
	<!-- form start -->
	<div class="card-body">
		<s:form method="post" modelAttribute="account"
			class="form form-vertical"
			action="${pageContext.request.contextPath}/admin/account/edit"
			id="profileForm" enctype="multipart/form-data">
			<div class="row">
				<div class="col-sm-4 text-center mt-5">
					<c:if
						test="${account.profilePhoto eq 'avatar.jpg' or account.profilePhoto==null }">
						<div class="w3-display-card-4">
							<img
								src="${pageContext.request.contextPath}/uploads/${account.profilePhoto}"
								width="150" style="object-fit: cover" />
						</div>
					</c:if>
					<c:if test="${account.profilePhoto ne 'avatar.jpg'}">
						<div class="w3-display-card-4">
							<img
								src="${pageContext.request.contextPath}/uploads/profile_images/${account.profilePhoto}"
								width="170" height="200" style="object-fit: contain" />
						</div>

					</c:if>
					<input id="profilePhoto" name="file" type="file" accept="image/*">
				</div>
				<div class="col-sm-8 mt-3">
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
					<div class="checkbox">
						<label> <s:checkbox path="status" name="status"
								cssClass="form-checkbox" />Aktif mi?
						</label>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<div class="text-center">
					<button type="submit" class="btn btn-primary btn-block">Kaydet</button>
					<s:hidden path="id" />
				</div>
			</div>
		</s:form>
	</div>
</div>
<!-- /.Main content -->
