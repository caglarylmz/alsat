<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../shared/flows-header.jsp"%>


<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- form start -->
            <s:form method="post" modelAttribute="category" action="${pageContext.request.contextPath}/admin/advert/add"
                id="addAdvertForm">
                <div id="step-1">
                    <b class="form-text text-center text-danger" id="category-error"></b>
                    <div class="row mb-5">
                        <div class=col-2 id="parent">
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
                            <div class="form-group" id="advert.category">
                                <s:label path="category">Seçilen Kategori</s:label>
                                <a href="#" id="resetSelectedCat">Değiştir</a>
                                <s:select path="category" id="categoryCat" cssClass="form-control">
                                </s:select>
                            </div>
                            <div class="form-footer float-right">
                                <a href="#" class="btn btn-default" onclick="history.back()">Vazgeç</a>
                                <a id="next-2" href="#" class="btn btn-primary">İleri</a>
                            </div>
                        </div>
                    </div>

                </div>
            </s:form>
        </div>
    </div>

</div>




<%@include file="../shared/flows-footer.jsp"%>