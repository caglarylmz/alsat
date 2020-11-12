<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container" id="add-advert">
    <div class="row justify-content-center">
        <div class="ui ordered steps tiny steps">
            <div class="step" :class="[isActive0 ? activeClass : disabledClass, isSuccess0 ? completedClass : '']">
                <div class="content">
                    <div class="title">Kategori</div>
                </div>
            </div>
            <div class="step" :class="[isActive1 ? activeClass : disabledClass, isSuccess1 ? completedClass : '']">
                <div class="content">
                    <div class="title">Temel Bilgiler</div>
                </div>
            </div>
            <div class="step" :class="[isActive2 ? activeClass : disabledClass, isSuccess2 ? completedClass : '']">
                <div class="content">
                    <div class="title">Detaylar</div>
                </div>
            </div>
            <div class="step" :class="[isActive3 ? activeClass : disabledClass, isSuccess3 ? completedClass : '']">
                <div class="content">
                    <div class="title">Fotoğraf</div>
                </div>
            </div>
            <div class="step" :class="[isActive4 ? activeClass : disabledClass, isSuccess4 ? completedClass : '']">
                <div class="content">
                    <div class="title">Kayıt</div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">

    </div>

    <div class="row justify-content-end">
        <div class="small ui animated button ui secondary" tabindex="0">
            <div class="visible content">Back</div>
            <div class="hidden content">
                <i class="left arrow icon"></i>
            </div>
        </div>
        <div class="small ui animated button ui positive" tabindex="0">
            <div class="visible content">Next</div>
            <div class="hidden content">
                <i class="right arrow icon"></i>
            </div>
        </div>
    </div>
</div>