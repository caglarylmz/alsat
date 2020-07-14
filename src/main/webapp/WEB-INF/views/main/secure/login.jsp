<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="login-box">
	<div class="login-logo">
		<a href="${pageContext.request.contextPath}/"><b>AlSat</b></a>
	</div>
	<!-- /.login-logo -->
	<div class="card">
		<div class="card-body login-card-body">
			<c:if test="${error!=null}">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					${error}
				</div>
			</c:if>
			<c:if test="${logout!=null}">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					${logout}
				</div>
			</c:if>
			<form action="${pageContext.request.contextPath}/uye/process-login" method="post">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Kullanıcı Adı" name="username" autocomplete="username">
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-user"></span>
						</div>
					</div>
				</div>
				<div class="input-group mb-3">
					<input type="password" class="form-control" placeholder="Password" name="password" autocomplete="current-password">
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-lock"></span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button type="submit" class="btn btn-primary btn-block">Giriş Yap</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<p class="mb-1">
				<a href="forgot-password.html">Şifremi unuttum!</a>
			</p>
			<p class="mb-0">
				<a href="${pageContext.request.contextPath}/uye/register" class="btn btn-dark btn-block">Üye ol</a>
			</p>
		</div>
		<!-- /.login-card-body -->
	</div>
</div>
<!-- /.login-box -->