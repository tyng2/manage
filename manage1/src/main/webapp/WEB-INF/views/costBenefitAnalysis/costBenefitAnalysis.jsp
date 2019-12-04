<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>(주)케이씨에스 손익 분석 시스템 - 손익 분석 작성</title>
</head>
<body>
	<form action="/costBenefitAnalysis" id="dataForm" method="POST">
	
		<table>
			<thead>
				<tr>
					<th>OPPID</th>
					<th>프로젝트명</th>
					<th>담당자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${list}">
					<tr>
						<td>${data.oppId}</td>
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