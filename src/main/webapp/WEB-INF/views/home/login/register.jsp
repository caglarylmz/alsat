<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


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

<section id="form">
	<!--form-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
				<div class="login-form">
					<!--login form-->
					<h2>Kayıt Ol</h2>

					<s:form action="${pageContext.request.contextPath}/uye/register"
						method="post" modelAttribute="account">
						<s:input path="fullName" type="text" placeholder="Ad Soyad"
							id="fullName" />
						<s:errors path="fullName" />
						<s:input path="username" type="text" placeholder="Kullanıcı Adı"
							id="username"  required="required"/>
						<s:errors path="username" />
						<c:if test="${msgUsername!=null}">
							<label>${msgUsername}</label>
						</c:if>

						<s:input path="mail" type="email" placeholder="Email" id="mail" required="required"/>
						<s:errors path="mail" />
						<c:if test="${msgMail!=null}">
							<label>${msgMail}</label>
						</c:if>
						<s:password path="password" placeholder="Şifre" id="password"  required="required"/>
						<s:errors path="password" />
						<s:password path="matchingPassword" id="matchingPassword"
							placeholder="Şifre Doğrula"  required="required" />
						<c:if test="${msgPassword!=null}">
							<label>${msgPassword}</label>
						</c:if>
						<span> <input type="checkbox" class="checkbox">
							Keep me signed in
						</span>
						<button type="submit" class="btn btn-default">Kayıt Ol</button>
					</s:form>
				</div>
				<!--/login form-->
			</div>
			<div class="col-sm-1">
				<h2 class="or">VEYA</h2>
			</div>
			<div class="col-sm-4">
				<div class="signup-form text-center">
					<h2>Üye misin?</h2>
					<div class="col">
						<a href="${pageContext.request.contextPath}/uye/login"
							class="btn btn-primary">Giriş Yap</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/form-->
