<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<div class="error-page">
	<h2 class="headline text-danger">500</h2>

	<div class="error-content">
		<h3>
			<i class="fas fa-exclamation-triangle text-danger"></i> Oops!
			Something went wrong.
		</h3>

		<div class="row">
			<div class="col center">
				<h2 class="error-page-logo">Permission Error!</h2>
				<p class="error-page-bottom-text">${msg}</p>
				<a href="#" class="btn btn-primary m-b-xxs">Help Center</a> <a
					href="${pageContext.request.contextPath}/admin-panel"
					class="btn btn-default m-b-xxs">Return Back</a>
			</div>
		</div>
	</div>
</div>
