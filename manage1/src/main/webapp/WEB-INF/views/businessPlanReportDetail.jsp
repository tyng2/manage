<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업 계획 상세 페이지 미구현</title>
<style>
tr {
	background-color: #FFCCCC; 
}
td {
	text-align: center;
	background-color: #DDDDDD;
}
</style>
<script src="/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
// 	$("#pageArea").on("click", "input", function() {
// 		$("#page").val($(this).attr("name"));
// 		$("#dataForm").submit();
// 	});
});
</script>
</head>
<body>
<!-- <p>년 영업 계획</p> -->
<!-- 	<form action="/businessPlanList" id="dataForm" method="POST"> -->
<!-- 		<table> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>Product 구분</th> -->
<!-- 					<th>고객/프로젝트</th> -->
<!-- 					<th>2020 계획<br>(백만원)</th> -->
<!-- 					<th>매출 시기<br>(월)</th> -->
<!-- 					<th>기타<br>(지원 및 고려 사항 등)</th> -->
<!-- 					<th>영업 담당자</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach var="data" items="${list}"> --%>
<%-- 					<tr onclick="location.href='/businessPlanDtl?oppId=${data.oppId}'"> --%>
<%-- 						<td>${data.oppId}</td> --%>
<%-- 						<td>${data.sort2}</td> --%>
<%-- 						<td>${data.projectName}</td> --%>
<%-- 						<td>${data.userNum}</td> --%>
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->

<!-- 		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a> -->
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
<!-- 	</form> -->
	
<!-- 	<form action="/bpReport" method="POST"> -->
<!-- 		<select name="year" required="required"> -->
<%-- 			<c:forEach var="year" items="${listYear }"> --%>
<%-- 				<option>${year }년</option> --%>
<%-- 			</c:forEach> --%>
<!-- 		</select> -->
<%-- 		<c:if test="${select != null }"> --%>
<!-- 			<select name="team"> -->
<!-- 				<option>영업 1팀</option> -->
<!-- 				<option>영업 2팀</option> -->
<!-- 			</select> -->
<%-- 		</c:if> --%>
<!-- 		<button>보고서</button> -->
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
<!-- 	</form> -->
	
	
	
	
</body>
</html>