<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <!--HEADER-DESKTOP-->
 <header class="d-none d-lg-block">
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary uk-navbar" data-uk-sticky>
        <div class="container">
            <div class="col-2">
                <a class="navbar-brand" href="/h">
                    <img src="${contextRoot}/resources/assets/images/logo.png" width="100" height="30" alt="" loading="lazy">
                </a>
            </div>
            <div class="col">
                <form>
                    <div class="input-group">
                        <input type="text" class="form-control"
                            placeholder="Kelime, ilan no veya mağaza adı ile ara" aria-label="Ara...">
                        <div class="input-group-append">
                            <button class="btn btn-danger btn-sm" type="submit"><i
                                    class="fas fa-search"></i></button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="col-4">
                <div class="row justify-content-end uyelik">
                    <a href="#" class="btn-header">Giriş Yap</a>
                    <a href="#" class="btn-header">Kayıt Ol</a>
                    <a href="/h/ilan-ekle" class="btn btn-danger btn-header" style="text-decoration: none;">Ücretsiz İlan
                        Ver</a>
                </div>
            </div>
        </div>
    </nav>

</header>
<!--HEADER-DESKTOP-->