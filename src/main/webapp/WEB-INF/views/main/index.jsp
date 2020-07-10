<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="adverts">
	<div class="card card-solid">
		<div class="card-body pb-0">
			<div class="row d-flex align-items-stretch">
				<c:forEach var="advert" items="${latestAdverts}">
					<c:set var="photo"
						value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}">
					</c:set>
					<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
						<div class="card bg-ligh">
							<div class="card-body">
								<div class="row">
									<div class="col-12 text-center">
										<a href="${pageContext.request.contextPath}/advert/details/${advert.id}"
											class="text-center">
											<c:if test="${photo.name eq null}">
												<img src="${pageContext.request.contextPath}/uploads/no_image.jpg"
													id="advert-image" class="img-fluid">
											</c:if>
											<c:if test="${photo.name eq 'no_image.jpg'}">
												<img src="${pageContext.request.contextPath}/uploads/${photo.name}"
													id="advert-image" class="img-fluid">
											</c:if>
											<c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
												<img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
													id="advert-image" class="img-fluid">
											</c:if>
										</a>
									</div>
									<div class="col-12 text-muted">
										${advert.baslik}
									</div>

								</div>
							</div>
							<div class="card-footer">
								<div class="text-right">
									<a href="#" class="btn btn-sm bg-red">
										<i class="fas fa-heart"></i>
									</a>
									<a href="${pageContext.request.contextPath}/advert/details/${advert.id}"
										class="btn btn-sm btn-primary">
										<i class="fas fa-advert"></i> İlanı İncele
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer">
			<nav aria-label="Contacts Page Navigation">
				<ul class="pagination justify-content-center m-0">
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">6</a></li>
					<li class="page-item"><a class="page-link" href="#">7</a></li>
					<li class="page-item"><a class="page-link" href="#">8</a></li>
				</ul>
			</nav>
		</div>
		<!-- /.card-footer -->
	</div>


</div>