<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템 - 예산 작성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>

</head>
<script src="/resources/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {	
	var year = new Date().getFullYear();
	var month = new Date().getMonth() + 1;
	console.log(month);
	
	if (Number(month) < 10) {
		month = "0" + month;
	}
	
	var setting = year + "-" + month;
	console.log(setting);
	$('input[name=expectedSalesMonth]').attr("value", setting);
	
	
	
	
// 	숫자 입력 텍스트 박스
	$("input:text[numberOnly]").on("focus", function() {
	    var x = $(this).val();
	    x = removeCommas(x);
	    $(this).val(x);
	}).on("focusout", function() {
	    var x = $(this).val();
	    if(x && x.length > 0) {
	        if(!$.isNumeric(x)) {
	            x = x.replace(/[^0-9]/g,"");
	        }
	        x = addCommas(x);
	        $(this).val(x);
	    }
	}).on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});

	//3자리 단위마다 콤마 생성
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	 
	//모든 콤마 제거
	function removeCommas(x) {
	    if(!x || x.length == 0) return "";
	    else return x.split(",").join("");
	}
// 	숫자 입력 텍스트 박스

})

</script>
<style>
tr {
	border: 1px solid #AAAAAA;
}
</style>
<body>
<c:set var="userNum"><sec:authentication property="principal.user.userNum"/></c:set>
<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>


<form action="/businessPlan" method="POST">
<section class="ftco-section bg-light" id="inputs">
<div class="container">
	<div class="row mb-5">
		<div class="col-md-12">
			<h2 class="heading-section">예산 작성</h2>
		</div>
	</div>
	<input type="hidden" name="userNum" value="${userNum }" />
	
	<table class="table table-light table-hover table-borderless">
	<thead class="thead-dark">
		<tr>
			<th style="vertical-align: middle;">프로젝트명</th>
			<td colspan="3"><input type="text" name="projectName" class="form-control" style="width:100%;" maxlength="40" required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">구분1</th>
			<td><select name="sort1" class="form-control">
				<option value="1">상품</option>
				<option value="2">유지보수</option>
				<option value="3">개발</option>
			</select></td>
			<th style="vertical-align: middle;">구분2</th>
			<td><select name="sort2" class="form-control">
				<option value="1">Nonstop</option>
				<option value="2">ACI</option>
				<option value="3">HSM</option>
				<option value="4">Oracle</option>
				<option value="5">OGG</option>
				<option value="6">Solution</option>
				<option value="7">이벤트</option>
			</select></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">예상매출액</th>
			<td><input type="text" name="expectedSales" class="form-control" maxlength="9" numberOnly required></td>
			<th style="vertical-align: middle;">예상매입금</th>
			<td><input type="text" name="expectedPurchase" class="form-control" maxlength="9" numberOnly required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">예상매출월</th>
			<td><input type="month" name="expectedSalesMonth" class="form-control" value="" required></td>
			<th style="vertical-align: middle;">예상이익</th>
			<td><input type="text" name="expectedProfit" class="form-control" maxlength="9" numberOnly required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">상태</th>
			<td><select name="state" class="form-control">
				<option value="1">Lead</option>
				<option value="2">Opportunity</option>
				<option value="3">Negotiation</option>
				<option value="4">Win</option>
				<option value="5">Lose</option>
			</select></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">최종사용자</th>
			<td><input type="text" name="endUser" class="form-control" maxlength="6" required></td>
			<th style="vertical-align: middle;">납품처</th>
			<td><input type="text" name="customer" class="form-control" maxlength="6" required></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">고객명</th>
			<td><input type="text" name="customerName" class="form-control" maxlength="12"></td>
			<th style="vertical-align: middle;">고객연락처</th>
			<td><input type="text" name="customerPhone" class="form-control" maxlength="14"></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">고객이메일</th>
			<td colspan="3"><input type="email" name="customerEmail" class="form-control" maxlength="30"></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">비고</th>
			<td colspan="3"><input type="text" name="note" class="form-control" maxlength="100"></td>
		</tr>
	</thead>
	</table>
	
	<!-- <div class="row">
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="projectName" class="form-control" maxlength="40" required>
				<label class="form-control-placeholder" for="projectName">프로젝트명</label>			
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<select name="sort1" class="form-control">
					<option value="1">상품</option>
					<option value="2">유지보수</option>
					<option value="3">개발</option>
				</select>
				<label class="form-control-placeholder" for="sort1">구분1</label>			
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<select name="sort2" class="form-control">
					<option value="1">Nonstop</option>
					<option value="2">ACI</option>
					<option value="3">HSM</option>
					<option value="4">Oracle</option>
					<option value="5">OGG</option>
					<option value="6">Solution</option>
					<option value="7">이벤트</option>
				</select>
				<label class="form-control-placeholder" for="sort2">구분2</label>			
			</div>
		</div>
	</div><br><br>
	
	<div class="row">
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="expectedSales" class="form-control" required>
				<label class="form-control-placeholder" for="expectedSales">예상매출액</label>			
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="expectedPurchase" class="form-control" required>
				<label class="form-control-placeholder" for="expectedPurchase">예상매입금</label>			
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="expectedProfit" class="form-control" required>
				<label class="form-control-placeholder" for="expectedProfit">예상이익</label>			
			</div>
		</div>
	</div><br>
	
	<div class="row">
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="month" name="expectedSalesMonth" class="form-control" value="" required>
				<label class="form-control-placeholder" for="expectedSalesMonth">예상매출월</label>		
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<select name="state" class="form-control">
					<option value="1">Lead</option>
					<option value="2">Opportunity</option>
					<option value="3">Negotiation</option>
					<option value="4">Win</option>
					<option value="5">Lose</option>
				</select>
				<label class="form-control-placeholder" for="state">상태</label>			
			</div>
		</div>
	</div><br><br>
	
	<div class="row">
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="endUser" class="form-control" required>
				<label class="form-control-placeholder" for="endUser">최종사용자</label>		
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="customer" class="form-control" required>
				<label class="form-control-placeholder" for="customer">납품처</label>			
			</div>
		</div>
	</div><br>
	
	<div class="row">
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="customerName" class="form-control" required>
				<label class="form-control-placeholder" for="customerName">고객명</label>			
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="text" name="customerPhone" class="form-control" required>
				<label class="form-control-placeholder" for="customerPhone">고객연락처</label>			
			</div>
		</div>
		<div class="col-lg-3 col-sm-4">
			<div class="form-group">
				<input type="email" name="customerEmail" class="form-control" required>
				<label class="form-control-placeholder" for="customerEmail">고객이메일</label>			
			</div>
		</div>
	</div><br><br>
	
	<div class="row">
		<div class="col-lg-9 col-sm-4">
			<div class="form-group">
				<input type="text" name="note" id="note" class="form-control" required>
				<label class="form-control-placeholder" for="note">비고</label>			
			</div>
		</div>
	</div> --><br>
	<button class="btn btn-outline-primary">확인</button>
	<button type="reset" class="btn btn-outline-primary" style="float: right;" >다시 작성</button>
</div>
</section>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<!-- - - - - -end- - - - -  -->


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