<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<html lang=tr>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="AlSat - Kurbanlık, Süt, Tavuk Alım Satım">
    <meta name="keywords" content="alsat,kurbanlık,süt,inek,kuzu,tavuk,düve,yumurta,süt">
    <meta name="author" content="caglarylmz">
    <!-- Title -->
    <title>Alsat | ${title}</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- DataTables -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/select2/css/select2.min.css">
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Carousel -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/lightslider/css/lightslider.min.css">
    <!-- Jquery-steps -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/jquery-steps/jquery.steps.css">
    <!-- FileInput -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/fileinput/css/fileinput.min.css" media="all">
    <!-- overlayScrollbars -->
    <link rel="stylesheet"
        href="${contextRoot}/resources/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/plugins/summernote/summernote-bs4.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${contextRoot}/resources/adminlte/css/adminlte.min.css">
    <link rel="stylesheet" href="${contextRoot}/resources/main/css/style.default.css">

    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <script src="${contextRoot}/resources/assets/js/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</head>

<body class="hold-transition sidebar-collapse layout-top-nav">
    <div class="wrapper">
        <!-- Navbar -->
        <%@include file="../shared/flows-navbar.jsp"%>

        <!-- /.navbar -->
        <div id="app">
            <div class="content-wrapper">
                <!-- Main content -->
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
                                        <span v-if="isCategorySelected">{{selectedCategory.name}}</span>,
                                        <span v-if="isCategorySelected"><a @click=returnCategorySelection type="button"
                                                class="cat">Değiştir</a></span>
                                        {{selectedCategory.name}}
                                        {{deneme.name}}
                                        <div v-if="!isCategorySelected" class="row mb-5">
                                            <div class="card-group">
                                                <div class="card">
                                                    <div class="menu">
                                                        <li class="item">
                                                            <div class="smenu"
                                                                v-for=" (item, index) in parentCategories">
                                                                <a @click=selectSubCategory1($event,item.id)
                                                                    type="button" class="cat">{{item.name}} </a>
                                                            </div>
                                                        </li>
                                                    </div>
                                                </div>
                                                <div v-if='subCategory1.length > 0' class="card">
                                                    <div class="menu">
                                                        <li class="item">
                                                            <div class="smenu" v-for=" (item, index) in subCategory1">
                                                                <a @click=selectSubCategory2($event,item.id)
                                                                    type="button" class="cat">{{item.name}} </a>
                                                            </div>
                                                        </li>
                                                    </div>
                                                </div>
                                                <div v-if='subCategory2.length > 0' class="card">
                                                    <div class="menu">
                                                        <li class="item">
                                                            <div class="smenu" v-for=" (item, index) in subCategory2">
                                                                <a @click=selectSubCategory3($event,item.id)
                                                                    type="button" class="cat">{{item.name}} </a>
                                                            </div>
                                                        </li>
                                                    </div>
                                                </div>
                                                <div v-if='subCategory3.length > 0' class="card">
                                                    <div class="menu">
                                                        <li class="item">
                                                            <div class="smenu" v-for=" (item, index) in subCategory3">
                                                                <a @click=selectSubCategory4($event,item.id)
                                                                    type="button" class="cat">{{item.name}} </a>
                                                            </div>
                                                        </li>
                                                    </div>
                                                </div>
                                                <div v-if='subCategory4.length > 0' class="card">
                                                    <div class="menu">
                                                        <li class="item">
                                                            <div class="smenu" v-for=" (item, index) in subCategory4">
                                                                <a @click=selectSubCategory5($event,item.id)
                                                                    type="button" class="cat">{{item.name}} </a>
                                                            </div>
                                                        </li>
                                                    </div>
                                                </div>
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
                                                    <a href="${flowExecutionUrl}&_eventId_home"
                                                        class="btn btn-danger">İptal</a>
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




            </div>
            <!-- /.content -->

        </div>
        <!-- ./wrapper -->
    </div>


    <!-- REQUIRED SCRIPTS -->
    <!-- jQuery -->
    <script src="${contextRoot}/resources/adminlte/plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="${contextRoot}/resources/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- For Jquery -->
    <script>
        window.contextRoot = "${contextRoot}";
        $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="${contextRoot}/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables -->
    <script src="${contextRoot}/resources/adminlte/plugins/datatables/jquery.dataTables.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
    <!-- ChartJS -->
    <script src="${contextRoot}/resources/adminlte/plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="${contextRoot}/resources/adminlte/plugins/sparklines/sparkline.js"></script>
    <!--lightslider-->
    <script src="${contextRoot}/resources/adminlte/plugins/lightslider/js/lightslider.min.js">
    </script>
    <!-- jQuery Knob Chart -->
    <script src="${contextRoot}/resources/adminlte/plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="${contextRoot}/resources/adminlte/plugins/moment/moment.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script
        src="${contextRoot}/resources/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js">
        </script>
    <!-- Select2 -->
    <script src="${contextRoot}/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
    <!-- Bootstrap4 Duallistbox -->
    <script
        src="${contextRoot}/resources/adminlte/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="${contextRoot}/resources/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
    <!-- Summernote -->
    <script src="${contextRoot}/resources/adminlte/plugins/summernote/summernote-bs4.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/jquery-steps/jquery.steps.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="${contextRoot}/resources/adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js">
    </script>
    <!-- fileinput -->
    <script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/plugins/piexif.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/plugins/sortable.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/plugins/purify.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/fileinput.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/fileinput/themes/fas/theme.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/plugins/fileinput/js/locales/tr.js"></script>
    <!-- adminLTE App -->
    <script src="${contextRoot}/resources/adminlte/js/bootbox.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/js/adminlte.min.js"></script>
    <script src="${contextRoot}/resources/adminlte/js/demo.js"></script>

    <script>

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
        })

        new Vue({
            el: '#app',
            data: {
                parentCategories: [],
                subCategory1: [],
                subCategory2: [],
                subCategory3: [],
                subCategory4: [],
                selectedCategory: [],
                isCategorySelected: false,
                isActive: false,
                deneme:[]
            },
            methods: {
                selectSubCategory1(event, id) {
                    //event.target.className = "active";
                    this.selectedCategory = "";
                    this.subCategory2 = [];
                    this.subCategory3 = [];
                    this.subCategory4 = [];

                    let selectedSub = this.parentCategories.filter((s) => s.id === id);
                    if (selectedSub[0].subCategories.length > 0) this.isCategorySelected = false; else this.isCategorySelected = true;
                    if (this.isCategorySelected) {
                        this.selectedCategory = selectedSub[0];
                        localStorage.category = this.selectedCategory;
                    }
                    else
                        this.subCategory1 = selectedSub[0].subCategories;

                },
                selectSubCategory2(event, id) {
                    //event.target.className = "active";
                    this.selectedCategory = "";
                    this.subCategory3 = [];
                    this.subCategory4 = [];

                    let selectedSub = this.subCategory1.filter((s) => s.id === id);
                    if (selectedSub[0].subCategories.length > 0) this.isCategorySelected = false; else this.isCategorySelected = true;
                    if (this.isCategorySelected) {
                        this.selectedCategory = selectedSub[0];
                        localStorage.category = this.selectedCategory;
                    }
                    else
                        this.subCategory2 = selectedSub[0].subCategories;
                },
                selectSubCategory3(event, id) {
                    //event.target.className = "active";
                    this.selectedCategory = "";
                    this.subCategory4 = [];

                    let selectedSub = this.subCategory2.filter((s) => s.id === id);
                    if (selectedSub[0].subCategories.length > 0) this.isCategorySelected = false; else this.isCategorySelected = true;
                    if (this.isCategorySelected) {
                        this.selectedCategory = selectedSub[0];
                        localStorage.category = this.selectedCategory;
                    }
                    else
                        this.subCategory3 = selectedSub[0].subCategories;

                },
                selectSubCategory4(event, id) {
                    //event.target.className = "active";
                    this.selectedCategory = "";

                    let selectedSub = this.subCategory3.filter((s) => s.id === id);
                    if (selectedSub[0].subCategories.length > 0) this.isCategorySelected = false; else this.isCategorySelected = true;
                    if (this.isCategorySelected) {
                        this.selectedCategory = selectedSub[0];
                        localStorage.category = this.selectedCategory;
                    }
                    else
                        this.subCategory4 = selectedSub[0].subCategories;

                },
                returnCategorySelection() {
                    this.isCategorySelected = false;
                }


            },
            computed: {
                messagex: function () {
                    return this.message + new Date().toLocaleString();
                }
            },
            watch: {
                deneme(selectedCategory) {
                   deneme=localStorage.category
                }
            },
            created() {
                axios.get('/api/category/parents')
                    .then(response => {
                        this.parentCategories = response.data;
                        console.log(this.parentCategories);
                    });
            },
            mounted() {

            },
            beforeDestroy() {
                console.log("Component Destroyed")
            },


        });


    </script>

    <style>
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
    </style>


</body>

</html>