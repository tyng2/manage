<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
$(document).ready(function() {
	$("#pageArea").on("click", "input", function() {
		$("#page").val($(this).attr("name"));
		$("#dataForm").submit();
	});
});
</script>
</head>
<body>
	<form action="/businessPlanList" id="dataForm" method="POST">
		<input type="hidden" id="page" name="listPage" value="${listPage}" />
		
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
				<c:forEach var="data" items="${list}">
					<tr onclick="location.href='/businessPlanDtl?oppId=${data.oppId}'">
						<td>${data.oppId}</td>
						<td>${data.sort2}</td>
						<td>${data.projectName}</td>
						<td>${data.userNum}</td>
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
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	
	<form action="/bpReport" method="POST">
		<select name="year" required="required">
			<c:forEach var="year" items="${listYear }">
				<option>${year }년</option>
			</c:forEach>
		</select>
		<c:if test="${select != null }">
			<select name="team">
				<option>영업 1팀</option>
				<option>영업 2팀</option>
			</select>
		</c:if>
		<button>보고서</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	
	
	
	
</body>
</html>