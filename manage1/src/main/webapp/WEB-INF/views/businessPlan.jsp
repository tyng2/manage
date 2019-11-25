<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예산 작성</title>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
});
</script>
</head>
<body>
<c:set var="userNum"><sec:authentication property="principal.user.userNum"/></c:set>
	<form action="/businessPlan" id="dataForm" method="POST">
	
		<input type="hidden" name="userNum" value="${userNum }" /><br>
		<label>프로젝트명</label>
		<input type="text" name="projectName" /><br>
		<label>최종사용자</label>
		<input type="text" name="endUser" /><br>
		<label>납품처</label>
		<input type="text" name="customer" /><br>
		
		<label>고객명</label>
		<input type="text" name="customerName" /><br>
		<label>고객연락처</label>
		<input type="tel" name="customerPhone" /><br>
		<label>고객이메일</label>
		<input type="email" name="customerEmail" /><br>
		<label>구분1</label>
		<select name="sort1">
			<option value="1">상품</option>
			<option value="2">유지보수</option>
			<option value="3">개발</option>
		</select><br>
		
		<label>구분2</label>
		<select name="sort2">
			<option value="1">Nonstop</option>
			<option value="2">ACI</option>
			<option value="3">HSM</option>
			<option value="4">Oracle</option>
			<option value="5">OGG</option>
			<option value="6">Solution</option>
			<option value="7">이벤트</option>
		</select><br>
		
		<label>예상매출액</label>
		<input type="text" name="expectedSales" /><br>
		
		<label>예상매입금</label>
		<input type="text" name="expectedPurchase" /><br>
		
		<label>예상이익</label>
		<input type="text" name="expectedProfit" /><br>
		
		<label>예상매출월</label>
		<input type="text" name="expectedSalesMonth" /><br>
		
		<label>상태</label>
		<select name="state">
			<option value="1">Lead</option>
			<option value="2">Opportunity</option>
			<option value="3">Negotiation</option>
			<option value="4">Win</option>
			<option value="5">Lose</option>
		</select><br>
		
		<label>비고</label>
		<input type="text" name="note" /><br>
		
		<button>확인</button>
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>

</body>
</html>