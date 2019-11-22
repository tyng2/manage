<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addUser</title>
</head>
<body>
<div>
	<form action="/addUser" class="p-5 bg-white" method="POST">

		<h2 class="h4 text-black mb-5">Sign Up</h2>

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
				<label class="text-black" for="userNum">사원번호</label>
				<input type="text" name="userNum" class="form-control" required>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="name">이름</label>
				<input type="text" name="name" class="form-control" required>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="position">직급</label>
				<select>
					<option>사원</option>
					<option>대리</option>
					<option>과장</option>
					<option>팀장</option>
					<option>상무</option>
					<option>이사</option>
				</select>
			</div>
		</div>
		
		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="department">부서</label>
				<select>
					<option>영업1팀</option>
					<option>영업2팀</option>
					<option>마케팅</option>
				</select>
			</div>
		</div>


		<div class="row form-group">
			<div class="col-md-12">
				<br>
				<button class="btn btn-custom btn-md">입력</button>
				<a href="#" onclick="history.back();" class="btn btn-custom btn-md" style="float: right;">돌아가기</a>
			</div>
		</div>

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>

</body>
</html>