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
<script src="/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	
});
</script>
<title>손익 분석 작성</title>
</head>
<body>
	<form action="/costBenefitAnalysisRegi" id="dataForm" method="POST">
		
		<table>
			<thead>
				<tr>
					<th>OPPID</th>
					<th>프로젝트명</th>
					<th>담당자</th>
					<th>최종사용자</th>
					<th>납품처</th>
					<th>계약시작</th>
					<th>계약종료</th>
					<th>자동연장기한</th>
					<th>수익인식</th>
					<th>예상매출액</th>
					<th>예상매입금</th>
					<th>예상이익</th>
					<th>내외자</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td><input type="text" name="oppId" value="${data.oppId}" readonly="readonly"></td>
						<td><input type="text" name="projectName" value="${data.projectName}" readonly="readonly"></td>
						<td><input type="text" name="userNum" value="${data.userNum}" readonly="readonly"></td>
						<td><input type="text" name="endUser" value="${data.endUser}"></td>
						<td><input type="text" name="customer" value="${data.customer}"></td>
						<td><input type="date" name="contractDate" value="${data.contractDate}"></td>
						<td><input type="date" name="expiredDate" value="${data.expiredDate}"></td>
						<td><input type="text" name="autoExtension" value="${data.autoExtension}"></td>
						<%-- <td><input type="text" name="profitSort" value="${data.profitSort}"></td> --%>
						<td><select name="profitSort">
							<option value="1">당월</option><option value="2">익월</option>
						</select></td>
						<td><input type="text" name="expectedSales" value="${data.expectedSales}"></td>
						<td><input type="text" name="expectedPurchase" value="${data.expectedPurchase}"></td>
						<td><input type="text" name="expectedProfit" value="${data.expectedProfit}"></td>
						<td><select name="exchangeRate">
							<option value="1">내자</option><option value="2">외자</option>
						</select></td>
					</tr>
			</tbody>
		</table>
		
		<br><input type="submit" value="작성완료" class="btn" />
		<input type="button" value="목록으로" onclick="location.href='/cbAnalysis'" style="float: right;" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>