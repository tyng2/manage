<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템 - 예산 보고서</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
<script src="/resources/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#getReport").click(function() {
		$getReport = $("#getReport").attr("disabled", "disabled");
		var param = JSON.stringify({
			year: $("#year").val(),
			team: $("#team").val()
		});
		
		alert(param);
		$.ajax({
			contentType: "application/json; charset=UTF-8",
			url: "bpReport",
			type: "POST",
			dataType: "json",
			beforeSend: function(xhr) {
// 				xhr.setRequestHeader("X-Ajax-call", "true");
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			}, // ajax 코드 예외처리 방지
			data: param,
			success: function(result) {
				console.log("ajax Success : " + result[0].toString());
				report(result);
			}
			
		});
		$getReport = $("#getReport").removeAttr("disabled");
		
	});
});

function report(result) {
	
	var output = "<h3>" + result[0].year + "년 분기별 매출 계획</h3>";
	
	$("#report").html(output);
}
</script>
</head>
<body>

<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

	
<section class="ftco-section pb-0">
<div class="container">
	<div class="row">
		<div class="col-md-12 pd4 heading-title">
		<h2 class="heading-section">예산 보고서 확인</h2><br><br>

		<form action="/bpReport" method="POST">
		<div class="row" style="margin-bottom: 5rem;">
			<div class="col-lg-4 col-sm-4">
			<div class="form-group">
			<select name="year" id="year" class="form-control" required="required">
				<c:forEach var="year" items="${listYear }">
					<option value="${year }">${year }년</option>
				</c:forEach>
			</select>
			</div>
			</div>
			<c:if test="${select != null }">
			<div class="col-lg-4 col-sm-4">
			<div class="form-group">
				<select name="team" id="team" class="form-control">
					<option>영업 1팀</option>
					<option>영업 2팀</option>
				</select>
			</div>
			</div>
			</c:if>
			<div class="col-lg-3 col-sm-4">
				<button type="button" id="getReport" class="btn btn-primary">확인</button>
				<button class="btn btn-primary">submit버튼</button>
			</div>
			<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}">
		</div>
		</form>
		</div>
	</div>
	<div class="row" id="report"></div>
</div>
</section>


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