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
}
</style>
<body>
<h1>Hello world!</h1>

<P>The time on the server is ${serverTime}.</P>

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
</sec:authorize>
</body>
</html>
