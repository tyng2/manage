<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분기별 매출 계획</title>
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

	<h3>2020년 분기별 매출 계획</h3>
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
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>개발용역부문</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>유지보수부문</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>합계</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>