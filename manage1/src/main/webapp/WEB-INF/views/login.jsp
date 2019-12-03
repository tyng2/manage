<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Prata&display=swap" rel="stylesheet">

<link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/ionicons.min.css">

<link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="resources/css/nouislider.css">


<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/custom.css">

<!-- Favicon -->   
<link href="resources/images/kcsfav.png" rel="shortcut icon" />
</head>
<body>
<sec:authorize access="isAuthenticated()">
<script>location.href="/main";</script>
</sec:authorize>
<div class="main-section">

<section class="mn-section mn-section-2 section-signup page-header img" style="background-image: url(resources/images/bg_2.jpg);">
<div class="container">
	<div class="row">
	<div class="col-lg-6 col-md-6 ml-auto mr-auto">
		<div class="card card-login py-4">
			<form class="form-login" action="/login" method="POST">
				<div class="card-header card-header-primary text-center">
				<h4 class="card-title">
					<img src="resources/images/kcs.png"><br>
					<br>영업 관리 시스템
				</h4>
					<!--<div class="social-line">
                <a href="#" class="btn-icon d-flex align-items-center justify-content-center">
                  <i class="ion-logo-facebook"></i>
                </a>
                <a href="#" class="btn-icon d-flex align-items-center justify-content-center">
                  <i class="ion-logo-twitter"></i>
                </a>
                <a href="#" class="btn-icon d-flex align-items-center justify-content-center">
                  <i class="ion-logo-googleplus"></i>
                </a>
              </div>-->
				</div>
				<!-- <p class="description text-center">Or Be Classical</p> -->
				<div class="card-body pd4 form-group">
					<c:if test="${error != null }">
						<div class="alert alert-danger">
						<div class="container">
							<div class="d-flex">
								<div class="alert-icon">
									<i class="ion-ios-information-circle-outline"></i>
								</div>
								<p class="mb-0 ml-2"><b>알림:&nbsp;</b>${error }</p>
							</div>
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true"><i class="ion-ios-close"></i></span>
							</button>
						</div>
						</div>
					</c:if>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="ion-ios-contact"></i></span>
						</div>
						<input type="text" name="username" class="form-control" placeholder="계정">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="ion-ios-lock"></i></span>
						</div>
						<input type="password" name="password" class="form-control" placeholder="비밀번호">
					</div>
				</div>
				<div class="footer text-center pd4">
					<button class="btn btn-primary btn-block">로그인</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
	</div>
</div>
</section>



<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>

</div>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.stellar.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/aos.js"></script>

<script src="resources/js/nouislider.min.js"></script>
<script src="resources/js/moment-with-locales.min.js"></script>
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/main.js"></script>

</body>
</html>