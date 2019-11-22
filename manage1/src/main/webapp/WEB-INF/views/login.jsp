<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<div>
	<form action="/login" class="p-5 bg-white" method="POST">

		<h2 class="h4 text-black mb-5">Login</h2>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="userId">ID</label>
				<span id="dupCheck"	style="margin-left: 50px;"></span>
				<input type="text" name="userId" class="form-control" required>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="password">PW</label>
				<input type="password" name="password" class="form-control" required>
			</div>
		</div>


		<div class="row form-group">
			<div class="col-md-12">
				<br>
				<button class="btn btn-custom btn-md">로그인</button>
				<a href="#" onclick="history.back();" class="btn btn-custom btn-md" style="float: right;">돌아가기</a>
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>

</body>
</html>