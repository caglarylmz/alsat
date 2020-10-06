<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div id="app">
    <div class="content-wrapper">
        <!-- Main content -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">

                            <div class="progress" id="progress" style="height: 30px;">
                                <div class="progress-bar bg-gradient-olive" role="progressbar" :style="progress"
                                    id="progressbar">
                                    <b class="lead" id="progressText">{{progressText}}</b>
                                </div>
                            </div>

                        </div>
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover table-borderless text-nowrap">
                                <tbody>
                                    <tr v-if="isCategorySelected">
                                        <td style="vertical-align: middle; width: 10%;"><b>Seçilen Kategori</b></td>
                                        <td style="vertical-align: middle; ">
                                            <span class="breadcrumb-item" v-for="(item, index)  in breadcrumb">{{item}}
                                            </span>
                                        </td>
                                        <td style="vertical-align: middle;float: right;"><button
                                                @click=returnCategorySelection
                                                class="btn btn-outline-secondary ">Değiştir</button></td>

                                    </tr>
                                    <tr v-if="isTipSelected">
                                        <td style="vertical-align: middle; width: 10%;"><b>Seçilen Tipler</b></td>
                                        <td style="vertical-align: middle; ">
                                            <span class=""
                                                v-for="(item, index) in selectedTips">{{index!==0 ?  " - " +item.name : item.name}}
                                            </span>
                                        </td>
                                        <td style="vertical-align: middle;float: right;"><button
                                                @click=returnTipSelection
                                                class="btn btn-outline-secondary ">Değiştir</button></td>

                                    </tr>

                                </tbody>
                            </table>
                        </div>

                        <div class="card-body">

                            <div class="col-12">
                                <h5>{{error}}</h5>
                            </div>
                            <!-- CATEGORY SELECT-->
                            <div v-if="showCategorySelect" class="row mb-5 ">
                                <div class="col-12 text-left mb-1">
                                    <span>
                                        <h4>Kategori Seç</h4>
                                    </span>
                                </div>
                                <div class="card-group ">
                                    <div class="card">
                                        <div class="menu">
                                            <li class="item">
                                                <div class="smenu" v-for="(item, index) in parentCategories">
                                                    <a @click=selectSubCategory1($event,item.id) type="button"
                                                        class="cat">{{item.name}} </a>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                    <div v-if='subCategory1.length > 0' class="card">
                                        <div class="menu">
                                            <li class="item">
                                                <div class="smenu" v-for=" (item, index) in subCategory1">
                                                    <a @click=selectSubCategory2($event,item.id) type="button"
                                                        class="cat">{{item.name}} </a>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                    <div v-if='subCategory2.length > 0' class="card">
                                        <div class="menu">
                                            <li class="item">
                                                <div class="smenu" v-for=" (item, index) in subCategory2">
                                                    <a @click=selectSubCategory3($event,item.id) type="button"
                                                        class="cat">{{item.name}} </a>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                    <div v-if='subCategory3.length > 0' class="card">
                                        <div class="menu">
                                            <li class="item">
                                                <div class="smenu" v-for=" (item, index) in subCategory3">
                                                    <a @click=selectSubCategory4($event,item.id) type="button"
                                                        class="cat">{{item.name}} </a>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                    <div v-if='subCategory4.length > 0' class="card">
                                        <div class="menu">
                                            <li class="item">
                                                <div class="smenu" v-for="(item, index) in subCategory4">
                                                    <a @click=selectSubCategory5($event,item.id) type="button"
                                                        class="cat">{{item.name}} </a>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- CATEGORY SELECT-->

                            <!--Select TIP-->
                            <div class="row row justify-content-md-center" v-show="showTipSelect">
                                <div class="col-12 text-left mb-1">
                                    <span>
                                        <h4>Tip Seç</h4>
                                    </span>
                                </div>
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover table-borderless text-nowrap">
                                        <thead>
                                            <tr>
                                                <th class="text-center">
                                                    Kategoriye Ait Tipler
                                                </th>
                                                <th class="text-center">
                                                    Seçilen Tipler
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="menu">
                                                                <li class="item">
                                                                    <div class="smenu"
                                                                        v-for="(item, index) in leftItems">
                                                                        <a @click=selectTips($event,item.id)
                                                                            type="button" class="cat">{{item.name}} </a>
                                                                    </div>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="menu">
                                                                <li class="item">
                                                                    <div class="smenu"
                                                                        v-for="(item, index) in rightItems">
                                                                        <a @click=removeTips($event,item.id)
                                                                            type="button" class="cat">{{item.name}} </a>
                                                                    </div>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>


                            </div>
                            <!--Select TIP-->

                            <!--Basic Advert's Data-->
                            <div class="card-body table-responsive p-0" v-show="showBasic">
                                <table class="table table-hover table-borderless text-nowrap">
                                    <tbody>
                                        <tr>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Başlık</label>
                                                <input type="email" class="form-control" v-model="advert.baslik"
                                                    aria-describedby="emailHelp">
                                                <small id="emailHelp" class="form-text text-muted">İlan'ı tanımlayacak
                                                    bir başlık giriniz</small>
                                            </div>
                                        </tr>

                                        <tr>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Açıklama</label>
                                                <div id="summernote"></div>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Toplam Adet </span>
                                                </div>
                                                <input type="number" step="1" class="form-control" placeholder="0"
                                                    v-model="advert.toplamAdet" aria-label="Toplam Adet"
                                                    aria-describedby="basic-addon1">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">Adet</span>
                                                </div>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Toplam Fiyat
                                                    </span>
                                                </div>
                                                <input type="number" step="100" class="form-control" placeholder="0"
                                                    v-model="advert.toplamFiyat" aria-label="Toplam Fiyat"
                                                    aria-describedby="basic-addon1">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">₺</span>
                                                </div>
                                            </div>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--Basic Advert's Data-->
                            <!--ADD PHOTOS-->
                            <div class="card-body table-responsive p-0" v-show="showPhotoUploader">
                                <div class="col-12 text-left mb-1">
                                    <span>
                                        <h4>Fotoğraf Ekle</h4>
                                    </span>
                                </div>
                                <!-- <image-uploader></image-uploader>-->
                                <div class="uploader" @dragenter="OnDragEnter" @dragleave="OnDragLeave"
                                    @dragover.prevent @drop="onDrop" :class="{ dragging: isDragging }">

                                    <div class="upload-control" v-show="images.length">
                                        <label class="iuLabel" for="file">Fotoğraf Ekle</label>
                                    </div>
                                    <div v-show="!images.length">
                                        <i class="fa fa-cloud-upload"></i>
                                        <p>Fotoğraflarınızı bu alana taşıyın</p>
                                        <div>YA DA</div>
                                        <div class="file-input">
                                            <label class="iuLabel" for="file">Fotoğrafları seçin</label>
                                            <input class="pickfile" type="file" id="file" @change="onInputChange"
                                                accept=".jpg, .jpeg, .png" multiple>
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
                                        <a class="btn btn-app btn-danger" style="margin: 0px;" @click="clarAllImage">
                                            <i class="far fa-times-circle"></i> Temizle
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <!--ADD PHOTOS-->

                            <!--ÖNİZLE-->
                            <div class="card-body">
                                <div class="row">
                                    <!--CAROUSEL-->
                                    <div class="col-12 col-lg-5">
                                        <div class="view-product text-center">
                                            <ul id="imageGallery" v-for="(image, index) in images" :key="index">
                                                <li :data-thumb="image">
                                                    <img :src="image">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--CAROUSEL-->
                            <!--ÖNİZLE-->







                            <div class="row">
                                <div class="col">
                                    <div class="form-footer float-right">
                                        <a href="#" class="btn btn-default"
                                            @click="back">{{isCategorySelected ? "Geri" : "Vazgeç"}}</a>
                                        <button id="next-2" class="btn btn-primary" @click="next">İleri</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>




    </div>
    <!-- /.content -->

