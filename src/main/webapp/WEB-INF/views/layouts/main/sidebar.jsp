<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!--ANA KATEGORİ-->
<c:if test="${isMain}">
	<div class="menu">
		<c:forEach var="c" items="${parentCategories}">
			<c:if test="${c.subCategories != null}">
				<li class="item">
					<a onclick="location.href='${pageContext.request.contextPath}/category/${c.id}/adverts'"
						class="btn"><i class="fas fa-home"></i>${c.name}</a>
					<div class="smenu">
						<c:forEach var="c_sub1" items="${c.subCategories}">
							<a href="#" class=""
								onclick="location.href='${pageContext.request.contextPath}/category/${c_sub1.id}/adverts'">${c_sub1.name}<span
									class="badge badge-secondary text-white float-right">${c_sub1.adverts.size()}</span></a>
						</c:forEach>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</div>
</c:if>

<!--ALT KATEGORİ(Alt kategoriye sahip)-->
<c:if test="${isHaveSub}">
	<div class="menu">
		<li class="item">
			<a href="#" class="btn"><i class="fas fa-home"></i>${categories[0].parentCategory.name}</a>
			<c:forEach var="c" items="${categories}">
				<div class="smenu">
					<a href="#" class=""
						onclick="location.href='${pageContext.request.contextPath}/category/${c.id}/adverts'">${c.name}<span
							class="badge badge-secondary text-white float-right">${c.adverts.size()}</span></a>
				</div>
			</c:forEach>
		</li>
	</div>
</c:if>

<!--EN ALT KATEGORİ-->
<c:if test="${isSub}">
	<div class="menu">
		<li class="item">
			<a class="btn"><i class="fas fa-home"></i>${category.name}</a>
			<c:forEach var="t" items="${category.tips}">

				<div class="smenu">
					<a class="" href="#"
						onclick="location.href='${pageContext.request.contextPath}/tip/${t.id}/adverts'">${c.name}${t.name}</a>
				</div>
			</c:forEach>
		</li>
	</div>
</c:if>

<!--TIP-->
<c:if test="${isTip}">
	<div class="menu">
		<li class="item">
			<a class="btn"><i class="fas fa-home"></i>${tip.name}</a>
		</li>
	</div>
</c:if>