<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="container h-100" id="add-advert">
    <form-wizard @on-complete="onComplete" shape="circle" color="orange" title="" subtitle=''>
        <!--KATEGORI-->
        <tab-content title="Kategori" icon="fas fa-minus-square" :before-change="beforeTabSwitchCategory">
            <div class="uk-card uk-card-default uk-width-1">
                <!--HEADER-->
                <div class="uk-card-header">
                    <!--Error Message-->
                    <div class="uk-alert-danger" uk-alert v-if="errorMessage !=''">
                        <a class="uk-alert-close" uk-close></a>
                        {{errorMessage}}
                    </div>
                    <!--Error Message-->
                    <!--BreadCrumb-->
                    <div class="uk-grid-small uk-flex-middle" uk-grid>
                        <div class="uk-width-auto">
                            <ul class="uk-breadcrumb">
                                <li><span>Kategori</span></li>
                                <li v-for="item  in selectedCategories"><span>{{item.name}}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--BreadCrumb-->
                </div>
                <!--HEADER-->
                <!--BODY-->
                <div class="uk-card-body" v-if="selectedCategory==null">
                    <div class="list-group">
                        <a class="list-group-item list-group-item-action" v-for="(item, index) in category"
                            :key="item.id" @click="handleSelectCategory(item)">{{item.name}}</a>
                    </div>


                </div>
                <div class="uk-card-body" v-if="selectedCategory!=null">
                    <div class="uk-placeholder uk-text-center">
                        <i class="far fa-thumbs-up fa-4x bg-green"></i>
                        <div class="uk-text-lead">
                            Seçilen Kategori
                        </div>
                        <span class="uk-label uk-label-warning">{{selectedCategory.name}}</span>
                    </div>
                </div>
                <!--BODY-->
                <!--FOOTER-->
                <div class="uk-card-footer" v-if="selectedCategory!=null">
                    <button class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom uk-text-warning"
                        @click="changeCategory">Kategori
                        Değiştir</button>

                </div>
                <!--FOOTER-->
            </div>
        </tab-content>
        <!--KATEGORI-->

        <tab-content title="Tip" icon="fas fa-angle-double-down" :before-change="beforeTabSwitchTip">
            <!--TİP-->
            <div class="uk-card uk-card-default uk-width-1">
                <!--HEADER-->
                <div class="uk-card-header">
                    <!--Error Message-->
                    <div class="uk-alert-danger" uk-alert v-if="errorMessage !=''">
                        <a class="uk-alert-close" uk-close></a>
                        {{errorMessage}}
                    </div>
                    <!--Error Message-->
                    <!--BreadCrumb-->
                    <div class="uk-grid-small uk-flex-middle" uk-grid>
                        <div class="uk-width-auto" v-if="selectedCategory!=null">
                            <dl class="uk-description-list">
                                <dt>Seçili kategori</dt>
                                <dd> <span class="uk-label">{{selectedCategory.name}}</span></dd>

                            </dl>
                        </div>
                    </div>
                    <!--BreadCrumb-->
                </div>
                <!--HEADER-->
                <!--BODY-->
                <div class="uk-card-body" v-if="!isProcessSelectTipFinish">
                    <div class="list-group">
                        <div class="list-group">
                            <a class="list-group-item list-group-item-action" v-for="(item, index) in tips"
                                :key="item.id" @click=handleSelectTip($event,item.id)>{{item.name}}</a>
                        </div>

                    </div>
                </div>
                <div class="uk-card-body" v-if="isProcessSelectTipFinish">
                    <div class="uk-placeholder uk-text-center">
                        <i class="far fa-thumbs-up fa-4x bg-green"></i>
                        <div class="uk-text-lead">
                            Seçilen Tipler
                        </div>
                        <span class="uk-label uk-label-warning" v-for="item in selectedTips">{{item.name}}</span>
                    </div>
                </div>
                <!--BODY-->
                <!--FOOTER-->
                <div class="uk-card-footer" v-if="isProcessSelectTipFinish">
                    <button class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom uk-text-warning"
                        @click="changeTips">Seçili Tipleri Değiştir</button>

                </div>
                <!--FOOTER-->
            </div>
            <!--TİP-->
        </tab-content>
        <tab-content title="Temel Bilgiler" icon="fas fa-align-justify">
            <!--TEMEL BİLGİLER-->
            <fieldset class="uk-fieldset uk-grid-small" uk-grid>

                <legend class="uk-legend">Temel Bilgiler</legend>
                <div class="uk-margin uk-width-1-1">
                    <label class="uk-form-label" for="baslik">İlan Başlığı</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="baslik" type="text" placeholder="İlan başlığı giriniz...">
                    </div>
                </div>

                <div class="uk-width-1-1">
                    <label class="uk-form-label" for="aciklama">İlan Açıklaması</label>
                    <div class="uk-form-controls">
                        <textarea id="editor"></textarea>
                    </div>

                </div>
                <div class="uk-width-1-2@s">
                    <label class="uk-form-label" for="toplamAdet">Toplam Adet</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="toplamAdet" type="number">
                    </div>

                </div>
                <div class="uk-width-1-2@s">
                    <label class="uk-form-label" for="toplamFiyat">Toplam Fiyat</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="toplamFiyat" type="number">
                    </div>

                </div>

                <div class="uk-width-1-3@s">
                    <label class="uk-form-label" for="il">İl</label>
                    <select class="uk-select" id="il">
                        <option></option>
                        <option></option>
                    </select>
                </div>

                <div class="uk-width-1-3@s">
                    <label class="uk-form-label" for="ilce">İlçe</label>
                    <select class="uk-select" id="ilce">
                        <option></option>
                        <option></option>
                    </select>
                </div>
                <div class="uk-width-1-3@s">
                    <label class="uk-form-label" for="mh_koy">Mahalle / Köy</label>
                    <select class="uk-select" id="mh_koy">
                        <option></option>
                        <option></option>
                    </select>
                </div>
            </fieldset>
            <hr>
            <!--TEMEL BİLGİLER-->
        </tab-content>
        <tab-content title="Last step" icon="ti-check">
            Yuhuuu! This seems pretty damn simple
        </tab-content>
        <tab-content title="Last step" icon="ti-check">
            Yuhuuu! This seems pretty damn simple
        </tab-content>
        <template slot="footer" slot-scope="props">
            <div class="row">

            </div>
            <div class="wizard-footer-left">
                <wizard-button v-if="props.activeTabIndex > 0 && !props.isLastStep" @click.native="props.prevTab()"
                    :style="props.fillButtonStyle">Geri</wizard-button>
            </div>
            <div class="wizard-footer-right">
                <wizard-button v-if="!props.isLastStep" @click.native="props.nextTab()" :style="props.fillButtonStyle">
                    İleri</wizard-button>

                <wizard-button v-else @click.native="alert('Done')" class="finish-button"
                    :style="props.fillButtonStyle">
                    {{props.isLastStep ? 'Kaydet' : 'İleri'}}</wizard-button>
            </div>
        </template>
    </form-wizard>

</div>