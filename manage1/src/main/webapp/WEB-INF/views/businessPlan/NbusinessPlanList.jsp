<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템 - 예산 목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
<style>
.user {
	color: #FFF;
	text-decoration: blink;
}
.userId {

}

#logout {
	text-decoration: none;
	color: #FFF;
}
</style>
<script>
$(document).ready(function() {
	$("#pageArea").on("click", "input", function() {
		$("#page").val($(this).attr("name"));
		$("#dataForm").submit();
	});
});
</script>
</head>
<body>

<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

	
<section class="ftco-section pb-0">
	<div class="container">
		<div class="row">
			<div class="col-md-12 heading-title">
				<h1>Basic Elements</h1>
				<form action="/businessPlanList" id="dataForm" method="POST">
				<input type="hidden" id="page" name="listPage" value="${listPage}" />
				<table class="table table-light table-hover table-borderless">
				<thead class="thead-dark">
					<tr>
						<th>OPPID</th>
						<th>Product 구분</th>
						<th>프로젝트명</th>
						<th>담당자</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="data" items="${list}">
					<tr onclick="location.href='/businessPlanDtl?oppId=${data.oppId}'" >
						<td>${data.oppId}</td>
						<td>${data.sort2}</td>
						<td>${data.projectName}</td>
						<td>${data.userNum}</td>
					</tr>
				</c:forEach>
				</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</section>



<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>

</div>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>


<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>

</body>
</html>