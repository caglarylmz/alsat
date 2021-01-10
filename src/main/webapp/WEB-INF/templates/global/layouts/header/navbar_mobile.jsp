<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--HEADER-MOBILE-->
<header class="d-block d-lg-none">
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary uk-navbar" data-uk-sticky>
        <div class="col">
            <div class="row justify-content-start uyelik">
                <button type="button" id="mm_buton" href="#mm_panel"><i class="ion-navicon-round mr0"></i></button>
            </div>
        </div>
        <div class="col">
            <div class="row justify-content-center uyelik">
                <a class="navbar-brand" href="/">
                    <img src="${contextRoot}/resources/assets/images/logo.png" width="80" height="30" alt=""
                        loading="lazy" class="img-responsive img-center mobil_logo">
                </a>
            </div>
        </div>
        <div class="col">
            <div class="row justify-content-end uyelik">
                <sec:authorize access="!isAuthenticated()">
                    <a href="${pageContext.request.contextPath}/uye" class="uk-icon-button btn-danger mr-1"
                        uk-tooltip="Giriş yap"><i class="fas fa-sign-in-alt" style="color: white;"></i></a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="uk-inline">
                        <button class="uk-icon-button mr-2" uk-icon="user" type="button"></button>
                        <div uk-dropdown="pos: bottom-justify">
                            <ul class="uk-nav uk-dropdown-nav">
                                <li class="uk-nav-header">${pageContext.request.userPrincipal.name}</li>
                                <li class="uk-nav-divider"></li>
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <li class="uk-active"><a class="uk-link-text"
                                            href="${pageContext.request.contextPath}/admin/panel">Admin
                                            Panel</a>
                                    </li>
                                    <li class="uk-nav-divider"></li>
                                    <li class="uk-active"><a class="uk-link-text"
                                            href="${pageContext.request.contextPath}/uye/process-logout">Oturumu
                                            Kapat</a>
                                    </li>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_USER')">
                                    <li class="uk-active"><a class="uk-link-text"
                                            href="${pageContext.request.contextPath}/user/panel">Yönetim
                                            Panelim</a>
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
                <a href="/ilan-ekle" class="uk-icon-button btn-danger" uk-tooltip="Ücretsiz İlan Ver"><i
                        class="fas fa-plus" style="color: white;"></i></a>
            </div>
        </div>
    </nav>

    <form action="${pageContext.request.contextPath}/" method="POST">
        <div class="input-group">
            <c:if test="${query.isEmpty()}">
                <input type="text" class="form-control" name="query" id="ara" required
                    placeholder="Kelime, ilan no veya mağaza adı ile ara" aria-label="Ara...">
            </c:if>
            <c:if test="${!query.isEmpty()}">
                <input type="text" class="form-control" name="query" id="ara" required
                    placeholder="Kelime, ilan no veya mağaza adı ile ara" aria-label="Ara..." value="${query}">
            </c:if>
            <div class="input-group-append">
                <button class="btn btn-danger btn-sm" type="submit"><i class="fas fa-search"></i></button>
            </div>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="clearfix"></div>
        </div>

    </form>
</header>
<!--HEADER-MOBILE-->