<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${year }년 분기별 매출 계획</title>
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

</head>
<body>
	<form action="/businessPlanList" id="dataForm" method="POST">

	<h3>${year }년 분기별 매출 계획</h3>
	<p>2019년 10월 현재</p>
	<div>
	<p>부서 : </p>
	<p>(단위:백만원)</p>
	</div>
		<table>
			<thead>
				<tr>
					<th>구분</th>
					<th>1분기</th>
					<th>2분기</th>
					<th>3분기</th>
					<th>4분기</th>
					<th>연간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>물품공급부문</th>
					<td id="bp11">${bp.bp11 }</td>
					<td id="bp21">${bp.bp21 }</td>
					<td id="bp31">${bp.bp31 }</td>
					<td id="bp41">${bp.bp41 }</td>
					<td id="bp51"></td>
				</tr>
				<tr>
					<th>개발용역부문</th>
					<td id="bp12">${bp.bp12 }</td>
					<td id="bp22">${bp.bp22 }</td>
					<td id="bp32">${bp.bp32 }</td>
					<td id="bp42">${bp.bp42 }</td>
					<td id="bp52"></td>
				</tr>
				<tr>
					<th>유지보수부문</th>	
					<td id="bp13">${bp.bp13 }</td>
					<td id="bp23">${bp.bp23 }</td>
					<td id="bp33">${bp.bp33 }</td>
					<td id="bp43">${bp.bp43 }</td>
					<td id="bp53"></td>
				</tr>
				<tr>
					<th>합계</th>
					<td id="sum10"></td>
					<td id="sum20"></td>
					<td id="sum30"></td>
					<td id="sum40"></td>
					<td id="sum"></td>
				</tr>
			</tbody>
		</table>
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
<script>
$(document).ready(function() {
	var bp51 = Number($("#bp11").text()) + Number($("#bp21").text()) + Number($("#bp31").text()) + Number($("#bp41").text());
	var bp52 = Number($("#bp12").text()) + Number($("#bp22").text()) + Number($("#bp32").text()) + Number($("#bp42").text());
	var bp53 = Number($("#bp13").text()) + Number($("#bp23").text()) + Number($("#bp33").text()) + Number($("#bp43").text());
	
	var sum10 = Number($("#bp11").text()) + Number($("#bp12").text()) + Number($("#bp13").text());
	var sum20 = Number($("#bp21").text()) + Number($("#bp22").text()) + Number($("#bp23").text());
	var sum30 = Number($("#bp31").text()) + Number($("#bp32").text()) + Number($("#bp33").text());
	var sum40 = Number($("#bp41").text()) + Number($("#bp42").text()) + Number($("#bp43").text());
	var sum = sum10 + sum20 + sum30 + sum40;
	
	$("#bp51").html(bp51);
	$("#bp52").html(bp52);
	$("#bp53").html(bp53);
	
	$("#sum10").html(sum10);
	$("#sum20").html(sum20);
	$("#sum30").html(sum30);
	$("#sum40").html(sum40);
	$("#sum").html(sum);
	
	
});
</script>
</body>
</html>