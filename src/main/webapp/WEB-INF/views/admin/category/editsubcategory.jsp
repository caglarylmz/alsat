<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
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
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/admin/category/subcategory/${subcat.parentCategory.id}">${subcat.parentCategory.name}</a></li>
					<li class="breadcrumb-item active">${subcat.name}</li>
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
			<!-- /.card-header -->
			<div class="card-body">
				<s:form method="post" modelAttribute="subcat"
					action="${pageContext.request.contextPath}/admin/category/editsubcategory">
					<div class="card-body">
						<div class="form-group">
							<label for="name">Kategori Adı</label>
							<s:input path="name" cssClass="form-control" id="name"
								placeholder="Ad" type="text" required="required" />
						</div>
						<div class="form-group">
							<label for="parentCategory">Ana Kategori</label>
							<s:select path="parentCategory" items="${parentCategories}"
								itemValue="id" itemLabel="name" cssClass="form-control" id="id"
								placeholder="id" type="text" required="required">
							</s:select>
						</div>



						<div class="checkbox">
							<label> <s:checkbox path="status"
									cssClass="form-checkbox" />Aktif mi?
							</label>
						</div>

						<div class="card-footer text-right">
							<a
								href="${pageContext.request.contextPath}/admin/category/subcategory/${subcat.parentCategory.id}"
								class="btn btn-secondary">Vazgeç</a>
							<button type="submit" class="btn btn-primary" id="myBtn">Sakla</button>
							<s:hidden path="id" />
						</div>
					</div>
				</s:form>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
</div>

