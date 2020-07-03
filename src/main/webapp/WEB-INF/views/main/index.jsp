<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row products">
	<c:forEach var="advert" items="${latestAdverts}">
		<c:set var="photo" value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}">
		</c:set>
		<div class="col-lg-4 col-md-6">
			<div class="product">
				<div class="flip-container">
					<div class="flipper">
						<div class="front"><a href="${pageContext.request.contextPath}/advert/details/${advert.id}">
								<c:if test="${photo.name eq null}">
									<img src="${pageContext.request.contextPath}/uploads/no_image.jpg" id="advert-image"
										class="img-fluid">
								</c:if>
								<c:if test="${photo.name eq 'no_image.jpg'}">
									<img src="${pageContext.request.contextPath}/uploads/${photo.name}"
										id="advert-image" class="img-fluid">
								</c:if>
								<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
									<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
										id="advert-image" class="img-fluid">
								</c:if>
							</a></div>
						<div class="back"><a href="${pageContext.request.contextPath}/advert/details/${advert.id}">
								<c:if test="${photo.name eq null}">
									<img src="${pageContext.request.contextPath}/uploads/no_image.jpg" id="advert-image"
										class="img-fluid">
								</c:if>
								<c:if test="${photo.name eq 'no_image.jpg'}">
									<img src="${pageContext.request.contextPath}/uploads/${photo.name}"
										id="advert-image" class="img-fluid">
								</c:if>
								<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
									<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
										id="advert-image" class="img-fluid">
								</c:if>
							</a></div>
					</div>
				</div><a href="${pageContext.request.contextPath}/advert/details/${advert.id}" class="invisible">
					<c:if test="${photo.name eq null}">
						<img src="${pageContext.request.contextPath}/uploads/no_image.jpg" id="advert-image"
							class="img-fluid">
					</c:if>
					<c:if test="${photo.name eq 'no_image.jpg'}">
						<img src="${pageContext.request.contextPath}/uploads/${photo.name}" id="advert-image"
							class="img-fluid">
					</c:if>
					<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
						<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
							id="advert-image" class="img-fluid">
					</c:if>
				</a>
				<div class="text">
					<h3><a href="${pageContext.request.contextPath}/advert/details/${advert.id}"></a>${advert.baslik}
					</h3>
					<p class=" price">
						<del></del>${advert.toplamFiyat} ₺
					</p>
					<p class="buttons"><a href="${pageContext.request.contextPath}/advert/details/${advert.id}"
							class="btn btn-outline-primary">İlanı İncele</a><a href="#" class="btn btn-danger"><i
								class="fas fa-heart"></i>Favorilere ekle</a></p>
				</div>
			</div>
		</div>
	</c:forEach>

</div>
<!-- /.products-->
</div>