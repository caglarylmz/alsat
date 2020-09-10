<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<%@include file="../shared/flows-header.jsp"%>


<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="progress" id="progress" style="height: 30px;">
                        <div class="progress-bar bg-gradient-olive" role="
                            progressbar" style="width: 20%;" id="progressbar">
                            <b class="lead" id="progressText">Kategori Seçimi</b>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="container-fluid">
                                <ol class="breadcrumb category-breadcrumb">
                                    <li class="breadcrumb-item active" aria-current="page">Home</li>
                                </ol>
                        </div>
                    </div>

                    <!-- form start -->
                    <s:form method="post" modelAttribute="advert" id="addAdvertForm">
                        <b class="form-text text-center text-danger" id="category-error"></b>
                        <div class="row mb-5">
                            <div class="col-2" id="parent">
                                <select class="custom-select" name="parentCat" id="parentCat" size="${10}">
                                </select>
                            </div>
                            <div class="col-2" id="sub1">
                                <select class="custom-select" name="sub1Cat" id="sub1Cat" size="${10}">
                                </select>
                            </div>
                            <div class="col-2" id="sub2">
                                <select class="custom-select" name="sub2Cat" id="sub2Cat" size="${10}">
                                </select>
                            </div>
                            <div class="col-2" id="sub3">
                                <select class="custom-select" name="sub3Cat" id="sub3Cat" size="${10}">

                                </select>
                            </div>
                            <div class="col-2" id="sub4">
                                <select class="custom-select" name="sub4Cat" id="sub4Cat" size="${10}">

                                </select>
                            </div>
                            <div class="col-2" id="sub5">
                                <select class="custom-select" name="sub5Cat" id="sub5Cat" size="${10}">
                                </select>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group" id="category">
                                    <s:label path="category">Seçilen Kategori</s:label>
                                    <a href="#" id="resetSelectedCat">Değiştir</a>
                                    <s:select path="category" id="categoryCat" cssClass="form-control">
                                    </s:select>
                                </div>
                                <div class="form-footer float-right">
                                    <a href="${flowExecutionUrl}&_eventId_home" class="btn btn-danger">İptal</a>
                                    <a href="${flowExecutionUrl}&_eventId_tip" class="btn btn-primary"
                                        id="next-2">İleri</a>
                                </div>
                            </div>
                        </div>
                    </s:form>
                </div>

            </div>
        </div>
    </div>

</div>




<%@include file="../shared/flows-footer.jsp"%>