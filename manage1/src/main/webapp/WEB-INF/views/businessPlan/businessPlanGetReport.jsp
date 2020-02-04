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
	
	var date = new Date();
	var output = "<div class='col-md-12 heading-title bp40'><hr>";
	
	if (result[0].month != null) { // 해당 년도 해당 부서의 매출 계획이 존재하는 경우
		output += "<h2 style='text-align: center; padding: 5rem 0 2rem 0;'>" + result[0].year + "년 분기별 매출 계획</h2>";
// 		output += "<h5>" + result[0].yr + "년 " + result[0].month + "월 현재</h5>";
		output += "<h5>" + date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 현재</h5>";
		output += "<h5>부서 : " + result[0].depName + "</h5><h5 style='float: right;'>(단위:백만원)</h5>";
		output += "<table class='table table-light table-hover table-borderless'>";
		output += "<thead class='thead-dark'><tr><th>구분</th><th>1분기</th><th>2분기</th><th>3분기</th><th>4분기</th><th>연간</th></tr></thead>";
		output += "<tbody>";
		output += "<tr><th>물품공급부문</th><td id='bp11'>" + result[0].bp11 + "</td>";
		output += "<td id='bp21'>" + result[0].bp21 + "</td>";
		output += "<td id='bp31'>" + result[0].bp31 + "</td>";
		output += "<td id='bp41'>" + result[0].bp41 + "</td>";
		output += "<td id='bp51'>" + (Number(result[0].bp11) + Number(result[0].bp21) + Number(result[0].bp31) + Number(result[0].bp41)) + "</td></tr>";
		output += "<tr><th>개발용역부문</th><td id='bp12'>" + result[0].bp12 + "</td>";
		output += "<td id='bp22'>" + result[0].bp22 + "</td>";
		output += "<td id='bp32'>" + result[0].bp32 + "</td>";
		output += "<td id='bp42'>" + result[0].bp42 + "</td>";
		output += "<td id='bp52'>" + (Number(result[0].bp12) + Number(result[0].bp22) + Number(result[0].bp32) + Number(result[0].bp42)) + "</td></tr>";
		output += "<tr><th>유지보수부문</th><td id='bp13'>" + result[0].bp13 + "</td>";
		output += "<td id='bp23'>" + result[0].bp21 + "</td>";
		output += "<td id='bp33'>" + result[0].bp31 + "</td>";
		output += "<td id='bp43'>" + result[0].bp41 + "</td>";
		output += "<td id='bp53'>" + (Number(result[0].bp13) + Number(result[0].bp23) + Number(result[0].bp33) + Number(result[0].bp43)) + "</td></tr>";
		output += "<tr><th>합계</th><td>" + (Number(result[0].bp11) + Number(result[0].bp12) + Number(result[0].bp13)) + "</td>";
		output += "<td>" + (Number(result[0].bp21) + Number(result[0].bp22) + Number(result[0].bp23)) + "</td>";
		output += "<td>" + (Number(result[0].bp31) + Number(result[0].bp32) + Number(result[0].bp33)) + "</td>";
		output += "<td>" + (Number(result[0].bp41) + Number(result[0].bp42) + Number(result[0].bp43)) + "</td>";
		output += "<td>" + (Number(result[0].bp11) + Number(result[0].bp12) + Number(result[0].bp13) 
			+ Number(result[0].bp21) + Number(result[0].bp22) + Number(result[0].bp23) 
			+ Number(result[0].bp31) + Number(result[0].bp32) + Number(result[0].bp33) 
			+ Number(result[0].bp41) + Number(result[0].bp42) + Number(result[0].bp43)) + "</td></tr></tbody></table></div>";
	} else { // 해당 년도 해당 부서의 매출 계획이 없는 경우
		output += "<h2 style='text-align: center; padding: 20px 0 20px 0;'>작성된 매출 계획이 없습니다.</h2></div>";
	}
	
	console.log(result[0].depName);
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
		<div class="row mb-5rem">
			<div class="col-lg-3 col-sm-3">
			<div class="form-group">
			<select name="year" id="year" class="form-control" required="required">
				<c:forEach var="year" items="${listYear }">
					<option value="${year }">${year }년</option>
				</c:forEach>
			</select>
			</div>
			</div>
			<c:if test="${select != null }">
			<div class="col-lg-3 col-sm-3">
			<div class="form-group">
				<select name="team" id="team" class="form-control">
					<option>영업 1팀</option>
					<option>영업 2팀</option>
				</select>
			</div>
			</div>
			</c:if>
			<div class="col-lg-3 col-sm-3">
				<button type="button" id="getReport" class="btn btn-primary">확인</button>
			</div>
			<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}">
		</div>
		</form>
		</div>
	</div>
	<div class="container">
	<div class="row" id="report"></div>
	</div>
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