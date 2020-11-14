<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="container h-100" id="add-advert">
    <!--STEPS CONTENIER-->
    <div class="row justify-content-center">
        <!--STEPS-->
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
        <!--STEPS-->
    </div>
    <!--STEPS CONTENIER-->

    <hr>
    <!--TABS-->

    <!--CATEGORY STEP-->
    <div class="container" v-if="selectedCategory==null">
        <div class="ui red message" v-if="errorMessage!==''">{{errorMessage}}</div>
        <div class=" ui horizontal divider">
            Kategori Seçimi
        </div>
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="ui breadcrumb bg-white">
                    <a class="section bg-white">Kategoriler</a>
                    <a class="section bg-white" v-for="(item, index) in selectedCategories" :key="index"
                        @click="handleSelectItem(item)"><i class="right arrow icon divider"></i>{{item.name}}</a>

                </div>
            </div>

            <div class="ui vertical menu">
                <a class="teal item" v-for="(item, index) in category" :key="item.id" @click="handleSelectItem(item)">
                    {{item.name}}
                </a>
            </div>
        </div>
    </div>
    <div class="container" v-if="selectedCategory!=null">
        <div class="col-12">
            <div class="ui breadcrumb bg-white">
                <a class="section bg-white">Kategoriler</a>
                <a class="section bg-white" v-for="(item, index) in selectedCategories" :key="index"><i
                        class="right arrow icon divider"></i>{{item.name}}</a>

            </div>
        </div>
        <div class="ui placeholder attached segment">
            <div class="ui icon header">
                <i class="thumbs up outline icon"></i>
                Kategori Seçimi Tamamlandı.

            </div>
            <div class="ui pointing below label text-center">
                Seçilen Kategori
            </div>
            <div class="ui text-center">
                {{selectedCategory.name}}
            </div>
        </div>
        <div class="ui bottom attached button" tabindex="0" @click="changeCategory">Kategori Değiştir</div>

    </div>
    <!--CATEGORY STEP-->


    <!--TABS-->
    <hr>
    <!--STEP FOOTER-->
    <div class="row justify-content-end mr-3">
        <div class="small ui animated button ui secondary" tabindex="0" v-show="isSuccess0" v-on:click="back">
            <div class="visible content">{{btnBack}}</div>
            <div class="hidden content">
                <i class="left arrow icon"></i>
            </div>
        </div>
        <div class="small ui animated button ui positive" tabindex="0" v-on:click="next">
            <div class="visible content">İleri</div>
            <div class="hidden content">
                <i class="save icon" v-if="isActive4"></i>
                <i class="eye icon" v-else-if="isSuccess4"></i>
                <i class="right arrow icon" v-else></i>


            </div>
        </div>
    </div>
    <!--STEP FOOTER-->
    <hr>
</div>