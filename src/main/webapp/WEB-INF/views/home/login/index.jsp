<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
<div class="container">
	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form">
						<!--login form-->
						<h2>Login to your account</h2>
						<form action="${pageContext.request.contextPath}/uye/process-login"
							method="post">
							<input type="text" placeholder="Kullanıcı Adı" name="username">
							<input type="password" placeholder="Şifre" name="password">
							<span> <input type="checkbox" class="checkbox">
								Keep me signed in
							</span>
							<button type="submit" class="btn btn-default">Giriş</button>
						</form>
					</div>
					<!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">VEYA</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form text-center">
						<h2>Üye değil misin? Hemen Üye Ol!</h2>
						<div class="col">
							<a href="${pageContext.request.contextPath}/uye/register"
								class="btn btn-primary">Üye ol</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/form-->
</div>
