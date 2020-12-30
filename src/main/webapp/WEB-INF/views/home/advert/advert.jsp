<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <c:set var="mainPhoto"
                value="${advert.getPhotos().stream().filter(p->p.isMainPhoto()).findFirst().orElse(null)}" />
            <fmt:formatNumber var="toplamFiyat" maxFractionDigits="0" type="currency" value="${advert.toplamFiyat}" />

            <div class="container">
                <!--Adverd- Header-->
                <div class="row align-items-center d-flex">
                    <!--TITLE-->
                    <div class="col-9"><span class="baslik">${advert.baslik}</span></div>
                    <!--TITLE-->
                    <!--ICONS-->
                    <div class="col-3">
                        <div class="row align-items-center  justify-content-end">
                            <c:if test="${!isLiked}">
                                <s:form method="post" modelAttribute="advert"
                                    action="${pageContext.request.contextPath}/user/advert/addFavourites">
                                    <a href="" type="submit" class="uk-icon-button mr-1" uk-icon="star"
                                        uk-tooltip="title:Favori İlanlara Ekle; pos:bottom" style="color: red;"></a>
                                    <s:hidden path="id" />
                                </s:form>

                            </c:if>
                            <c:if test="${isLiked}">
                                <s:form method="post" modelAttribute="advert"
                                    action="${pageContext.request.contextPath}/user/advert/removeFavourites">
                                    <a href="" type="submit" class="uk-icon-button mr-1" uk-icon="star"
                                        uk-tooltip="title:Favori İlanlardan Çıkar; pos:bottom"
                                        style="color: white; background-color: red;"></a>
                                    <s:hidden path="id" />
                                </s:form>
                            </c:if>
                            <div class="uk-inline">
                                <a href="" type="button" class="uk-icon-button mr-1" uk-icon="social"
                                    uk-tooltip="title:İlanı Paylaş; pos:bottom-center"></a>
                                <div class="share-container" uk-dropdown="mode: click; pos: bottom-center"> <a href=""
                                        class="uk-icon-button" uk-icon="twitter" style="color: #4867aa;"></a>
                                    <a href="" class="uk-icon-button" uk-icon="facebook" style="color: #00aced;"></a>
                                    <a href="" class="uk-icon-button" uk-icon="instagram" style="color: #b851d8;"></a>
                                    <a href="" class="uk-icon-button" uk-icon="whatsapp" style="color: #0dc143;"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--ICONS-->
                </div>
                <!--Adverd- Header-->
                <hr class="uk-divider-icon mb-1 mt-0">
                <!--BODY-->
                <div class="row d-flex justify-content-between">
                    <!--IMAGE SLIDER-->
                    <div class="col-sm-12 col-lg-5">
                        <div class="uk-position-relative" uk-slideshow="animation: fade">

                            <ul class="uk-slideshow-items">
                                <c:if test="${advert.photos eq null || advert.photos.size() eq 0}">
                                    <li>
                                        <img src="${pageContext.request.contextPath}/uploads/no_image.jpg" alt=""
                                            uk-cover>


                                    </li>
                                </c:if>
                                <c:if test="${advert.photos ne null || advert.photos.size() ne 0}">
                                    <c:forEach var="photo" items="${advert.photos}">
                                        <li>
                                            <c:if test="${photo.name eq null}">
                                                <img src="${pageContext.request.contextPath}/uploads/no_image.jpg"
                                                    alt="" uk-cover>

                                            </c:if>
                                            <c:if test="${photo.name eq 'no_image.jpg'}">
                                                <img src="${pageContext.request.contextPath}/uploads/${photo.name}"
                                                    alt="" uk-cover>

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
                                <div class="uk-position-small">
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
                    </div>
                    <!--IMAGE SLIDER-->
                    <!--ADVERT DETAILS-->
                    <div class="col-sm-12 col-lg-4">
                        <span class="uk-text-lead text-left uk-text-bold">${toplamFiyat}</span>
                        <ul class="uk-breadcrumb my-1">
                            <li><a href="">${advert.advertAdress.il}</a></li>
                            <li><a href="">${advert.advertAdress.ilce}</a></li>
                            <li><a href="">${advert.advertAdress.mahalle}</a></li>
                        </ul>

                        <table class="uk-table uk-table-small uk-table-divider my-1">
                            <tbody>
                                <tr>
                                    <td class="uk-text-bold	">İlan No</td>
                                    <td>${advert.id}</td>
                                </tr>
                                <tr>
                                    <td class="uk-text-bold	">Kategori</td>
                                    <td class="uk-text-capitalize">
                                        ${advert.category.name}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="uk-text-bold	">İlan Tarihi</td>
                                    <td>
                                        <fmt:formatDate type="date" value="${advert.createdAt}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="uk-text-bold	">Toplam Hayvan Adedi</td>
                                    <td>
                                        ${advert.toplamAdet}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="uk-text-bold	">Toplumu Satış mı?</td>
                                    <td class="uk-text-capitalize">
                                        <c:if test="${advert.topluSatis}">
                                            Evet
                                        </c:if>
                                        <c:if test="${!advert.topluSatis}">
                                            Hayır
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="uk-text-bold	">İlan Türü</td>
                                    <td class="uk-text-capitalize" style="color: red;">
                                        ${advert.kimden}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--ADVERT DETAILS-->
                    <!--USER DETAILS-->
                    <div class="col-sm-12 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-center">${advert.account.fullName}</h4>
                                <div class="uk-grid-small uk-flex-between" uk-grid>
                                    <h6 class="card-subtitle text-muted">Üyelik Tarihi</h6>
                                    <h6 class="card-subtitle text-muted">
                                        <fmt:formatDate type="date" value="${advert.account.createdAt}" />
                                    </h6>

                                </div>
                                <div class="uk-grid-small  uk-flex-between" uk-grid>
                                    <a class="uk-link-muted">
                                        Tüm İlanlar
                                    </a>
                                    <h6 class="card-subtitle text-muted">
                                        ${advert.account.adverts.size()}
                                    </h6>
                                </div>
                                <dl class="uk-description-list">
                                    <dt><span class="mb-1" uk-icon="icon: mail"></span></dt>
                                    <dd>
                                        <h6 class="card-subtitle text-muted">
                                            ${advert.account.email}
                                        </h6>
                                    </dd>
                                </dl>
                                <dl class="uk-description-list">
                                    <dt><span class="mb-1" uk-icon="icon: receiver"></span></dt>
                                    <dd>
                                        <h6 class="card-subtitle text-muted">
                                            ${advert.account.phone}
                                        </h6>
                                    </dd>
                                </dl>
                                <div class="row align-items-center  justify-content-around">
                                    <c:if test="${!isFavouriteSeller}">
                                        <s:form method="post" modelAttribute="advert"
                                            action="${pageContext.request.contextPath}/user/advert/addFavourites">
                                            <a href="" type="submit" class="uk-icon-button mr-1" uk-icon="heart"
                                                uk-tooltip="title:Favori Satıcılarıma Ekle; pos:bottom"
                                                style="color: red;"></a>
                                            <s:hidden path="id" />
                                        </s:form>

                                    </c:if>
                                    <c:if test="${isLiked}">
                                        <s:form method="post" modelAttribute="advert"
                                            action="${pageContext.request.contextPath}/user/advert/removeFavourites">
                                            <a href="" type="submit" class="uk-icon-button mr-1" uk-icon="star"
                                                uk-tooltip="title:Favori Satıcılarımdan Çıkar; pos:bottom"
                                                style="color: white; background-color: red;"></a>
                                            <s:hidden path="id" />
                                        </s:form>
                                    </c:if>
                                    <a href="" type="submit" class="uk-icon-button mr-1" uk-icon="comment"
                                        uk-tooltip="title:Satıcıya Mesaj Gönder; pos:bottom" style="color:#00aced;"></a>
                                    <a href="" type="submit" class="uk-icon-button mr-1" uk-icon="whatsapp"
                                        uk-tooltip="title:Whatsapp Mesaj Gönder; pos:bottom" style="color:#0dc143;"></a>
                                </div>
                            </div>
                        </div>
                        <!--USER DETAILS-->
                    </div>
                    <!--BODY-->
                </div>

                <div class="row">

                    <div class="col">
                        <ul class="uk-tab" data-uk-tab="{connect:'#my-id'}">
                            <li><a href="">Açıklama</a></li>
                            <li><a href="">Detaylar</a></li>
                            <li><a href="">Harita</a></li>
                        </ul>
                        <ul id="my-id" class="uk-switcher uk-margin">
                            <li>
                                <article class="uk-article">
                                    <p>${advert.aciklama}</p>
                                </article>
                            </li>
                            <li>
                                <div>
                                    <table class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                                        <thead>
                                            <tr>
                                                <th class="uk-table-small">Tip</th>
                                                <th class="uk-table-shrink">Yaş</th>
                                                <th class="uk-width-shrink text-center">Adet</th>
                                                <th class="uk-table-small">Fiyat</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th class="uk-table-small">Toplam</th>
                                                <th class="uk-table-shrink"></th>
                                                <th class="uk-width-shrink text-center">${advert.toplamAdet}</th>
                                                <th class="uk-table-small">${toplamFiyat}</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="ad" items="${advert.advertDetails}">
                                                <fmt:formatNumber var="ad_Fiyat" maxFractionDigits="0" type="currency"
                                                    value="${ad.fiyat}" />
                                                <tr>
                                                    <td>${ad.tip.name}</td>
                                                    <td class="text-center">${ad.yas.name}</td>
                                                    <td class="text-center">${ad.adet}</td>
                                                    <td>${ad_Fiyat}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </li>
                            <li>Content 3</li>
                        </ul>
                    </div>
                </div>
            </div>




            <style scoped>
                .advert-container {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }


                .thumb {
                    height: 75px;
                    width: auto;
                }

                .share-container {
                    padding: 10px !important;
                    min-width: 180px !important;
                }

                .baslik {
                    font-size: x-large;
                    font-weight: 700;
                }

                @media (max-width: 636px) {
                    .thumb {
                        height: 45px;
                        width: auto;
                    }

                    .baslik {
                        font-size: small;
                        font-weight: 700;
                    }
                }
            </style>



            <!--

<div class="container h-100" id="advert">
    <div class="uk-child-width-1-2@s  uk-text-center uk-grid-small" uk-grid>
        <div>
            <div class="uk-card uk-card-default">
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

-->