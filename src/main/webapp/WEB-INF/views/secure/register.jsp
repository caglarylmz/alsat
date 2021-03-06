<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<div class="register-box ">
	<div class="register-logo">
		<a href="${pageContext.request.contextPath}/"><b>AlSat</b></a>
	</div>

	<div class="card">
		<div class="card-body register-card-body">
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
			<s:form action="${pageContext.request.contextPath}/uye/register" method="post" modelAttribute="account">
				<div class="input-group mb-3">
					<s:input path="fullName" type="text" placeholder="Ad Soyad" id="fullName" cssClass="form-control" />
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-user"></span>
						</div>
					</div>
					<s:errors path="fullName" />
				</div>
				<div class="input-group mb-3">
					<s:input path="username" type="text" placeholder="Kullanıcı Adı" id="username" autocomplete="username"
						cssClass="form-control" />
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-user"></span>
						</div>
					</div>
					<s:errors path="username" />
					<c:if test="${msgUsername!=null}">
						<label>${msgUsername}</label>
					</c:if>
				</div>
				<div class="input-group mb-3">
					<s:input path="email" type="email" placeholder="Email" id="email" required="required" autocomplete="email"
						cssClass="form-control" />
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-envelope"></span>
						</div>
					</div>
					<s:errors path="email" />
					<c:if test="${msgMail!=null}">
						<label>${msgMail}</label>
					</c:if>
				</div>
				<div class="input-group mb-3">
					<s:password path="password" placeholder="Şifre" id="password" required="required" autocomplete="new-password"
						cssClass="form-control" />
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-lock"></span>
						</div>
					</div>
					<s:errors path="password" />
				</div>
				<div class="input-group mb-3">
					<s:password path="matchingPassword" id="matchingPassword" placeholder="Şifre Doğrula" autocomplete="new-password"
						cssClass="form-control" required="required" />
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-lock"></span>
						</div>
					</div>
					<c:if test="${msgPassword!=null}">
						<label>${msgPassword}</label>
					</c:if>
				</div>

				<div class="row">
					<!-- /.col -->
					<div class="col-12">
						<button type="submit" class="btn btn-primary btn-block">Kayıt Ol</button>
					</div>
					<!-- /.col -->
				</div>
			</s:form>
			<a href="${pageContext.request.contextPath}/uye" class="text-center">Zaten Üyeyim</a>
		</div>
		<!-- /.form-box -->
	</div><!-- /.card -->
</div>
<!-- /.login-box -->