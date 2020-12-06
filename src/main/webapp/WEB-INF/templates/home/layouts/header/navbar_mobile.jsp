<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--HEADER-MOBILE-->
<header class="d-block d-lg-none">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary uk-navbar" data-uk-sticky>
            <div class="col">
                <div class="row justify-content-start uyelik">
                    <button type="button" id="mm_buton" href="#mm_panel"><i class="ion-navicon-round mr0"></i></button>
                </div>
            </div>
            <div class="col">
                <div class="row justify-content-center uyelik">
                    <a class="navbar-brand" href="#">
                        <img src="${contextRoot}/resources/assets/images/logo.png" width="80" height="30" alt=""
                            loading="lazy" class="img-responsive img-center mobil_logo">
                    </a>
                </div>
            </div>
            <div class="col">
                <div class="row justify-content-end uyelik">
                    <button type="button" id="mmu_buton" href="#mmu_panel"><i
                            class="ion-person-stalker mr0"></i></button>
                </div>
            </div>
        </nav>
        <form action="" method="post">
            <div class="input-group">
                <input type="text" class="ara form-control" id="ara"
                    placeholder="Kelime, ilan no veya mağaza adı ile ara" aria-label="Ara...">
                <div class="input-group-append">
                    <button class="btn btn-danger btn-sm" type="submit"><i class="fas fa-search"></i></button>
                </div>
                <div class="clearfix"></div>
            </div>
        </form>
    </div>
</header>
<!--HEADER-MOBILE-->