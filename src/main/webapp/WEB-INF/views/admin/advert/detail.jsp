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
			<div class="card-body">
				<dl>
					<dt>Açıklama</dt>
					<dd>${advert.aciklama}</dd>


				</dl>
			</div>

		</div>
	</div>
</div>


<!-- /.card -->

