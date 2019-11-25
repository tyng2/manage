<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<style>
a {
	text-decoration: none;
	color: #882222;
}
</style>
<body>
<p>
테스트 중!
home.jsp
</p>
<sec:authorize access="isAnonymous()">
	<p><a href="/addUser">가입</a></p>
	<p><a href="/login">로그인</a></p>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<c:set var="userId"><sec:authentication property="principal.user.userId"/></c:set>
	<a href="#"><b><span class="hovMenu" >${userId}</span></b></a>&nbsp;님&nbsp;로그인 중<br><br>
	<form action='<c:url value='/logout' />' method="POST" >
	<button>로그아웃</button>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	
	<p>
	<a href="/businessPlan">예산 작성</a>
	</p>
</sec:authorize>
</body>
</html>
