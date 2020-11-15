<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="container h-100" id="add-advert">
    <form-wizard @on-complete="onComplete" shape="square" color="#9b59b6">
        <!--KATEGORI-->
        <tab-content title="Kategori" icon="fas fa-minus-square" :before-change="beforeTabSwitch">
            <div class="uk-card uk-card-default uk-width-1">
                <!--HEADER-->
                <div class="uk-card-header">
                    <!--Error Message-->
                    <div class="uk-alert-danger" uk-alert>
                        <a class="uk-alert-close" uk-close></a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.
                        </p>
                    </div>
                    <!--Error Message-->
                    <!--BreadCrumb-->
                    <div class="uk-grid-small uk-flex-middle" uk-grid>
                        <div class="uk-width-auto">
                            <ul class="uk-breadcrumb">
                                <li><span>Kategori</span></li>
                                <li v-for="item  in selectedCategory"><span>{{item.name}}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--BreadCrumb-->
                </div>
                <!--HEADER-->
                <!--BODY-->
                <div class="uk-card-body" v-if="selectedCategory==null">
                    <button class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom"
                        v-for="(item, index) in category" :key="item.id"
                        @click="handleSelectItem(item)">{{item.name}}</button>

                </div>
                <div class="uk-card-body" v-if="selectedCategory!=null">
                    <div class="uk-placeholder uk-text-center">
                        <div class="uk-text-lead">
                            Seçilen Kategori
                        </div>
                    </div>


                </div>
                <!--BODY-->
                <!--FOOTER-->
                <div class="uk-card-footer">

                </div>
                <!--FOOTER-->
            </div>
        </tab-content>
        <!--KATEGORI-->

        <tab-content title="Tip" icon="fas fa-angle-double-down">
            My second tab content
        </tab-content>
        <tab-content title="Last step" icon="fas fa-align-justify">
            Yuhuuu! This seems pretty damn simple
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
                    :style="props.fillButtonStyle">Previous</wizard-button>
            </div>
            <div class="wizard-footer-right">
                <wizard-button v-if="!props.isLastStep" @click.native="props.nextTab()" :style="props.fillButtonStyle">
                    Next</wizard-button>

                <wizard-button v-else @click.native="alert('Done')" class="finish-button"
                    :style="props.fillButtonStyle">{{props.isLastStep ? 'Done' : 'Next'}}</wizard-button>
            </div>
        </template>
    </form-wizard>

</div>