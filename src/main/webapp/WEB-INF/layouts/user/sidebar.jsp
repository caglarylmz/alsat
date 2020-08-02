<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sidebar-light-primary">
	<nav class="mt-2">
		<ul class="nav nav-pills nav-sidebar flex-column  nav-compact nav-child-indent" data-widget="treeview"
			role="menu" data-accordion="false">
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link bg-info">
					<i class="nav-icon fas fa-ad"></i>
					<p>
						İlan Yönetimi
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/user/panel" class="nav-link">
							<p>Özet</p>
						</a>
					</li>
					<li class="nav-item has-treeview">
						<a href="#" class="nav-link">
							<p>
								<i class="right fas fa-angle-left"></i>

								<p>İlanlarım</p>
							</p>
						</a>

						<ul class="nav nav-treeview" style="display: block;">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/user/panel/ilanlar" class="nav-link">
									<p>Aktif İlanlar</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/user/panel/ilanlar/pasif" class="nav-link">
									<p>Pasif İlanlar</p>
								</a>
							</li>

						</ul>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link bg-danger">
					<i class="nav-icon fas fa-heart"></i>
					<p>
						Favoriler
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/user/panel/ilanlar/favori" class="nav-link">
							<p>Favori İlanlar</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Favori Satıcılar</p>
						</a>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link bg-secondary">
					<i class="nav-icon fas fa-envelope"></i>
					<p>
						Mesajlar
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="../../index.html" class="nav-link">
							<p>İlan Mesajlarım</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Bilgilendirmeler</p>
						</a>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link bg-warning">
					<i class="nav-icon fas fa-atom"></i>
					<p>
						İşlemler
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="../../index.html" class="nav-link">
							<p>Hesap Hareketlerim</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Kayıtlı Kredi Kartlarım</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Engellediklerim</p>
						</a>
					</li>
				</ul>
			</li>
			<li class="nav-item has-treeview menu-open">
				<a href="#" class="nav-link">
					<i class="nav-icon fas fa-user"></i>
					<p>
						Üyelik
						<i class="right fas fa-angle-left"></i>
					</p>
				</a>
				<ul class="nav nav-treeview" style="display: block;">
					<li class="nav-item">
						<a href="../../index.html" class="nav-link">
							<p>Kişisel Bilgiler</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Eposta</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Cep Telefonu</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Şifre</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="../../index2.html" class="nav-link">
							<p>Üyelik İptali</p>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>
</div>