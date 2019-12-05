<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템 - 가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>

</head>
<body>
<%-- <c:set var="userNum"><sec:authentication property="principal.user.userNum"/></c:set> --%>
<div class="main-section">
<%-- <jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include> --%>


<form action="/addUser" method="POST">
<section class="ftco-section bg-light" id="inputs">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md-12">
				<h2 class="heading-section">가입</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-sm-8">
				<div class="form-group">
					<input type="text" name="userId" class="form-control" required>
					<label class="form-control-placeholder" for="userId">ID</label>			
				</div>
			</div>
		</div><br>
		
		<div class="row">
			<div class="col-lg-8 col-sm-8">
				<div class="form-group">
					<input type="password" name="password" class="form-control" required>
					<label class="form-control-placeholder" for="password">PW</label>			
				</div>
			</div>
		</div><br>
		
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<div class="form-group">
					<input type="text" name="name" class="form-control" required>
					<label class="form-control-placeholder" for="name">이름</label>			
				</div>
			</div>
			<div class="col-lg-4 col-sm-4">
				<div class="form-group">
					<input type="text" name="userNum" class="form-control" required>
					<label class="form-control-placeholder" for="userNum">사원번호</label>			
				</div>
			</div>
		</div><br>
		
		
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<div class="form-group">
					<select name="position" class="form-control">
						<option>사원</option>
						<option>대리</option>
						<option>과장</option>
						<option>차장</option>
						<option>부장</option>
						<option>팀장</option>
						<option>상무</option>
						<option>이사</option>
					</select>
					<label class="form-control-placeholder" for="position">직급</label>			
				</div>
			</div>
			<div class="col-lg-4 col-sm-4">
				<div class="form-group">
					<select name="department" class="form-control">
						<option>영업 1팀</option>
						<option>영업 2팀</option>
						<option>마케팅</option>
					</select>
					<label class="form-control-placeholder" for="department">부서</label>			
				</div>
			</div>
		</div><br><br>
		
		
		<button class="btn btn-primary">확인</button>
		<a href="#" onclick="history.back();" class="btn btn-primary" style="float: right;">돌아가기</a>
<!-- 		<button type="reset" class="btn btn-primary" style="float: right;" >다시 작성</button> -->
	</div>
</section>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<!-- - - - - -end- - - - -  -->


<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>

</div>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>


<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>

</body>
</html>