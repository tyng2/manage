<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
tr {
	background-color: #FFCCCC; 
}
td {
	text-align: center;
	background-color: #DDDDDD;
}
</style>
<title>(주)케이씨에스 손익 분석 시스템 - 손익 분석</title>
</head>
<body>
	<form action="/costBenefitAnalysis" id="dataForm" method="POST">
	
		<table>
			<thead>
				<tr>
					<th>OPPID</th>
					<th>프로젝트명</th>
					<th>담당자</th>
					<th>예상매출액</th>
					<th>예상매입금</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${list}">
					<tr onclick="location.href='/costBenefitAnalysisRegi?oppId=${data.oppId}'">
						<td>${data.oppId}</td>
						<td>${data.projectName}</td>
						<td>${data.userNum}</td>
						<td>${data.expectedSales}</td>
						<td>${data.expectedPurchase}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>