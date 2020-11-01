<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://localhost:8080/alsat/tags/gridAdvertList" prefix="grid" %>
<%@ taglib uri="http://localhost:8080/alsat/tags/sliderAdvertList" prefix="slider" %>


<div class="liste">
	<!--GRID LIST-->
	<div class="container">
		<!--BASLIK-->
		<div class="uk-column-1-2 mt-1">
			<div class="uk-text text-left ">
				<span class="uk-label uk-label-danger">Vitrin</span>
			</div>
			<a class="uk-link-text float-right" href="#">
				<span class="uk-text"> Tüm Vitrin İlanları</span>
			</a>
		</div>
		<hr class="uk-divider-icon m-0">
		<!--BASLIK-->
		<!--Showcase Adverts-->
		<div class="row">
			<grid:grid-advert-list adverts="${showcaseAdverts}" />
		</div>
		<!--Showcase Adverts-->
	</div>
	<!--GRID LIST-->
	<!--SLIDER LIST-->
	<div class="container mt-5">
		<!--BASLIK-->
		<div class="uk-column-1-2 mt-3">
			<div class="uk-text text-left "><span class="uk-label uk-label-primary">Son İlanlar</span>
			</div>
		</div>
		<hr class="uk-divider-icon m-0">
		<!--BASLIK-->
		<!--Latest Adverts-->
		<slider:slider-advert-list adverts="${latestAdverts}" />
		<!--Latest Adverts-->
	</div>
	<!--SLIDER LIST-->
	<!--GRID LIST-->
	<div class="container mt-5">
		<!--BASLIK-->
		<div class="uk-column-1-2 mt-1">
			<div class="uk-text text-left ">
				<span class="uk-label uk-label-warning">En Çok Gezilen İlanlar</span>
			</div>
		</div>
		<hr class="uk-divider-icon m-0">
		<!--BASLIK-->
		<!--All Adverts except showcase-->
		<div class="row">
			<grid:grid-advert-list adverts="${notShowcaseAdverts}" />
		</div>
		<!--All Adverts except showcase-->
	</div>
	<!--GRID LIST-->

</div>