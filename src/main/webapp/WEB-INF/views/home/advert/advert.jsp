<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="mainPhoto" value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}" />
<fmt:formatNumber var="toplamFiyat" maxFractionDigits="0" type="currency" value="${advert.toplamFiyat}" />

<!--TODO: Slider no_image geldiğinde düzenle responsive olarak ayarla-->
<div class="container h-100" id="advert">
    <div class="uk-child-width-1-2@s  uk-text-center uk-grid-small" uk-grid>
        <div>
            <div class="uk-card uk-card-default">
                <!--SLIDER-->
                <div class="uk-position-relative" uk-slideshow="animation: fade">

                    <ul class="uk-slideshow-items">
                        <c:if test="${advert.photos eq null || advert.photos.size() eq 0}">
                            <li>
                                <img src="${pageContext.request.contextPath}/uploads/no_image.jpg" alt="" uk-cover>


                            </li>
                        </c:if>
                        <c:if test="${advert.photos ne null || advert.photos.size() ne 0}">
                            <c:forEach var="photo" items="${advert.photos}">
                                <li>
                                    <c:if test="${photo.name eq null}">
                                        <img src="${pageContext.request.contextPath}/uploads/no_image.jpg" alt=""
                                            uk-cover>

                                    </c:if>
                                    <c:if test="${photo.name eq 'no_image.jpg'}">
                                        <img src="${pageContext.request.contextPath}/uploads/${photo.name}" alt=""
                                            uk-cover>

                                    </c:if>
                                    <c:if test="${photo.name ne 'no_image.jpg' and photo.name ne null}">
                                        <div uk-lightbox>
                                            <a
                                                href="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}">
                                                <img src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
                                                    alt="" uk-cover>
                                            </a>
                                        </div>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <div class="uk-flex-1">
                        <div class=" uk-position-small my-1">
                            <div uk-slider>
                                <div class="uk-position-relative">
                                    <div class="uk-slider-container">
                                        <ul class="uk-slider-items uk-child-width-1-4">
                                            <c:forEach var="photo" items="${advert.photos}" varStatus="status">
                                                <li class="" uk-slideshow-item="${status.index}"><a href="#">
                                                        <img class="thumb"
                                                            src="${pageContext.request.contextPath}/uploads/advert_images/${photo.name}"
                                                            alt="">
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <a class="uk-position-center-left" href="#" uk-slidenav-previous
                                        uk-slider-item="previous"></a>
                                    <a class="uk-position-center-right" href="#" uk-slidenav-next
                                        uk-slider-item="next"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--SLIDER-->
            </div>
        </div>
        <div>
            <div class="uk-child-width-1-2 uk-text-center" uk-grid>
                <div>
                    <div class="uk-card uk-card-primary uk-card-body">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-primary uk-card-body">Item</div>
                </div>
            </div>
        </div>
    </div>

</div>


<style scoped>
    .thumb {
        height: 75px;
        width: auto;
    }

    @media (max-width: 636px) {
        .thumb {
            height: 45px;
            width: auto;
        }
    }
</style>