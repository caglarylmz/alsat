<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://localhost:8080/alsat/tags/categoryLeftMenu" prefix="lmenu" %>


<!--PANEL-->
<div class="panel panel-default beyaz">
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

                                <div id="il_sec" style="margin-bottom:10px;"><select name='no_flash' id='no_flash'
                                        class='form-control'>
                                        <option value='İl Seçiniz'>İl Seçiniz</option>
                                    </select></div>
                                <div id="ilce_sec" style="margin-bottom:10px;"></div>
                                <div id="mahalle_sec"></div>
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
                                <a type="button btn-block" uk-toggle="target: #toggle-tur; ">Tür<span
                                        class="float-right" uk-icon="plus" style="color: darkgray;"></span>
                                </a>
                            </div>

                            <div class="panel-body" id="toggle-tur" hidden>
                                <div class="form-group">
                                    <select class="form-control " id="tur" name="tur" placeholder="Tur">
                                        <option value="">Seçiniz</option>
                                        <option value='Dişi'>Dişi</option>
                                        <option value='Erkek'>Erkek</option>
                                    </select>
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
                                    <select class="form-control " id="yas" name="yas" placeholder="Yaş">
                                        <option value="">Seçiniz</option>
                                        <option value='Dişi'>Dişi</option>
                                        <option value='Erkek'>Erkek</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default beyaz filtre">
                            <div class="panel-heading">
                                <a type="button btn-block" uk-toggle="target: #toggle-cinsiyet; ">Cinsiyet<span
                                        class="float-right" uk-icon="plus" style="color: darkgray;"></span>
                                </a>
                            </div>
                            <div class="panel-body" id="toggle-cinsiyet" hidden>
                                <div class="form-group">
                                    <select class="form-control " id="cinsiyet" name="cinsiyet" placeholder="Cinsiyet">
                                        <option value="">Seçiniz</option>
                                        <option value='Dişi'>Dişi</option>
                                        <option value='Erkek'>Erkek</option>
                                    </select>
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
                        <div class="panel-body">

                            <div id="il_sec" style="margin-bottom:10px;"><select name='no_flash' id='no_flash'
                                    class='form-control'>
                                    <option value='İl Seçiniz'>İl Seçiniz</option>
                                </select></div>
                            <div id="ilce_sec" style="margin-bottom:10px;"></div>
                            <div id="mahalle_sec"></div>
                        </div>
                    </div>

                </div>
                <div class="panel panel-default beyaz filtre">
                    <div class="panel-heading">Fiyat</div>
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
                        <a type="button btn-block" uk-toggle="target: #toggle-tur; ">Tür<span class="float-right"
                                uk-icon="plus" style="color: darkgray;"></span>
                        </a>
                    </div>

                    <div class="panel-body" id="toggle-tur" hidden>
                        <div class="form-group">
                            <select class="form-control " id="tur" name="tur" placeholder="Tur">
                                <option value="">Seçiniz</option>
                                <option value='Dişi'>Dişi</option>
                                <option value='Erkek'>Erkek</option>
                            </select>
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
                            <select class="form-control " id="yas" name="yas" placeholder="Yaş">
                                <option value="">Seçiniz</option>
                                <option value='Dişi'>Dişi</option>
                                <option value='Erkek'>Erkek</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default beyaz filtre">
                    <div class="panel-heading">
                        <a type="button btn-block" uk-toggle="target: #toggle-cinsiyet; ">Cinsiyet<span
                                class="float-right" uk-icon="plus" style="color: darkgray;"></span>
                        </a>
                    </div>
                    <div class="panel-body" id="toggle-cinsiyet" hidden>
                        <div class="form-group">
                            <select class="form-control " id="cinsiyet" name="cinsiyet" placeholder="Cinsiyet">
                                <option value="">Seçiniz</option>
                                <option value='Dişi'>Dişi</option>
                                <option value='Erkek'>Erkek</option>
                            </select>
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