<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>



<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">Profil</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/user/dashboard"><i
							class="fas fa-tachometer-alt"></i></a></li>
					<li class="breadcrumb-item active">Profil</li>
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
		<s:form method="post" modelAttribute="account"
			action="${pageContext.request.contextPath}/user/account/profile">
			<div class="card-body">
				<!-- username -->
				<div class="form-group">
					<label for="username">Kullanıcı Adı</label>
					<s:input path="username" cssClass="form-control" id="username"
						readonly="true" />
				</div>
				<!-- password -->
				<div class="form-group">
					<label for="password">Şifre</label>
					<s:password path="password" cssClass="form-control" id="password"/>
				</div>
				
				<!-- email -->
				<div class="form-group">
					<label for="mail">Mail</label>
					<s:input path="mail" cssClass="form-control" id="mail"
						required="true" />
				</div>
				<!-- first name -->
				<div class="form-group">
					<label for="fullName">Ad - Soyad</label>
					<s:input path="fullName" cssClass="form-control" id="text" />
				</div>

				<!-- role 
				<div class="form-group">
					<label for="lastName">Role</label>
					<s:select path="role" cssClass="form-control" id="role"
						itemLabel="name" itemValue="id" readonly="true">
						<s:options items="${roles}" itemLabel="name" itemValue="id" />
					</s:select>
				</div>-->
				<!-- adress-->
				<div class="form-group">
					<label for="adressDetail">Adres</label>
					<s:textarea path="adressDetail" cssClass="form-control"
						id="adressDetail" />
				</div>
				<!-- town-->
				<div class="form-group">
					<label for="town">İlçe</label>
					<s:input path="town" cssClass="form-control" id="town" />
				</div>
				<!-- city-->
				<div class="form-group">
					<label for="city">İl</label>
					<s:input path="city" cssClass="form-control" id="city" />
				</div>


			</div>
			<!-- /.card-body -->

			<div class="card-footer">
				<button type="submit" class="btn btn-primary btn-block">Kaydet</button>
				<s:hidden path="id" />
			</div>
		</s:form>
	</div>
	<!-- /.Main content -->
