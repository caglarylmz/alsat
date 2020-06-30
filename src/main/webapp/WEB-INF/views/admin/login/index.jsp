<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="login-box">
	<div class="login-logo">
		<a href="/"><b>ALSAT</b></a>
	</div>
	<!-- /.login-logo -->
	<div class="card">
		<div class="card-body login-card-body">
			<p class="login-box-msg">Oturuma başlamak için giriş yapın</p>
			<c:if test="${error!=null}">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					${error}
				</div>
			</c:if>
			<c:if test="${logout!=null}">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					${logout}
				</div>
			</c:if>
			<form action="${pageContext.request.contextPath}/admin/process-login"
				method="post">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Username"
						name="username">
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-user"></span>
						</div>
					</div>
				</div>
				<div class="input-group mb-3">
					<input type="password" class="form-control" placeholder="Password"
						name="password">
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-lock"></span>
						</div>
					</div>
				</div>
				<div class="row">

					<button type="submit" class="btn btn-primary btn-block">Giriş
						Yap</button>

				</div>
			</form>
			<p class="mb-1 text-center">
				<a href="forgot-password.html">Şifremi unuttum!</a>
			</p>

		</div>
		<!-- /.login-card-body -->
	</div>
</div>
<!-- /.login-box -->
