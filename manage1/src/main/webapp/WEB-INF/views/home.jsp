<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<p><a href="/addUser">가입</a></p>
<p><a href="/login">로그인</a></p>
</body>
</html>
