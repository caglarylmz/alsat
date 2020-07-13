<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="left-sidebar">
	<h2>Category</h2>
	<div class="panel-group category-products" id="accordian">
		<!--category-productsr-->
		<c:forEach var="c" items="${parentCategories}">
			<div class="panel panel-default">
				<h4 class="category-title">${c.name}</h4>
				<c:if test="${c.subCategories!=null }">
					<c:forEach var="c_sub1" items="${c.subCategories}">
						<c:choose>
							<c:when test="${c_sub1.subCategories.size() ne 0 }">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#${fn:replace(c_sub1.name,' ','')}"> <span
											class="badge pull-right"><i
												class="fa fa-plus"></i></span> ${c_sub1.name}
										</a>
									</h4>
								</div>
								<div id="${fn:replace(c_sub1.name,' ','')}"
									class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<c:forEach var="c_sub2" items="${c_sub1.subCategories}">

												<li><a href="#"
													onclick="location.href='${pageContext.request.contextPath}/${c_sub2.id}'">${c_sub2.name}
												</a></li>
											</c:forEach>

										</ul>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a href="#"
												onclick="location.href='${pageContext.request.contextPath}/${c_sub1.id}'">${c_sub1.name}</a>
										</h4>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</div>
		</c:forEach>
	</div>
	<!--/category-products-->


</div>