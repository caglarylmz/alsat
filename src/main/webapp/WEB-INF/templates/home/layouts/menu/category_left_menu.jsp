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
                        <div class="panel panel-default beyaz filtre">
                            <div class="panel-heading">Adres</div>
                            <div class="panel-body">
                                <div id="il_sec" style="margin-bottom:10px;">
                                    <select class='form-control' name='no_flash' id='no_flash' v-model="selectIl"
                                        @change="getIlceList($event)">
                                        <option value=0>İl</option>
                                        <option v-for="(il, index) in iller" v-bind:value="il.id">{{il.il}}</option>
                                    </select>
                                </div>
                                <div id="ilce_sec" style="margin-bottom:10px;">
                                    <select class='form-control' name='no_flash' id='no_flash' v-model="selectIlce"
                                        @change="getSemtList($event)">
                                        <option value=0>İlçe</option>
                                        <option v-for="(ilce, index) in ilceler" v-bind:value="ilce.id">{{ilce.ilce}}
                                        </option>
                                    </select>
                                </div>
                                <div id="semt_sec" style="margin-bottom:10px;">
                                    <select class='form-control' name='no_flash' id='no_flash' v-model="selectSemt"
                                        @change="getMahalleList($event)">
                                        <option value=0>Semt</option>
                                        <option v-for="(semt, index) in semtler" v-bind:value="semt.id">{{semt.semt}}
                                        </option>
                                    </select>
                                </div>
                                <div id="mahalle_sec">
                                    <select class='form-control' name='no_flash' id='no_flash' v-model="selectMahalle">
                                        <option value=0>Mahalle / Köy</option>
                                        <option v-for="(mahalle, index) in mahalleler" v-bind:value="mahalle.id">
                                            {{mahalle.mahalle}}
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default beyaz filtre">
                            <div class="panel-heading">Fiyat</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-6">
                                        <input type="text" name="fiyat_min" id="fiyat_min" value=""
                                            placeholder="min. TL" class="form-control fiyat_mask" data-a-sep="."
                                            data-a-dec="," />
                                    </div>
                                    <div class="col-6">
                                        <input type="text" name="fiyat_max" id="fiyat_max" value=""
                                            placeholder="max. TL" class="form-control fiyat_mask" data-a-sep="."
                                            data-a-dec="," />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default beyaz filtre">
                            <div class="panel-heading">
                                <a type="button btn-block" uk-toggle="target: #toggle-tip; ">Tip<span
                                        class="float-right" uk-icon="plus" style="color: darkgray;"></span>
                                </a>
                            </div>

                            <div class="panel-body" id="toggle-tip" hidden>
                                <c:forEach var="tip" items="${tipsOfCategory}">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="${tip.id}"
                                            id="tip-${tip.id}">
                                        <label class="form-check-label text-primary" for="tip-${tip.id}">
                                            ${tip.name}
                                        </label>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="panel panel-default beyaz filtre">
                            <div class="panel-heading">
                                <a type="button btn-block" uk-toggle="target: #toggle-tur; ">Irk<span
                                        class="float-right" uk-icon="plus" style="color: darkgray;"></span>
                                </a>
                            </div>

                            <div class="panel-body" id="toggle-tur" hidden>
                                <div class="form-group">
                                    <c:forEach var="irk" items="${irks}">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="${irk.id}"
                                                id="irk-${irk.id}">
                                            <label class="form-check-label text-primary" for="irk-${irk.id}">
                                                ${irk.name}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default beyaz filtre">
                            <div class="panel-heading">
                                <a type="button btn-block" uk-toggle="target: #toggle-yas; ">Yaş<span
                                        class="float-right" uk-icon="plus" style="color: darkgray;"></span>
                                </a>
                            </div>

                            <div class="panel-body" id="toggle-yas" hidden>
                                <div class="form-group">
                                    <c:forEach var="yas" items="${yaslar}">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="${yas.id}"
                                                id="yas-${yas.id}">
                                            <label class="form-check-label text-primary" for="yas-${yas.id}">
                                                ${yas.name}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
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
            <form action="" method="post" class=" d-block mb20">
                <div class="filtre_mobil_scroll scroll">
                    <div class="panel panel-default beyaz filtre">
                        <div class="panel-heading">Adres</div>
                    </div>
                </div>

                <div class="panel panel-default beyaz filtre">
                    <div class="panel-heading">Fiyat</div>
                    <div class="panel-body">
                        <div id="il_sec" style="margin-bottom:10px;">
                            <select class='form-control' name='no_flash' id='no_flash' v-model="selectIl"
                                @change="getIlceList($event)">
                                <option value=0>İl</option>
                                <option v-for="(il, index) in iller" v-bind:value="il.id">{{il.il}}</option>
                            </select>
                        </div>
                        <div id="ilce_sec" style="margin-bottom:10px;">
                            <select class='form-control' name='no_flash' id='no_flash' v-model="selectIlce"
                                @change="getSemtList($event)">
                                <option value=0>İlçe</option>
                                <option v-for="(ilce, index) in ilceler" v-bind:value="ilce.id">{{ilce.ilce}}
                                </option>
                            </select>
                        </div>
                        <div id="semt_sec" style="margin-bottom:10px;">
                            <select class='form-control' name='no_flash' id='no_flash' v-model="selectSemt"
                                @change="getMahalleList($event)">
                                <option value=0>Semt</option>
                                <option v-for="(semt, index) in semtler" v-bind:value="semt.id">{{semt.semt}}
                                </option>
                            </select>
                        </div>
                        <div id="mahalle_sec">
                            <select class='form-control' name='no_flash' id='no_flash' v-model="selectMahalle">
                                <option value=0>Mahalle / Köy</option>
                                <option v-for="(mahalle, index) in mahalleler" v-bind:value="mahalle.id">
                                    {{mahalle.mahalle}}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-6">
                                <input type="text" name="fiyat_min" id="fiyat_min" value="" placeholder="min. TL"
                                    class="form-control fiyat_mask" data-a-sep="." data-a-dec="," />
                            </div>
                            <div class="col-6">
                                <input type="text" name="fiyat_max" id="fiyat_max" value="" placeholder="max. TL"
                                    class="form-control fiyat_mask" data-a-sep="." data-a-dec="," />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default beyaz filtre">
                    <div class="panel-heading">
                        <a type="button btn-block" uk-toggle="target: #toggle-tip; ">Tip<span class="float-right"
                                uk-icon="plus" style="color: darkgray;"></span>
                        </a>
                    </div>

                    <div class="panel-body" id="toggle-tip" hidden>
                        <c:forEach var="tip" items="${tipsOfCategory}">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="${tip.id}" id="tip-${tip.id}">
                                <label class="form-check-label text-primary" for="tip-${tip.id}">
                                    ${tip.name}
                                </label>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <div class="panel panel-default beyaz filtre">
                    <div class="panel-heading">
                        <a type="button btn-block" uk-toggle="target: #toggle-tur; ">Irk<span class="float-right"
                                uk-icon="plus" style="color: darkgray;"></span>
                        </a>
                    </div>

                    <div class="panel-body" id="toggle-tur" hidden>
                        <div class="form-group">
                            <c:forEach var="irk" items="${irks}">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="${irk.id}"
                                        id="irk-${irk.id}">
                                    <label class="form-check-label text-primary" for="irk-${irk.id}">
                                        ${irk.name}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default beyaz filtre">
                    <div class="panel-heading">
                        <a type="button btn-block" uk-toggle="target: #toggle-yas; ">Yaş<span class="float-right"
                                uk-icon="plus" style="color: darkgray;"></span>
                        </a>
                    </div>

                    <div class="panel-body" id="toggle-yas" hidden>
                        <div class="form-group">
                            <c:forEach var="yas" items="${yaslar}">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="${yas.id}"
                                        id="yas-${yas.id}">
                                    <label class="form-check-label text-primary" for="yas-${yas.id}">
                                        ${yas.name}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <input type='hidden' name='kategori_filtreleri' value='yas|Yaş|select
        cinsiyet|Cinsiyet|select tur|Tur|select
        ' />
            </form>
            <button type="submit" name="buton" id="buton" class="btn btn-primary btn-block" value="Filtrele"><i
                    class="fa fa-filter"></i>Filtrele</button>
        </div>
        <!--Sonuç Filtre - LG-->
    </div>
    <!--PANEL - BODY-->
</div>
<!--PANEL-->