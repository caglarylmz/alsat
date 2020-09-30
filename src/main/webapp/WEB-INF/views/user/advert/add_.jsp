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
                                        <td style="vertical-align: middle; width: 10%;"><b>Seçilen Kategori :</b></td>
                                        <td style="vertical-align: middle; ">
                                            <span class="breadcrumb-item" v-for="(item, index)  in breadcrumb">{{item}}
                                            </span>
                                        </td>
                                        <td style="vertical-align: middle;float: right;"><button
                                                @click=returnCategorySelection
                                                class="btn btn-outline-secondary ">Değiştir</button></td>

                                    </tr>
                                    <tr v-if="isTipSelected">
                                        <td style="vertical-align: middle; width: 10%;"><b>Seçilen Tipler :</b></td>
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
                            <div class="col-12  text-center">
                                <transition name="fade">
                                    <b class="text-danger">{{error}}</b>
                                </transition>
                            </div>
                            <!-- CATEGORY SELECT-->
                            <div v-if="!isCategorySelected" class="row mb-5 ">
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
                            <div class="row row justify-content-md-center" v-if="showTipSelect">
                                <div class="card">
                                    <div class="card-header text-center">
                                        <b>Kategoriye Ait Tipler</b>
                                    </div>
                                    <div class="card-body">
                                        <div class="menu">
                                            <li class="item">
                                                <div class="smenu" v-for="(item, index) in leftItems">
                                                    <a @click=selectTips($event,item.id) type="button"
                                                        class="cat">{{item.name}} </a>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header text-center">
                                        <b>Seçilen Tipler</b>
                                    </div>
                                    <div class="card-body">
                                        <div class="menu">
                                            <li class="item">
                                                <div class="smenu" v-for="(item, index) in rightItems">
                                                    <a @click=removeTips($event,item.id) type="button"
                                                        class="cat">{{item.name}} </a>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--Select TIP-->

                            <!--İlan Bilgiler Gir-->
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover table-borderless text-nowrap">
                                    <tbody>
                                        <tr>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">İlan Başlığı</label>
                                                <input type="email" class="form-control" id="exampleInputEmail1"
                                                    aria-describedby="emailHelp">
                                                <small id="emailHelp" class="form-text text-muted">İlan'ı tanımlayacak
                                                    bir başlık giriniz</small>
                                            </div>
                                        </tr>
                                        <tr>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Toplam Adet </span>
                                                </div>
                                                <input type="number" step="1" class="form-control" placeholder="0"
                                                    aria-label="Toplam Adet" aria-describedby="basic-addon1">
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
                                                <input type="number" step="100" class="form-control" placeholder="0.00"
                                                    aria-label="Toplam Fiyat" aria-describedby="basic-addon1">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">₺</span>
                                                </div>
                                            </div>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--İlan Bilgiler Gir-->








                            <!-- CATEGORY SELECT-->
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

    new Vue({
        el: '#app',
        data: {
            progressText: "Kategori Seçimi",
            progress: "width: 15%;",
            error: '',
            parentCategories: [],
            subCategory1: [],
            subCategory2: [],
            subCategory3: [],
            subCategory4: [],
            selectedCategory: "",
            breadcrumb: "",
            isCategorySelected: false,
            isActive: false,
            isTipSelected: false,
            showTipSelect: false,
            leftItems: [],
            rightItems: [],
            selectedTips: [],

        },
        methods: {
            next() {
                //Kategori seçimi
                if (!this.isCategorySelected) {
                    this.error = "* Bir kategori seçmelisiniz!"
                    setTimeout(() => {
                        this.error = '';
                    }, 3000);
                }
                //Tip Seçimi
                if (this.rightItems.length > 0) {
                    this.isTipSelected = true;
                }
                if (!this.isTipSelected) {

                    this.error = "* Seçtiğiniz kategoriye ait Tip seçimi yapmalısınız!"
                    setTimeout(() => {
                        this.error = '';
                    }, 3000);
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
            returnCategorySelection() {
                this.progressText = "Kategori Seçimi";
                this.progress = "width: 15%;"
                this.isCategorySelected = false;
                this.selectedCategory = "";
                this.isTipSelected = false;
                this.selectedTips = [];
                this.leftItems = [];
                this.rightItems = [];
            },
            returnTipSelection() {
                this.progressText = "Tip Seçimi";
                this.progress = "width: 30%;"
                this.isTipSelected = false;
                this.selectedTips = [];
            },
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

        },
        computed: {

        },
        watch: {
            isCategorySelected: function () {
                if (this.isCategorySelected) {
                    this.progressText = "Tip Seçimi";
                    this.progress = "width: 30%;"
                    this.leftItems = this.selectedCategory.tips;
                }
            },
            selectedCategory: function () {
                if (Array.isArray(this.selectedCategory.tips)) {
                    this.showTipSelect = true;
                    this.leftItems = this.selectedCategory.tips;
                } else {
                    this.showTipSelect = false;
                }

            },
            isTipSelected: function () {
                if (this.isTipSelected) {
                    this.progressText = "İlan Bilgileri";
                    this.progress = "width: 45%;"
                    this.selectedTips = this.rightItems;
                    this.showTipSelect = false;
                } else {
                    this.showTipSelect = true;
                }

            },
            selectedTips: function () {
                if (this.selectedTips.length > 0) {

                }
            }
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

    Vue.component('categoeries-box', {
        props: ['item', 'index'],
        data: function () {
            return {
                category,
                selected,
            }
        },
        methods: {
            shout(v) {
                this.$emit('selectCategory', { value: this.selected });
            }
        },
        template: '<li v-on:click="shout(index)" v-bind:class="item.color">{{index+1}}. {{item.name}}</li>'
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
</style>