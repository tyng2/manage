<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-info ftco-navbar-custom" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="/main"><img src="resources/images/kcs.png" height="45px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="dropdown nav-item">
					<a href="#" class="dropdown-toggle nav-link icon d-flex align-items-center" data-toggle="dropdown">
					영업 관리 <b class="caret"></b>
				</a>
					<div class="dropdown-menu dropdown-menu-left">
						<a href="/businessPlan" class="dropdown-item">예산 작성</a>
						<a href="/businessPlanList" class="dropdown-item">예산 목록</a>
					</div></li>
				<li class="nav-item">
					<a href="#" class="nav-link icon d-flex align-items-center">손익 분석</a></li>
				<li class="nav-item">
					<a href="#" class="nav-link icon d-flex align-items-center">
					메뉴3</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link icon d-flex align-items-center">
					메뉴4</a>
				</li>
<!-- 				<li class="nav-item"> -->
<!-- 					<a href="#" class="nav-link icon d-flex align-items-center"> -->
<!-- 					메뉴5</a> -->
<!-- 				</li> -->

			</ul>
		<sec:authorize access="isAuthenticated()">
			<c:set var="userId"><sec:authentication property="principal.user.userId"/></c:set>
			<div class="user" style="min-width: 100px; float: right;">
			<form name="logoutForm" >
				<b id="userId">${userId }</b> | <a href="#" id="logout" onclick="logoutProcess();">로그아웃</a>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
			</div>
		</sec:authorize>
		</div>
	</div>
</nav>
<!-- END nav -->