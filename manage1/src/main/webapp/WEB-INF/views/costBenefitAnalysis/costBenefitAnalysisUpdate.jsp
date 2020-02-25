<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
<script src="/resources/jquery-3.3.1.min.js"></script>
<script src="/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	
});
</script>
<title>손익 분석 수정</title>
</head>
<style>
tr {
	border: 1px solid #AAAAAA;
}
</style>
<body>
<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

<section class="ftco-section">
	<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="heading-section">${data.oppId}</h2>
		</div>
	</div>	
	<form action="/costBenefitAnalysisUpdate" id="dataForm" method="POST">
		<input type="hidden" id="page" name="listPage" value="${listPage}" />
		<table class="table table-light table-hover table-borderless">
			<thead class="thead-dark">
				<tr>
					<th style="vertical-align: middle;">프로젝트명</th>
					<td colspan="3">${data.projectName}</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">담당자</th>
					<td colspan="3">${data.userNum}</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">최종사용자</th>
					<td><input type="text" name="endUser" value="${data.endUser}" class="form-control"></td>
					<th style="vertical-align: middle;">납품처</th>
					<td><input type="text" name="customer" value="${data.customer}" class="form-control"></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">계약시작</th>
					<td><input type="date" name="contractDate" value="${data.contractDate}" class="form-control"></td>
					<th style="vertical-align: middle;">계약종료</th>
					<td><input type="date" name="expiredDate" value="${data.expiredDate}" class="form-control"></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">자동연장기한</th>
					<td><input type="text" name="autoExtension" value="${data.autoExtension}" class="form-control"></td>
					<th style="vertical-align: middle;">수익인식</th>
					<td><select name="profitSort" class="form-control">
							<option value="1">당월</option>
							<option value="2">익월</option>
						</select></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">예상매출액</th>
					<td><input type="text" name="expectedSales" value="${data.expectedSales}" class="form-control"></td>
					<th style="vertical-align: middle;">예상매입금</th>
					<td><input type="text" name="expectedPurchase" value="${data.expectedPurchase}" class="form-control"></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">예상이익</th>
					<td><input type="text" name="expectedProfit" value="${data.expectedProfit}" class="form-control"></td>
					<th style="vertical-align: middle;">내외자</th>
					<td><select name="exchangeRate" class="form-control">
							<option value="1">내자</option>
							<option value="2">외자</option>
						</select></td>
				</tr>
				<tr style="display:none;">
					<td><input type="hidden" name="oppId" value="${data.oppId}" readonly="readonly"></td>
					<td><input type="hidden" name="userNum" value="${data.userNum}" readonly="readonly"></td>
					<td><input type="hidden" name="projectName" value="${data.projectName}" readonly="readonly"></td>						
				</tr>
			</thead>
		</table>
		
		<br>
		<input type="button" class="btn btn-outline-primary" value="목록으로" onclick="location.href='/cbAnalysisList'" />
		<input type="submit" class="btn btn-outline-primary" value="수정완료" class="btn" style="float: right;" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		
		
	</form>
	</div>
</section>
</div>
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>	

</body>
</html>