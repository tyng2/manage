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
<title>수정 페이지</title>
</head>
<body>

<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

<section class="ftco-section pb-0">
	<div class="container">
		<div class="row">
			<form action="/businessPlanUpdate" id="dataForm" method="POST">
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
						<td><input type="text" name="oppId" value="${data.oppId}" readonly="readonly"></td>
						<td><input type="text" name="projectName" value="${data.projectName}"></td>
						<td><input type="text" name="userNum" value="${data.userNum}"></td>
						<td><input type="text" name="endUser" value="${data.endUser}"></td>
						<td><input type="text" name="customer" value="${data.customer}"></td>
						<td><input type="text" name="expectedSales" value="${data.expectedSales}"></td>
						<td><input type="text" name="expectedPurchase" value="${data.expectedPurchase}"></td>
						<td><input type="text" name="expectedProfit" value="${data.expectedProfit}"></td>
						<td><input type="month" name="expectedSalesMonth" value="${data.expectedSalesMonth}"></td>
						<td><input type="text" name="state" value="${data.state}"></td>
						<td><input type="text" name="note" value="${data.note}"></td>
						<td><input type="text" name="regDate" value="${data.regDate}"></td>
						<td><input type="text" name="customerName" value="${data.customerName}"></td>
						<td><input type="text" name="customerPhone" value="${data.customerPhone}"></td>
						<td><input type="text" name="customerEmail" value="${data.customerEmail}"></td>
					</tr>
			</tbody>
		</table>
		
		<input type="submit" value="수정완료" class="btn">
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
			</div>
		</div>
</section>
</div>

<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>	

</body>
</html>