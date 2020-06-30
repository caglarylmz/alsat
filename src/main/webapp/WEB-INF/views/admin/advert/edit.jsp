<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-inner">
	<div class="container-fluid ">
		<div class="row ">
			<div class="col-md-6">
				<h1 class="breadcrumb-header">Kategori</h1>
			</div>
			<!-- /.col -->
			<div class="col-md-6 text-right">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb secondary-color">
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/admin/dashboard"><i
								class="menu-icon icon-home4"></i></a></li>
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/admin/category">Kategori</a></li>
						<li class="breadcrumb-item active">${category.name}</li>
					</ol>
				</nav>
			</div>
		</div>


		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title"></h3>
			</div>
			<!-- /.card-header -->
			<!-- form start -->
			<s:form method="post" modelAttribute="category"
				action="${pageContext.request.contextPath}/admin/category/edit">

				<div class="card-body">
					<div class="form-group">
						<label for="name">Kategori Adı</label>
						<s:input path="name" cssClass="form-control" id="name"
							placeholder="Ad" type="text" required="required" />
					</div>
					<div class="checkbox">
						<label> <s:checkbox path="status"
								style="margin-right:5px;" />Aktif mi?
						</label>
					</div>

					<div class="card-footer">
						<button type="submit" class="btn btn-primary btn-block" 
							id="myBtn">Sakla</button>
						<s:hidden path="id" />
					</div>
				</div>
			</s:form>
		</div>
	</div>
</div>


<!-- /.card -->

