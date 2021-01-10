<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://localhost:8080/alsat/tags/categoryLeftMenu" prefix="lmenu" %>


<!--PANEL-->
<div class="panel panel-default beyaz" id="category">
    <!--PANEL - BODY-->
    <div class="panel-body border">
        <!--Kategori Liste-->
        <lmenu:category-left-menu category="${category}" />

        <!--Kategori Liste-->
        <!--Sonuç Filtre - MD-SM-->
        <div class="d-block d-lg-none">
            <button class="btn btn-danger btn-block " type="button" data-toggle="collapse"
                data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Sonuçları Filtrele
            </button>
            <div class="collapse" id="collapseExample">
                <form action="" method="post" class=" d-block mb20">
                    <div class="filtre_mobil_scroll scroll">
                        <div class="uk-background-muted  py-2">
                            <ul class="mx-3 my-1">
                                <label class="uk-text-bold ">Fiyat</label>
                                <li>
                                    <div class="row">
                                        <div class="col-6">
                                            <input type="number" name="fiyat_min" value="" placeholder="min. TL"
                                                class="uk-input uk-form-width-small" data-a-sep="." data-a-dec="," />
                                        </div>
                                        <div class="col-6">
                                            <input type="number" name="fiyat_max" value="" placeholder="max. TL"
                                                class="uk-input uk-form-width-small" data-a-sep="." data-a-dec="," />
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="uk-background-muted py-2">
                            <ul class="mx-3">
                                <label class="uk-text-bold ">Adres</label>
                                <li style="margin-bottom: 5px; margin-top: 5px;">
                                    <div id="il_sec">
                                        <select class='uk-select' name='il' v-model="selectIl"
                                            @change="getIlceList($event)">
                                            <option value=0>İl</option>
                                            <option v-for="(il, index) in iller" v-bind:value="il.id">{{il.il}}</option>
                                        </select>
                                    </div>
                                </li>
                                <li class="my-3">
                                    <div id="ilce_sec" v-if="selectIl!=0">
                                        <select class='uk-select' name='ilce' v-model="selectIlce"
                                            @change="getSemtList($event)">
                                            <option value=0>İlçe</option>
                                            <option v-for="(ilce, index) in ilceler" v-bind:value="ilce.id">
                                                {{ilce.ilce}}
                                            </option>
                                        </select>
                                    </div>
                                </li>
                                <li class="my-3">
                                    <div id="semt_sec" style="margin-bottom:10px;" v-if="selectIlce!=0">
                                        <select class='uk-select' name='semt' v-model="selectSemt"
                                            @change="getMahalleList($event)">
                                            <option value=0>Semt</option>
                                            <option v-for="(semt, index) in semtler" v-bind:value="semt.id">
                                                {{semt.semt}}
                                            </option>
                                        </select>
                                    </div>
                                </li>
                                <li class="my-3">
                                    <div id="mahalle_sec" v-if="selectSemt!=0">
                                        <select class='uk-select' name='mahalle' v-model="selectMahalle">
                                            <option value=0>Mahalle / Köy</option>
                                            <option v-for="(mahalle, index) in mahalleler" v-bind:value="mahalle.id">
                                                {{mahalle.mahalle}}
                                            </option>
                                        </select>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="uk-background-muted">
                            <ul class="mx-3" uk-accordion>
                                <li>
                                    <a class="uk-accordion-title" href="#"><label class="uk-text-bold ">Tip</label></a>
                                    <div class="uk-accordion-content my-2">
                                        <c:forEach var="tip" items="${tipsOfCategory}">
                                            <div class="form-check">
                                                <label><input class="uk-checkbox" type="checkbox" value="${tip.id}"
                                                        name="tip-${tip.id}"> ${tip.name}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="uk-background-muted">
                            <ul class="mx-3" uk-accordion>
                                <li>
                                    <a class="uk-accordion-title" href="#"><label class="uk-text-bold ">Irk</label></a>
                                    <div class="uk-accordion-content my-2">
                                        <c:forEach var="irk" items="${irks}">
                                            <div class="form-check">
                                                <label><input class="uk-checkbox" type="checkbox" value="${irk.id}"
                                                        name="irk-${irk.id}"> ${irk.name}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="uk-background-muted">
                            <ul class="mx-3" uk-accordion>
                                <li>
                                    <a class="uk-accordion-title" href="#"><label class="uk-text-bold ">Yaş</label></a>
                                    <div class="uk-accordion-content my-2">
                                        <c:forEach var="yas" items="${yaslar}">
                                            <div class="form-check">
                                                <label><input class="uk-checkbox" type="checkbox" value="${yas.id}"
                                                        name="yas-${yas.id}"> ${yas.name}</label>
                                            </div>

                                        </c:forEach>
                                    </div>
                                </li>
                            </ul>
                        </div>


                        <input type='hidden' name='kategori_filtreleri' value='yas|Yaş|select
                cinsiyet|Cinsiyet|select tur|Tur|select
                ' />

                    </div>

                </form>
                <button type="submit" name="buton" id="buton" class="btn btn-primary btn-block" value="Filtrele"><i
                        class="fa fa-filter"></i>Filtrele</button>
            </div>
        </div>
        <!--Sonuç Filtre - MD-SM-->

        <!--Sonuç Filtre - LG-->
        <div class="d-none d-lg-block">
            <form action="" method="post" class="d-block">
                <div class="filtre_mobil_scroll scroll">
                    <div class="uk-background-muted py-2">
                        <ul class="mx-3 my-1">
                            <label class="uk-text-bold ">Fiyat</label>
                            <li>
                                <div class="row">
                                    <div class="col-6">
                                        <input type="text" name="fiyat_min" value="" placeholder="min. TL"
                                            class="form-control " data-a-sep="." data-a-dec="," />
                                    </div>
                                    <div class="col-6">
                                        <input type="text" name="fiyat_max" value="" placeholder="max. TL"
                                            class="form-control " data-a-sep="." data-a-dec="," />
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="uk-background-muted py-2">

                        <ul class="mx-3">
                            <label class="uk-text-bold ">Adres</label>
                            <li class="mb-2">
                                <div id="il_sec">
                                    <select class='form-control' name='il' v-model="selectIl"
                                        @change="getIlceList($event)">
                                        <option value=0>İl</option>
                                        <option v-for="(il, index) in iller" v-bind:value="il.id">{{il.il}}</option>
                                    </select>
                                </div>
                            </li>
                            <li class="my-2">
                                <div id="ilce_sec" v-if="selectIl!=0">
                                    <select class='form-control' name='ilce' v-model="selectIlce"
                                        @change="getSemtList($event)">
                                        <option value=0>İlçe</option>
                                        <option v-for="(ilce, index) in ilceler" v-bind:value="ilce.id">{{ilce.ilce}}
                                        </option>
                                    </select>
                                </div>
                            </li>
                            <li class="my-2">
                                <div id="semt_sec" style="margin-bottom:10px;" v-if="selectIlce!=0">
                                    <select class='form-control' name='semt' v-model="selectSemt"
                                        @change="getMahalleList($event)">
                                        <option value=0>Semt</option>
                                        <option v-for="(semt, index) in semtler" v-bind:value="semt.id">{{semt.semt}}
                                        </option>
                                    </select>
                                </div>
                            </li>
                            <li class="my-2">
                                <div id="mahalle_sec" v-if="selectSemt!=0">
                                    <select class='form-control' name='mahalle' v-model="selectMahalle">
                                        <option value=0>Mahalle / Köy</option>
                                        <option v-for="(mahalle, index) in mahalleler" v-bind:value="mahalle.id">
                                            {{mahalle.mahalle}}
                                        </option>
                                    </select>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div class="uk-background-muted">
                        <ul class="mx-3" uk-accordion>
                            <li>
                                <a class="uk-accordion-title" href="#"><label class="uk-text-bold ">Tip</label></a>
                                <div class="uk-accordion-content my-2">
                                    <c:forEach var="tip" items="${tipsOfCategory}">
                                        <div class="form-check">
                                            <label><input class="uk-checkbox" type="checkbox" value="${tip.id}"
                                                    name="tip-${tip.id}"> ${tip.name}</label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="uk-background-muted">
                        <ul class="mx-3" uk-accordion>
                            <li>
                                <a class="uk-accordion-title" href="#"><label class="uk-text-bold ">Irk</label></a>
                                <div class="uk-accordion-content my-2">
                                    <c:forEach var="irk" items="${irks}">
                                        <div class="form-check">
                                            <label><input class="uk-checkbox" type="checkbox" value="${irk.id}"
                                                    name="irk-${irk.id}"> ${irk.name}</label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="uk-background-muted">
                        <ul class="mx-3" uk-accordion>
                            <li>
                                <a class="uk-accordion-title" href="#"><label class="uk-text-bold ">Yaş</label></a>
                                <div class="uk-accordion-content my-2">
                                    <c:forEach var="yas" items="${yaslar}">
                                        <div class="form-check">
                                            <label><input class="uk-checkbox" type="checkbox" value="${yas.id}"
                                                    name="yas-${yas.id}"> ${yas.name}</label>
                                        </div>

                                    </c:forEach>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <input type='hidden' name='kategori_filtreleri' value='yas|Yaş|select
        cinsiyet|Cinsiyet|select tur|Tur|select
        ' />
            </form>
            <button type="submit" name="buton" id="buton" class="btn btn-primary btn-block" value="Filtrele"><i
                    class="fa fa-filter"></i>Filtrele</button>
        </div>
    </div>
    <!--Sonuç Filtre - LG-->
</div>
<!--PANEL - BODY-->
</div>
<!--PANEL-->