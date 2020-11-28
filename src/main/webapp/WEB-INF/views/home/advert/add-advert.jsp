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
                        <span class="uk-label uk-label-success">{{selectedCategory.name}}</span>
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
        <!--TİP-->
        <tab-content title="Tip" icon="fas fa-angle-double-down" :before-change="beforeTabSwitchTip">
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
                                <dt>
                                    <legend class="uk-legend">Seçili kategori</legend>
                                </dt>
                                <dd> <span class="uk-label uk-label-success">{{selectedCategory.name}}</span></dd>

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
                        <span class="uk-label uk-label-success p-2 m-2"
                            v-for="item in selectedTips">{{item.name}}</span>
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
        </tab-content>
        <!--TİP-->
        <!--TEMEL BİLGİLER-->
        <tab-content title="Temel Bilgiler" icon="fas fa-align-justify" :before-change="beforeTabSwitchTemel">
            <!--Error Message-->
            <div class="uk-alert-danger" uk-alert v-if="errorMessage !=''">
                <a class="uk-alert-close" uk-close></a>
                {{errorMessage}}
            </div>
            <!--Error Message-->
            <fieldset class="uk-fieldset uk-grid-small" id="temel" uk-grid>
                <legend class="uk-legend">Temel Bilgiler</legend>
                <!--Başlık-->
                <div class="uk-width-1-1 uk-margin-small">
                    <label class="uk-form-label" for="baslik">İlan Başlığı</label>
                    <div class="uk-form-controls">
                        <input class="uk-input" id="baslik" type="text" name="baslik"
                            @input="checkSuccessOfKeyPressForBaslik"
                            :class="ve.baslik.empty.status ? ve.baslik.className :''"
                            placeholder="İlan başlığı giriniz..." v-model="advert.baslik">
                    </div>
                    <div class="uk-text-danger">{{ve.baslik.empty.msg}}</div>
                </div>
                <!--Başlık-->
                <!--Açıklama-->
                <div class="uk-width-1-1 uk-margin-small">
                    <label class="uk-form-label" for="aciklama">İlan Açıklaması</label>
                    <div class="uk-form-controls">
                        <textarea :class="ve.aciklama.empty.status ? ve.aciklama.className :''" id="editor"></textarea>
                    </div>
                    <div class="uk-text-danger">{{ve.aciklama.empty.msg}}</div>
                </div>
                <!--Açıklama-->
                <!--Toplam Adet & Fiyat-->
                <div class="uk-width-1-1" uk-grid>
                    <div class="uk-width-1-2@s">
                        <label class="uk-form-label" for="toplamAdet">Toplam Adet</label>
                        <div class="uk-width-1">
                            <div class="uk-inline">
                                <span class="uk-form-icon uk-form-icon-flip">Adet</span>
                                <input class="uk-input" id="toplamAdet" type="number" v-model="advert.toplamAdet"
                                    :class="ve.toplamAdet.noselect.status ? ve.toplamAdet.className :''"
                                    @input="checkSuccessOfKeyPressForToplamAdet">
                            </div>
                        </div>
                        <div class="uk-text-danger">{{ve.toplamAdet.noselect.msg}}</div>
                    </div>
                    <div class="uk-width-1-2@s">
                        <label class="uk-form-label" for="toplamFiyat">Toplam Fiyat</label>
                        <div class="uk-width-1">
                            <div class="uk-inline">
                                <span class="uk-form-icon uk-form-icon-flip">₺</span>
                                <input class="uk-input" id="toplamFiyat" type="number" v-model="advert.toplamFiyat"
                                    :class="ve.toplamFiyat.noselect.status ? ve.toplamFiyat.className :''"
                                    @input="checkSuccessOfKeyPressForToplamFiyat">
                            </div>
                        </div>
                        <div class="uk-text-danger">{{ve.toplamFiyat.noselect.msg}}</div>
                    </div>
                </div>
                <!--Toplam Adet & Fiyat-->
                <!--Adres-->
                <div class="uk-width-1-1" uk-grid>
                    <div class="uk-width-1-1">Adres</div>
                    <div class="uk-width-1-4@s uk-margin-small">
                        <select class="form-control" id="il" v-model="selectIl" @change="getIlceList($event)"
                            :class="ve.adress.noselect.status ? ve.adress.className :''">
                            <option value=0>İl</option>
                            <option v-for="(il, index) in iller" v-bind:value="il.id">{{il.il}}</option>
                        </select>
                    </div>
                    <div class="uk-width-1-4@s uk-margin-small">
                        <select class="form-control" id="ilce" v-model="selectIlce" @change="getSemtList($event)"
                            :class="ve.adress.noselect.status ? ve.adress.className :''">
                            <option value=0>İlçe</option>
                            <option v-for="(ilce, index) in ilceler" v-bind:value="ilce.id">{{ilce.ilce}}
                            </option>
                        </select>
                    </div>
                    <div class="uk-width-1-4@s uk-margin-small">
                        <select class="form-control" id="mh_koy" v-model="selectSemt" @change="getMahalleList($event)"
                            :class="ve.adress.noselect.status ? ve.adress.className :''">
                            <option value=0>Semt</option>
                            <option v-for="(semt, index) in semtler" v-bind:value="semt.id">{{semt.semt}}
                            </option>
                        </select>
                    </div>
                    <div class="uk-width-1-4@s uk-margin-small">
                        <select class="form-control" id="mh_koy" v-model="selectMahalle" @change="selectAdress($event)"
                            :class="ve.adress.noselect.status ? ve.adress.className :''">
                            <option value=0>Mahalle / Köy</option>
                            <option v-for="(mahalle, index) in mahalleler" v-bind:value="mahalle.id">
                                {{mahalle.mahalle}}
                            </option>
                        </select>
                    </div>
                    <div class="uk-text-danger">{{ve.adress.noselect.msg}}</div>
                </div>
                <!--Adres-->
            </fieldset>
            <hr>
        </tab-content>
        <!--TEMEL BİLGİLER-->
        <!--PHOTO EKLE-->
        <tab-content title="Fotoğraf Ekle" icon="fas fa-camera-retro" :before-change="beforeTabSwitchPhoto">
            <!-- <image-uploader></image-uploader>-->
            <div class="uploader" @dragenter="OnDragEnter" @dragleave="OnDragLeave" @dragover.prevent @drop="onDrop"
                :class="{ dragging: isDragging }">

                <div class="upload-control" v-show="images.length">
                    <label class="iuLabel" for="file">Fotoğraf Ekle</label>
                </div>
                <div v-show="!images.length">
                    <i class="fa fa-cloud-upload"></i>
                    <p>Fotoğraflarınızı bu alana taşıyın</p>
                    <div>YA DA</div>
                    <div class="file-input">
                        <label class="iuLabel" for="file">Fotoğrafları seçin</label>
                        <input class="pickfile" type="file" id="file" @change="onInputChange" accept=".jpg, .jpeg, .png"
                            multiple>
                    </div>
                </div>

                <div class="images-preview" v-show="images.length">
                    <div class="img-wrapper" v-for="(image, index) in images" :key="index">
                        <img :src="image" alt="">
                        <div class="details">
                            <span class="name" v-text="files[index].name"></span>
                            <span class="size" v-text="getFileSize(files[index].size)"></span>
                        </div>
                    </div>
                </div>
                <div class="col-12" v-show="images.length">
                    <a class="btn btn-danger mt-5" @click="clarAllImage">
                        <i class="fas fa-trash"></i>
                    </a>
                    <div class="mt-1">Seçili fotoları sil</div>

                </div>
            </div>
            <hr>
        </tab-content>
        <!--PHOTO EKLE-->
        <!--Önİzle-->
        <tab-content title="Last step" icon="ti-check">
            Yuhuuu! This seems pretty damn simple
        </tab-content>
        <!--Önİzle-->

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

