<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
						href="${pageContext.request.contextPath}/admin/category/subcategory/${cat.id}">${cat.name}</a></li>
					<li class="breadcrumb-item active">Tip</li>
				</ol>
			</div>

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>

<div class="row">
	<div class="col-12">
		<div class="card">
			<!-- /.card-header -->
			<div class="card-body">
				<s:form method="post" modelAttribute="tip"
					action="${pageContext.request.contextPath}/admin/tip/edit">
					<div class="card-body">
						<div class="form-group">
							<label for="name">Tip Adı</label>
							<s:input path="name" cssClass="form-control" name="name"
								required="required" />
						</div>
						<div class="checkbox">
							<label> <s:checkbox path="status" name="status"
									cssClass="form-checkbox" />Aktif mi?
							</label>
						</div>
						<div class="card-footer text-right">
							<a href="${pageContext.request.contextPath}/admin/tip/category/${tip.category.id}"
								class="btn btn-secondary">Vazgeç</a>
							<button type="submit" class="btn btn-primary" id="myBtn">Kaydet</button>
							<s:hidden path="id" />
							<s:hidden path="category" />
						</div>
					</div>
				</s:form>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
</div>


