<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">

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
				<div class="progress" id="progress" style="height: 30px;">
					<div class="progress-bar bg-gradient-success" role="
						progressbar" style="width: 20%;" id="progressbar">
						<b class="lead" id="progressText">Kategori Seçimi</b>
					</div>
				</div>
			</div>
			<div class="card-body">
				<!-- form start -->
				<s:form method="post" modelAttribute="advert"
					action="${pageContext.request.contextPath}/admin/advert/add" id="example-advanced-form"
					enctype="multipart/form-data">
					<h3>Account</h3>
					<fieldset>
						<legend>Account Information</legend>

						<div id="step-1">
							<b class="form-text text-center text-danger" id="category-error"></b>
							<div class="row mb-5">
								<div class=col-2 id="parent">
									<select class="custom-select" name="parentCat" id="parentCat"
										size="${parentCats.size()}">
										<c:forEach var="c" items="${parentCats}">
											<option value="${c.id}">${c.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-2" id="sub1">
									<select class="custom-select" name="sub1Cat" id="sub1Cat"
										size="${parentCats.size()}">
									</select>
								</div>
								<div class="col-2" id="sub2">
									<select class="custom-select" name="sub2Cat" id="sub2Cat"
										size="${parentCats.size()}">
									</select>
								</div>
								<div class="col-2" id="sub3">
									<select class="custom-select" name="sub3Cat" id="sub3Cat"
										size="${parentCats.size()}">

									</select>
								</div>
								<div class="col-2" id="sub4">
									<select class="custom-select" name="sub4Cat" id="sub4Cat"
										size="${parentCats.size()}">

									</select>
								</div>
								<div class="col-2" id="sub5">
									<select class="custom-select" name="sub5Cat" id="sub5Cat"
										size="${parentCats.size()}">
									</select>
								</div>

							</div>
							<div class="row">
								<div class="col">
									<div class="form-group" id="category">
										<s:label path="category">Seçilen Kategori</s:label>
										<a href="#" id="resetSelectedCat">Değiştir</a>
										<s:select path="category" id="categoryCat" cssClass="form-control">
										</s:select>
									</div>
									<div class="form-footer float-right">
										<a href="#" class="btn btn-default" onclick="history.back()">Vazgeç</a>
										<a id="next-2" href="#" class="btn btn-primary">İleri</a>
									</div>
								</div>
							</div>

						</div>
					</fieldset>

					<h3>Profile</h3>
					<fieldset>
						<legend>Profile Information</legend>

						<label for="name-2">First name *</label>
						<input id="name-2" name="name" type="text" class="required">
						<label for="surname-2">Last name *</label>
						<input id="surname-2" name="surname" type="text" class="required">
						<label for="email-2">Email *</label>
						<input id="email-2" name="email" type="text" class="required email">
						<label for="address-2">Address</label>
						<input id="address-2" name="address" type="text">
						<label for="age-2">Age (The warning step will show up if age is less than 18) *</label>
						<input id="age-2" name="age" type="text" class="required number">
						<p>(*) Mandatory</p>
					</fieldset>

					<h3>Warning</h3>
					<fieldset>
						<legend>You are to young</legend>

						<p>Please go away ;-)</p>
					</fieldset>

					<h3>Finish</h3>
					<fieldset>
						<legend>Terms and Conditions</legend>

						<input id="acceptTerms-2" name="acceptTerms" type="checkbox" class="required"> <label
							for="acceptTerms-2">I agree with the Terms and Conditions.</label>
					</fieldset>
				</s:form>
			</div>
		</div>
	</div>
</div>



<!-- /.card -->