</div>
<script>

    var vue = new Vue({
        el: '#app',
        components: {

        },
        data: {
            advert: {
                baslik: '',
                aciklama: '',
                toplamAdet: 0,
                toplamFiyat: 0,
                advertDetails: [],
                category: []
            },
            progressText: "Kategori Seçimi",
            progress: "width: 15%;",
            error: '',
            //cattegory select variables
            parentCategories: [],
            subCategory1: [],
            subCategory2: [],
            subCategory3: [],
            subCategory4: [],
            selectedCategory: {},
            breadcrumb: "",
            showCategorySelect: true,
            isCategorySelected: false,
            isActive: false,
            //tip selecet variable
            isTipSelected: false,
            showTipSelect: false,
            leftItems: [],
            rightItems: [],
            selectedTips: [],
            //basic data variable
            showBasic: false,
            isEnterBasic: false,
            //photo componente variable
            isDragging: false,
            dragCount: 0,
            files: [],
            images: [],
            showPhotoUploader: false,
            isPhotosSelected: false,



        },
        methods: {
            next() {
                //Kategori seçimi
                if (this.showCategorySelect) {
                    if (!this.isCategorySelected) {
                        this.error = "* Bir kategori seçmelisiniz!"
                        setTimeout(() => {
                            this.error = '';
                        }, 3000);
                    } else {
                        this.advert.category = this.selectedCategory;
                        this.showCategorySelect = false;
                        this.showTipSelect = true;
                    }
                }

                //Tip Seçimi
                if (this.showTipSelect) {
                    if (this.rightItems.length > 0) {
                        this.isTipSelected = true;
                        this.showBasic = true;

                    } else {
                        this.error = "* Seçtiğiniz kategoriye ait Tip seçimi yapmalısınız!"
                        setTimeout(() => {
                            this.error = '';
                        }, 3000);
                    }
                }
                //temel bilgiler
                if (this.showBasic) {
                    if (this.advert.baslik !== '' && this.advert.toplamAdet != 0 && this.advert.toplamFiyat != 0 && this.advert.aciklama !== '') {
                        this.isEnterBasic = true;
                        this.error = "";
                        this.showPhotoUploader = true;
                    } else {
                        this.error = "* Lütfen alanları doldurunuz!"
                        setTimeout(() => {
                            this.error = '';
                        }, 3000);

                    }

                }
                //resim ekleme
                if (this.showPhotoUploader) {
                    if (this.files.length > 0 || this.images.length > 0) {
                        this.isPhotosSelected = true;
                        this.error = "";
                        this.showEnterDetail = true;
                    } else {
                        this.error = "* Lütfen fotoğraf ekleyiniz!"
                        setTimeout(() => {
                            this.error = '';
                        }, 3000);
                    }
                }

            },
            back() {
                if (this.isTipSelected) {
                    this.returnTipSelection();
                    return;
                }

                if (this.isCategorySelected) {
                    this.returnCategorySelection();
                    return;
                } else {
                    history.back();
                }
            },
            //RESET PAGE
            returnCategorySelection() {
                this.progressText = "Kategori Seçimi";
                this.progress = "width: 15%;"
                this.isCategorySelected = false;
                this.breadcrumb = "";
                this.subCategory1 = [];
                this.selectedCategory = "";
                this.isTipSelected = false;
                this.selectedTips = [];
                this.leftItems = [];
                this.rightItems = [];
                this.showTipSelect = false;
                this.showBasic = false;
                this.showPhotoUploader = false;
                this.isPhotosSelected = false;
            },
            returnTipSelection() {
                this.progressText = "Tip Seçimi";
                this.progress = "width: 30%;"
                this.isTipSelected = false;
                this.showTipSelect = true;
                this.selectedTips = [];
                this.showBasic = false;
                this.showPhotoUploader = false;
                this.isPhotosSelected = false;

            },
            //RESET PAGE
            //SELECT PHOTO
            OnDragEnter(e) {
                e.preventDefault();

                this.dragCount++;
                this.isDragging = true;
                return false;
            },
            OnDragLeave(e) {
                e.preventDefault();
                this.dragCount--;
                if (this.dragCount <= 0)
                    this.isDragging = false;
            },
            onInputChange(e) {
                const files = e.target.files;
                Array.from(files).forEach(file => this.addImage(file));
            },
            onDrop(e) {
                e.preventDefault();
                e.stopPropagation();
                this.isDragging = false;
                const files = e.dataTransfer.files;
                Array.from(files).forEach(file => this.addImage(file));
            },
            addImage(file) {

                this.files.push(file);
                const img = new Image(),
                    reader = new FileReader();
                reader.onload = (e) => this.images.push(e.target.result);
                reader.readAsDataURL(file);

            },
            clarAllImage() {
                this.files = [];
                this.images = [];
            },
            getFileSize(size) {
                if (size > 900000)
                    return (size / (1024 * 1024)).toFixed(1).toString() + ' MB';
                else
                    return (size / (1024)).toFixed(1).toString() + ' KB';
            },
            upload() {
                const formData = new FormData();

                this.files.forEach(file => {
                    formData.append('images[]', file, file.name);
                });
                localStorage.photos(formData);

            },
            //SELECT PHOTO
            //SELECT TIPS
            selectTips(event, id) {
                let array = [];
                this.leftItems.forEach(e => {
                    if (e.id == id) {
                        this.rightItems.push(e);
                        return;
                    }
                    array.push(e);
                });
                this.leftItems = array;
            },
            removeTips(event, id) {
                let array = [];
                this.rightItems.forEach(e => {
                    if (e.id == id) {
                        this.leftItems.push(e);
                        return;
                    }
                    array.push(e);
                });
                this.rightItems = array;
            },
            //SELECT TIPS            
            //SELECT CATEGORY
            selectSubCategory1(event, id) {
                //event.target.className = "active";
                this.selectedCategory = [];
                this.subCategory2 = [];
                this.subCategory3 = [];
                this.subCategory4 = [];
                this.breadcrumb = [];

                let selectedSub = this.parentCategories.filter((s) => s.id === id);
                this.breadcrumb.push(selectedSub[0].name);
                //console.log(this.breadcrumb);
                selectedSub[0].subCategories.length > 0 ? this.isCategorySelected = false : this.isCategorySelected = true;
                if (this.isCategorySelected) {
                    this.selectedCategory.push(selectedSub);

                }
                else
                    this.subCategory1 = selectedSub[0].subCategories;

            },
            selectSubCategory2(event, id) {
                //event.target.className = "active";
                this.selectedCategory = [];
                this.subCategory3 = [];
                this.subCategory4 = [];

                let selectedSub = this.subCategory1.filter((s) => s.id === id);
                this.breadcrumb.push(selectedSub[0].name);
                //console.log(this.breadcrumb);
                selectedSub[0].subCategories.length > 0 ? this.isCategorySelected = false : this.isCategorySelected = true;
                if (this.isCategorySelected) {
                    this.selectedCategory = selectedSub[0];
                    window.sessionStorage.setItem("category", this.selectedCategory);
                }
                else
                    this.subCategory2 = selectedSub[0].subCategories;
            },
            selectSubCategory3(event, id) {
                //event.target.className = "active";
                this.selectedCategory = [];
                this.subCategory4 = [];

                let selectedSub = this.subCategory2.filter((s) => s.id === id);
                this.breadcrumb.push(selectedSub[0].name);
                //console.log(this.breadcrumb);
                selectedSub[0].subCategories.length > 0 ? this.isCategorySelected = false : this.isCategorySelected = true;
                if (this.isCategorySelected) {
                    this.selectedCategory = selectedSub[0];
                    window.sessionStorage.setItem("category", this.selectedCategory);
                }
                else
                    this.subCategory3 = selectedSub[0].subCategories;

            },
            selectSubCategory4(event, id) {
                //event.target.className = "active";
                this.selectedCategory = [];

                let selectedSub = this.subCategory3.filter((s) => s.id === id);
                this.breadcrumb.push(selectedSub[0].name);
                //console.log(this.breadcrumb);
                selectedSub[0].subCategories.length > 0 ? this.isCategorySelected = false : this.isCategorySelected = true;
                if (this.isCategorySelected) {
                    this.selectedCategory = selectedSub[0];
                    window.sessionStorage.setItem("category", this.selectedCategory);
                }
                else
                    this.subCategory4 = selectedSub[0].subCategories;

            },
            //SELECT CATEGORY


        },
        computed: {

        },
        watch: {
            isCategorySelected: function () {
                if (this.isCategorySelected) {
                    this.progressText = "Tip Seçimi";
                    this.progress = "width: 30%;"
                    this.leftItems = this.selectedCategory.tips;
                    this.showCategorySelect = false;
                } else {
                    this.showCategorySelect = true;
                }
            },
            selectedCategory: function () {
                if (this.isCategorySelected) {
                    this.advert.category = this.selectedCategory;
                    this.showTipSelect = true;
                    this.leftItems = this.selectedCategory.tips;
                }

            },
            isTipSelected: function () {
                if (this.isTipSelected) {
                    this.progressText = "İlan Bilgileri";
                    this.progress = "width: 45%;"
                    this.selectedTips = this.rightItems;
                    this.showTipSelect = false;
                }

            },
            selectedTips: function () {
                if (this.selectedTips.length > 0) {
                    this.selectedTips.forEach((t) => {
                        let ad = {
                            adet: 0,
                            fiyat: 0,
                            detay: '',
                            tip: [],
                            irk: [],
                            yas: [],
                        };
                        ad.tip = t;
                        console.log(t);
                        this.advert.advertDetails.push(ad);
                    });
                } else {
                    this.advert.advertDetails = [];
                }
            },
            isEnterBasic: function () {
                if (this.isEnterBasic) {
                    this.progressText = "Fotoğraf";
                    this.progress = "width: 60%;"
                    this.showBasic = false;
                }
            },
            isPhotosSelected: function () {
                if (this.isPhotosSelected) {
                    this.progressText = "Detay";
                    this.progress = "width: 80%;"
                    this.showPhotoUploader = false;
                }
            },


        },
        created() {
            axios.get('/api/category/parents')
                .then(response => {
                    this.parentCategories = response.data;
                    //console.log(this.parentCategories);
                });
        },
        mounted() {

        },
        beforeDestroy() {
            //console.log("Component Destroyed")
        },


    });



