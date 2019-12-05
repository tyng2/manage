<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

</script>
<title>상세 페이지</title>
</head>
<body>
	<form action="/businessPlanDtl" id="dataForm" method="POST">
		
		<table>
			<thead>
				<tr>
					<th>OPPID</th>
					<th>프로젝트명</th>
					<th>담당자</th>
					<th>최종사용자</th>
					<th>납품처</th>
					<th>예상매출액</th>
					<th>예상매입금</th>
					<th>예상이익</th>
					<th>예상매출월</th>
					<th>상태</th>
					<th>비고</th>
					<th>작성일</th>
					<th>고객명</th>
					<th>고객연락처</th>
					<th>고객이메일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${data.oppId}</td>
					<td>${data.projectName}</td>
					<td>${data.userNum}</td>
					<td>${data.endUser}</td>
					<td>${data.customer}</td>
					<td>${data.expectedSales}</td>
					<td>${data.expectedPurchase}</td>
					<td>${data.expectedProfit}</td>
					<td><fmt:formatDate value="${data.expectedSalesMonth}" pattern="yyyy-MM"/></td>
					<td>${data.state}</td>
					<td>${data.note}</td>
					<td><fmt:formatDate value="${data.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${data.customerName}</td>
					<td>${data.customerPhone}</td>
					<td>${data.customerEmail}</td>
				</tr>
			</tbody>
		</table>
		
		<br><input type="button" value="수정" onclick="location.href='/businessPlanUpdate?oppId=${data.oppId}'" />
		<a href="/businessPlanDel?oppId=${data.oppId }">삭제</a>
		<input type="button" value="목록으로" onclick="location.href='/businessPlanList'" style="float: right;" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>