<style scoped>
    /*IMAGE-UPLOADER*/
    .uploader {
        width: 100%;
        background: darkgray;
        color: #fff;
        padding: 40px 15px;
        text-align: center;
        border-radius: 10px;
        border: 3px dashed #fff;
        font-size: 20px;
        position: relative;
    }

    .dragging {
        background: #fff;
        color: orange;
        border: 3px dashed orange;
    }


    .uploader i {
        font-size: 35px;
    }

    .file-input {
        width: 200px;
        margin: auto;
        height: 68px;
        position: relative;
    }

    .file-input label {
        margin-top: 5px;
        background: orange;
        color: #fff;
    }

    .iuLabel .pickfile {
        background: #fff;
        color: orange;
        width: 100%;
        position: absolute;
        left: 0;
        top: 0;
        padding: 10px;
        border-radius: 4px;
        margin-top: 7px;
        cursor: pointer;
    }

    .pickfile {
        opacity: 0;
        z-index: -2;
    }

    .images-preview {
        display: flex;
        flex-wrap: wrap;
        margin-top: 20px;
    }

    .img-wrapper {
        width: 160px;
        display: flex;
        flex-direction: column;
        margin: 10px;
        height: 150px;
        justify-content: space-between;
        background: #fff;
        box-shadow: 5px 5px 20px #3e3737;
    }

    .img-wrapper img {
        max-height: 105px;
    }

    .details {
        font-size: 12px;
        background: #fff;
        color: #000;
        display: flex;
        flex-direction: column;
        align-items: self-start;
        padding: 3px 6px;
    }

    .name {
        overflow: hidden;
        height: 18px;
    }

    .upload-control {
        position: absolute;
        width: 100%;
        background: #fff;
        top: 0;
        left: 0;
        border-top-left-radius: 7px;
        border-top-right-radius: 7px;
        padding: 10px;
        padding-bottom: 4px;
        text-align: right;
    }

    .iuLabel {
        background: orange;
        border: 2px solid orange;
        border-radius: 3px;
        color: #fff;
        font-size: 15px;
        cursor: pointer;
        padding: 2px 5px;
        margin-right: 10px;
    }

    /*IMAGE-UPLOADER*/
    /*ADD-ADVERT*/
    .uk-inline {
        width: 100% !important;
    }

    .vue-form-wizard .wizard-card-footer {
        padding: 0 0 !important;
    }


    .file-upload-name {
        background: #585858;
        padding: 0.5rem;
        color: white;
    }

    .alert {
        border-left: 1px solid;
    }

    /*ADD-ADVERT*/
</style>