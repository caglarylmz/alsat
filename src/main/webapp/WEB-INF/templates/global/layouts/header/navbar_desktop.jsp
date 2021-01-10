<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--HEADER-DESKTOP-->
<header class="d-none d-lg-block">
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary uk-navbar" data-uk-sticky>
        <div class="container">
            <div class="col-2">
                <a class="navbar-brand" href="/">
                    <img src="${contextRoot}/resources/assets/images/logo.png" width="100" height="40" alt=""
                        loading="lazy">
                </a>
            </div>
            <div class="col">
                <form action="${pageContext.request.contextPath}/" method="POST">
                    <div class="input-group">
                        <c:if test="${query.isEmpty()}">
                            <input type="text" class="form-control" name="query" required
                                placeholder="Kelime, ilan no veya mağaza adı ile ara" aria-label="Ara...">
                        </c:if>
                        <c:if test="${!query.isEmpty()}">
                            <input type="text" class="form-control" name="query" required
                                placeholder="Kelime, ilan no veya mağaza adı ile ara" aria-label="Ara..."
                                value="${query}">
                        </c:if>
                        <div class="input-group-append">
                            <button class="btn btn-danger btn-sm" type="submit"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </form>
            </div>

            <div class="col-4">
                <div class="row justify-content-end uyelik">
                    <sec:authorize access="!isAuthenticated()">

                        <a href="${pageContext.request.contextPath}/uye" class="btn-header uye">Giriş Yap</a>
                        <a href="#" class="btn-header uye">Kayıt Ol</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <a href="${pageContext.request.contextPath}/user/panel/ilanlar/mesaj"
                            class="uk-icon-button mr-1" uk-icon="mail" uk-tooltip="İlan Mesajlarım"></a>
                        <a href="${pageContext.request.contextPath}/user/panel/ilanlar/favori"
                            class="uk-icon-button mr-1" uk-icon="star" uk-tooltip="Favori İlanlarım"></a>

                        <div class="uk-inline">
                            <button class="uk-icon-button mr-2" uk-icon="user" type="button"></button>
                            <div uk-dropdown>
                                <ul class="uk-nav uk-dropdown-nav">
                                    <li class="uk-nav-header">${pageContext.request.userPrincipal.name}</li>
                                    <li class="uk-nav-divider"></li>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <li class="uk-active"><a class="uk-link-text"
                                                href="${pageContext.request.contextPath}/admin/panel">Admin Panel</a>
                                        </li>
                                        <li class="uk-nav-divider"></li>
                                        <li class="uk-active"><a class="uk-link-text"
                                                href="${pageContext.request.contextPath}/uye/process-logout">Oturumu
                                                Kapat</a>
                                        </li>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_USER')">
                                        <li class="uk-active"><a class="uk-link-text"
                                                href="${pageContext.request.contextPath}/user/panel">Yönetim Panelim</a>
                                        </li>
                                        <li class="uk-active"><a class="uk-link-text"
                                                href="${pageContext.request.contextPath}/user/account/profile">Profil</a>
                                        </li>
                                        <li class="uk-nav-divider"></li>
                                        <li class="uk-active"><a class="uk-link-text"
                                                href="${pageContext.request.contextPath}/uye/process-logout"><i
                                                    class="fas fa-sign-out-alt mr-1"></i>Oturumu
                                                Kapat</a>
                                        </li>
                                    </sec:authorize>
                                </ul>
                            </div>
                        </div>
                    </sec:authorize>
                    <a href="/ilan-ekle" class="btn btn-danger btn-header" style="text-decoration: none;">Ücretsiz
                        İlan
                        Ver</a>
                </div>
            </div>


        </div>
    </nav>

</header>
<!--HEADER-DESKTOP-->