<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예산 목록</title>
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
</head>
<body>
	<form action="/businessPlanList" id="dataForm" method="POST">

		<%-- <input type="hidden" name="userNum" value="${userNum}" /><br> --%>
		<table>
			<thead>
				<tr>
					<th>OPPID</th>
					<th>Product 구분</th>
					<th>프로젝트명</th>
					<th>담당자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${list }">
					<tr>
<%-- 					<tr name="${data.userNum}"> --%>
						<td>${data.oppId}</td>
						<td>${data.sort2}</td>
						<td>${data.projectName}</td>
						<td>${data.userNum}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>