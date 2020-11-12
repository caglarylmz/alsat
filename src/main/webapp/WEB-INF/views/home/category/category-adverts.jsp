<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="liste">
	<c:forEach var="advert" items="${categoryAdverts}">
		<h3>${advert.baslik}</h3>
	</c:forEach>

</div>