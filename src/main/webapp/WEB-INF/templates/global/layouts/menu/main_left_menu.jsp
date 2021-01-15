<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


            <div class="bilesen">
                <ul class="ana_menu">
                    <!--SABİT LİSTE-->
                    <li><a href=""><i class="ion-arrow-graph-down-right" style="background:#02050d;"></i>Fiyatı
                            Düşenler</a></li>
                    <li><a href=""><i class="ion-podium" style="background:#02050d;"></i>En Yeni İlanlar</a>
                    </li>
                    <li><a href=""><i class="ion-pricetag" style="background:#02050d;"></i>Yakınımdaki İlanlar</a></li>
                    <li><a href=""><i class="ion-android-time" style="background:#02050d;"></i>Son 48 saat</a><span
                            style="color:#aaa;"> /
                        </span><a href="">1 hafta</a></li>
                    <!--SABİT LİSTE-->
                    <li class="cizgi"></li>
                    <!--KATEGORİ-->

                    
                    <c:forEach var="c" items="${parentCategories}">
                        <c:if test="${c.subCategories != null}">
                            <li class="dropdown"><a href='${pageContext.request.contextPath}/kategori/${c.id}'><i>
                                        <img src="${pageContext.request.contextPath}/resources/main/img/category/${c.icon}"
                                            alt=""></i>${c.name}
                                    <ul>
                                        <c:forEach var="c_sub1" items="${c.subCategories}">
                                            <li><a
                                                    href="${pageContext.request.contextPath}/kategori/${c_sub1.id}">${c_sub1.name}</a><span
                                                    class="toplam">(${c_sub1.adverts.size()})</span>
                                            </li>
                                        </c:forEach>

                                    </ul>
                            </li>
                        </c:if>
                    </c:forEach>

                </ul>
                <!--KATEGORİ-->

            </div>