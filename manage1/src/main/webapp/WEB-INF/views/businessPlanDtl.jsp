<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	$(document).ready(function() {
		$("#pageArea").on("click", "input", function() {
			$("#page").val($(this).attr("name"));
			$("#dataForm").submit();
		});
	});
</script>
<title>상세 페이지</title>
</head>
<body>
	<form action="/businessPlanDtl" id="dataForm" method="POST">
		<input type="hidden" id="page" name="listPage" value="${listPage}" />
		
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
				<c:forEach var="data" items="${list}">
					<tr>
						<td>${data.oppId}</td>
						<td>${data.projectName}</td>
						<td>${data.userNum}</td>
						<td>${data.endUser}</td>
						<td>${data.customer}</td>
						<td>${data.expectedSales}</td>
						<td>${data.expectedPurchase}</td>
						<td>${data.expectedProfit}</td>
						<td>${data.expectedSalesMonth}</td>
						<td>${data.state}</td>
						<td>${data.note}</td>
						<td>${CURRENT_TIMESTAMP}</td>
						<td>${data.customerName}</td>
						<td>${data.customerPhone}</td>
						<td>${data.customerEmail}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div id="pageArea">
			<input type="button" value="처음페이지" name="1" />
			<c:choose>
				<c:when test="${listPage eq 1}">
					<input type="button" value="이전페이지" name="1" />
				</c:when>
				<c:otherwise>
					<input type="button" value="이전페이지" name="${listPage - 1}" />
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pb.startPcount}" end="${pb.endPcount}"
				step="1">
				<c:choose>
					<c:when test="${i eq listPage}">
						<input type="button" value="${i}" name="${i}" disabled="disabled" />
					</c:when>
					<c:otherwise>
						<input type="button" value="${i}" name="${i}" />
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${listPage eq pb.maxPcount}">
					<input type="button" value="다음페이지" name="${pb.maxPcount}" />
				</c:when>
				<c:otherwise>
					<input type="button" value="다음페이지" name="${listPage + 1}" />
				</c:otherwise>
			</c:choose>
			<input type="button" value="마지막페이지" name="${pb.maxPcount}" />
		</div>
		
		<br><input type="button" value="수정하기" />
		<input type="button" value="삭제하기" />
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>