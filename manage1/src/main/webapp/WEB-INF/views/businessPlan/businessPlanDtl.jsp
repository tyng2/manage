<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
<script src="/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
<title>상세 페이지</title>
</head>
<body>

<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>


<section class="ftco-section pb-0">
	<div class="container">
		<div class="row">
			<form action="/businessPlanDtl" id="dataForm" method="POST">
				<input type="hidden" id="page" name="listPage" value="${listPage}" />
				<table class="table table-light table-hover table-borderless">
				<thead class="thead-dark">

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
						<td>${data.expectedSalesMonth}</td>
						<td>${data.state}</td>
						<td>${data.note}</td>
						<td>${CURRENT_TIMESTAMP}</td>
						<td>${data.customerName}</td>
						<td>${data.customerPhone}</td>
						<td>${data.customerEmail}</td>
					</tr>
				</tbody>
			</tbody>
		</table>
		
		<br><input type="button" value="수정" onclick="location.href='/businessPlanUpdate?oppId=${data.oppId}'" />
		<a href="/businessPlanDel?oppId=${data.oppId }">삭제</a>
		<input type="button" value="목록으로" onclick="location.href='/businessPlanList'" style="float: right;" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
	</form>
		</div>
		</div>
</section>
	</div>
	
<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>	
	
</body>
</html>