</script>

<style scoped>
    /*Step Form*/
    #step-2,
    #step-3,
    #step-4,
    #step-5 {
        display: none;
    }

    /*Category Step*/
    #sub1,
    #sub2,
    #sub3,
    #sub4,
    #sub5,
    #category {
        display: none;
    }

    /*Category Select-Element*/
    .custom-select {
        font-size: 18px;

    }

    #categoryCat {
        font-size: 20px;
    }

    .custom-select {
        box-sizing: content-box;
        padding: .6em 1.4em .5em .8em;
        border: 1px solid #aaa;
        border-radius: .5em;
        overflow: hidden;



    }

    .custom-select:focus option:checked {}

    .form-right {
        display: block;
        text-align: right;
    }

    /*SIDEBAR*/
    .menu {
        margin: 0;
        padding: 0;
        list-style: none;
        text-decoration: none;
        overflow: hidden;
        height: 200px;
        width: 150px;

    }

    .menu .item {
        overflow: hidden;
    }

    .menu .item .btn {
        display: block;
        padding: 6px 20px;
        background: #4fbfa8;
        color: white;
        position: relative;
    }

    .menu .item .btn:before {
        content: "";
        position: absolute;
        width: 10px;
        height: 10px;
        background: #4fbfa8;
        left: 15px;
        bottom: -6px;
        transform: rotate(45deg);
    }

    .menu .item .btn i {
        margin-right: 10px;
    }

    .menu .item .smenu {
        background: white;
        overflow: hidden;
    }

    .menu .item .smenu a {
        display: block;
        padding-left: 8px;
        color: black;
        font-size: 14px;
        margin: 2px 0;
        position: relative;
    }

    .menu .item .smenu a:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 100%;
        background: #3d9970;
        left: 0;
        top: 0;
        transition: 0.3s;
        opacity: 0;
    }

    .menu .item .smenu a:hover:before {
        opacity: 1;
    }

    .menu .item .smenu .active {
        background: #3d9970;
    }

    .menu .item:target .smenu {
        max-height: 10em;
    }



    .category-icon {
        text-align: left;
        position: absolute;
        height: 20px;
        left: 0;
        margin-left: 5px;
    }

    /*SIDEBAR*/
    /*FADE ANIMATION*/
    .fade-enter-active,
    .fade-leave-active {
        transition: opacity 1s ease;
    }

    .fade-enter,
    .fade-leave-to {
        opacity: 0;
    }

    /*FADE ANIMATION*/
    /*IMAGE-UPLOADER*/
    .uploader {
        width: 100%;
        background: #2196F3;
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
        color: #2196F3;
        border: 3px dashed #2196F3;
    }


    .uploader i {
        font-size: 85px;
    }

    .file-input {
        width: 200px;
        margin: auto;
        height: 68px;
        position: relative;
    }

    .file-input label {
        background: #2196F3;
        color: #fff;
    }

    .iuLabel .pickfile {
        background: #fff;
        color: #2196F3;
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
        background: #2196F3;
        border: 2px solid #03A9F4;
        border-radius: 3px;
        color: #fff;
        font-size: 15px;
        cursor: pointer;
        padding: 2px 5px;
        margin-right: 10px;
    }

    /*IMAGE-UPLOADER*/

    .bs-stepper .step-trigger {
        display: inline-flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
        padding: 20px;
        font-size: 1rem;
        font-weight: 700;
        line-height: 1.5;
        color: #6c757d;
        text-align: center;
        text-decoration: none;
        white-space: nowrap;
        vertical-align: middle;
        user-select: none;
        background-color: transparent;
        border: none;
        border-radius: .25rem;
        transition: background-color .15s ease-out, color .15s ease-out;
    }

    .bs-stepper .step-trigger:not(:disabled):not(.disabled) {
        cursor: pointer;
    }

    .bs-stepper .step-trigger:disabled,
    .bs-stepper .step-trigger.disabled {
        pointer-events: none;
        opacity: .65;
    }

    .bs-stepper .step-trigger:focus {
        color: #007bff;
        outline: none;
    }

    .bs-stepper .step-trigger:hover {
        text-decoration: none;
        background-color: rgba(0, 0, 0, .06);
    }

    @media (max-width: 520px) {
        .bs-stepper .step-trigger {
            flex-direction: column;
            padding: 10px;
        }
    }

    .bs-stepper-label {
        display: inline-block;
        margin: .25rem;
    }

    .bs-stepper-header {
        display: flex;
        align-items: center;
    }

    @media (max-width: 520px) {
        .bs-stepper-header {
            margin: 0 -10px;
            text-align: center;
        }
    }

    .bs-stepper-line,
    .bs-stepper .line {
        flex: 1 0 32px;
        min-width: 1px;
        min-height: 1px;
        margin: auto;
        background-color: rgba(0, 0, 0, .12);
    }

    @media (max-width: 400px) {

        .bs-stepper-line,
        .bs-stepper .line {
            flex-basis: 20px;
        }
    }

    .bs-stepper-circle {
        display: inline-flex;
        align-content: center;
        justify-content: center;
        width: 2em;
        height: 2em;
        padding: .5em 0;
        margin: .25rem;
        line-height: 1em;
        color: #fff;
        background-color: #6c757d;
        border-radius: 1em;
    }

    .active .bs-stepper-circle {
        background-color: #007bff;
    }

    .bs-stepper-content {
        padding: 0 20px 20px;
    }

    @media (max-width: 520px) {
        .bs-stepper-content {
            padding: 0;
        }
    }

    .bs-stepper.vertical {
        display: flex;
    }

    .bs-stepper.vertical .bs-stepper-header {
        flex-direction: column;
        align-items: stretch;
        margin: 0;
    }

    .bs-stepper.vertical .bs-stepper-pane,
    .bs-stepper.vertical .content {
        display: block;
    }

    .bs-stepper.vertical .bs-stepper-pane:not(.fade),
    .bs-stepper.vertical .content:not(.fade) {
        display: block;
        visibility: hidden;
    }

    .bs-stepper-pane:not(.fade),
    .bs-stepper .content:not(.fade) {
        display: none;
    }

    .bs-stepper .content.fade,
    .bs-stepper-pane.fade {
        visibility: hidden;
        transition-duration: .3s;
        transition-property: opacity;
    }

    .bs-stepper-pane.fade.active,
    .bs-stepper .content.fade.active {
        visibility: visible;
        opacity: 1;
    }

    .bs-stepper-pane.active:not(.fade),
    .bs-stepper .content.active:not(.fade) {
        display: block;
        visibility: visible;
    }

    .bs-stepper-pane.dstepper-block,
    .bs-stepper .content.dstepper-block {
        display: block;
    }

    .bs-stepper:not(.vertical) .bs-stepper-pane.dstepper-none,
    .bs-stepper:not(.vertical) .content.dstepper-none {
        display: none;
    }

    .vertical .bs-stepper-pane.fade.dstepper-none,
    .vertical .content.fade.dstepper-none {
        visibility: hidden;
    }

    /*CAROUSEL*/
    .view-product {
        position: relative;
    }

    .view-product img {
        border: 1px solid #F7F7F0;
        height: auto;
        width: 100%;
    }

    /*CAROUSEL*/
</style>