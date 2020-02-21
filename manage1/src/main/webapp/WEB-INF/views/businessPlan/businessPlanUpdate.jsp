<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
<script src="/resources/jquery-3.3.1.min.js"></script>
<title>(주)케이씨에스 영업 관리 시스템 - 예산 수정</title>
<script type="text/javascript">
$(document).ready(function() {
	
	var sort1 = $("#sort1").attr('value');
	var sort2 = $("#sort2").val();
	var state = $("#state").val();
	
	console.log(sort1);
	console.log(sort2);
	console.log(state);
	
	if (sort1 == "1") {
		$("#o11").attr("selected", "selected");
	} else if (sort1 == "2") {
		$("#o12").attr("selected", "selected");
	} else if (sort1 == "3") {
		$("#o13").attr("selected", "selected");
	}
	
	if (sort2 == "1") {
		$("#o21").attr("selected", "selected");
	} else if (sort2 == "2") {
		$("#o22").attr("selected", "selected");
	} else if (sort2 == "3") {
		$("#o23").attr("selected", "selected");
	} else if (sort2 == "4") {
		$("#o24").attr("selected", "selected");
	} else if (sort2 == "5") {
		$("#o25").attr("selected", "selected");
	} else if (sort2 == "6") {
		$("#o26").attr("selected", "selected");
	} else if (sort2 == "7") {
		$("#o27").attr("selected", "selected");
	}
	
	if (state == "1") {
		$("#o31").attr("selected", "selected");
	} else if (state == "2") {
		$("#o32").attr("selected", "selected");
	} else if (state == "3") {
		$("#o33").attr("selected", "selected");
	} else if (state == "4") {
		$("#o34").attr("selected", "selected");
	} else if (state == "5") {
		$("#o35").attr("selected", "selected");
	}
	
});
</script>
<style>
tr {
	border: 1px solid #AAAAAA;
}
</style>
</head>
<body>

<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
<input type="hidden" id="sort1" value="${data.sort1}">
<input type="hidden" id="sort2" value="${data.sort2}">
<input type="hidden" id="state" value="${data.state}">
<section class="ftco-section">
<div class="container">
	<form action="/businessPlanUpdate" id="dataForm" method="POST">
	<input type="hidden" name="oppId" value="${data.oppId}">
	<input type="hidden" name="userNum" value="${data.userNum}">
	<input type="hidden" name="regDate" value="${data.regDate}">
	<div class="row">
		<h2 class="heading-section">${data.oppId} 예산 수정</h2>
	</div>
	<input type="hidden" id="page" name="listPage" value="${listPage}" />
	
	<table class="table table-light table-hover table-borderless">
	<thead class="thead-dark">
		<tr>
			<th style="vertical-align: middle;">프로젝트명</th>
			<td colspan="3"><input type="text" name="projectName" value="${data.projectName}" class="form-control" style="width:100%;" maxlength="40" required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">구분1</th>
			<td><select name="sort1" class="form-control">
				<option id="o11" value="1">상품</option>
				<option id="o12" value="2">유지보수</option>
				<option id="o13" value="3">개발</option>
			</select></td>
			<th style="vertical-align: middle;">구분2</th>
			<td><select name="sort2" class="form-control">
				<option id="o21" value="1">Nonstop</option>
				<option id="o22" value="2">ACI</option>
				<option id="o23" value="3">HSM</option>
				<option id="o24" value="4">Oracle</option>
				<option id="o25" value="5">OGG</option>
				<option id="o26" value="6">Solution</option>
				<option id="o27" value="7">이벤트</option>
			</select></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">예상매출액</th>
			<td><input type="text" name="expectedSales" value="${data.expectedSales}" class="form-control" maxlength="12" required></td>
			<th style="vertical-align: middle;">예상매입금</th>
			<td><input type="text" name="expectedPurchase" value="${data.expectedPurchase}" class="form-control" maxlength="12" required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">예상매출월</th>
			<td><c:set var="expSalMon"><fmt:formatDate value="${data.expectedSalesMonth}" pattern="yyyy-MM"/></c:set>
			<input type="month" name="expectedSalesMonth" value="${expSalMon}" class="form-control" required></td>
			<th style="vertical-align: middle;">예상이익</th>
			<td><input type="text" name="expectedProfit" value="${data.expectedProfit}" class="form-control" maxlength="12" required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">상태</th>
			<td><select name="state" class="form-control">
				<option id="o31" value="1">Lead</option>
				<option id="o32" value="2">Opportunity</option>
				<option id="o33" value="3">Negotiation</option>
				<option id="o34" value="4">Win</option>
				<option id="o35" value="5">Lose</option>
			</select></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">최종사용자</th>
			<td><input type="text" name="endUser" value="${data.endUser}" class="form-control" maxlength="6" required></td>
			<th style="vertical-align: middle;">납품처</th>
			<td><input type="text" name="customer" value="${data.customer}" class="form-control" maxlength="6" required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">고객명</th>
			<td><input type="text" name="customerName" value="${data.customerName}" class="form-control" maxlength="12"></td>
			<th style="vertical-align: middle;">고객연락처</th>
			<td><input type="text" name="customerPhone" value="${data.customerPhone}" class="form-control" maxlength="14"></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">고객이메일</th>
			<td colspan="3"><input type="email" name="customerEmail" value="${data.customerEmail}" class="form-control" maxlength="30"></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">비고</th>
			<td colspan="3"><input type="text" name="note" value="${data.note}" class="form-control" maxlength="100"></td>
		</tr>
	</thead>
	</table>
	
	
	
	<%-- <table class="table table-light table-hover table-borderless">
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
	</table> --%>
	
	<button type="submit" class="btn btn-outline-primary">확인</button>
	<a href="#" class="btn btn-outline-primary" onclick="history.back();" style="float: right;">돌아가기</a>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>
</section>
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
</div> <!-- main-section -->
<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>	

</body>
</html>