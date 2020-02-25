<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<style>
tr {
	border: 1px solid #AAAAAA;
}
</style>
</head>
<body>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>  
<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

<section class="ftco-section">
<div class="container">
<div class="row">
	<div class="col-md-12">
		<h2 class="heading-section">${data.oppId}</h2>
	</div>
</div>
<!-- <form action="/businessPlanDtl" id="dataForm" method="POST"> -->


	<table class="table table-light table-hover table-borderless">
	<thead class="thead-dark">
		<tr>
			<th style="vertical-align: middle;">프로젝트명</th>
			<td colspan="3">${data.projectName}</td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">담당자</th>
			<td>${data.userNum}</td>
			<th style="vertical-align: middle;">작성일</th>
			<td><fmt:formatDate value="${data.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">구분1</th>
			<td><c:choose>
			<c:when test="${data.sort1 == '1'}">
				상품
			</c:when>
			<c:when test="${data.sort1 == '2'}">
				유지보수
			</c:when>
			<c:when test="${data.sort1 == '3'}">
				개발
			</c:when>
			<c:otherwise>없음</c:otherwise>
			</c:choose></td>
			<th style="vertical-align: middle;">구분2</th>
			<td><c:choose>
			<c:when test="${data.sort2 == '1'}">
				Nonstop
			</c:when>
			<c:when test="${data.sort2 == '2'}">
				ACI
			</c:when>
			<c:when test="${data.sort2 == '3'}">
				HSM
			</c:when>
			<c:when test="${data.sort2 == '4'}">
				Oracle
			</c:when>
			<c:when test="${data.sort2 == '5'}">
				OGG
			</c:when>
			<c:when test="${data.sort2 == '6'}">
				Solution
			</c:when>
			<c:when test="${data.sort2 == '7'}">
				이벤트
			</c:when>
			<c:otherwise>없음</c:otherwise>
			</c:choose></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">예상매출액</th>
			<td>${data.expectedSales}</td>
			<th style="vertical-align: middle;">예상매입금</th>
			<td>${data.expectedPurchase}</td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">예상매출월</th>
			<td><fmt:formatDate value="${data.expectedSalesMonth}" pattern="yyyy년 MM월"/></td>
			<th style="vertical-align: middle;">예상이익</th>
			<td>${data.expectedProfit}</td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">상태</th>
			<td><c:choose>
			<c:when test="${data.state == '1'}">
				Lead
			</c:when>
			<c:when test="${data.state == '2'}">
				Opportunity
			</c:when>
			<c:when test="${data.state == '3'}">
				Negotiation
			</c:when>
			<c:when test="${data.state == '4'}">
				Win
			</c:when>
			<c:when test="${data.state == '5'}">
				Lose
			</c:when>
			<c:otherwise>없음</c:otherwise>
			</c:choose></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">최종사용자</th>
			<td>${data.endUser}</td>
			<th style="vertical-align: middle;">납품처</th>
			<td>${data.customer}</td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">고객명</th>
			<td>${data.customerName}</td>
			<th style="vertical-align: middle;">고객연락처</th>
			<td>${data.customerPhone}</td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">고객이메일</th>
			<td colspan="3">${data.customerEmail}</td>
		</tr>
		<tr>
			<th style="vertical-align: middle;">비고</th>
			<td colspan="3">${data.note}</td>
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
	</table> --%>
<form id="dataForm" method="POST">
	<br><input type="button" class="btn btn-outline-primary" value="수정" onclick="javascript:upDate('${data.oppId}')" />
	<input type="button" class="btn btn-outline-primary" value="삭제" onclick="javascript:del('${data.oppId}')"/>
	<input type="button" class="btn btn-outline-primary" value="목록" onclick="location.href='/businessPlanList'" style="float: right;" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<!-- </form> -->
<!-- 	</div> -->
</div>
</section>
</div>
<script>

function del(oppId) {
	
	if (confirm("삭제하시겠습니까?") == true) {
	var dataForm = document.querySelector('#dataForm');
	dataForm.setAttribute("action", "/bpDel");

	var input1 = document.createElement("input");
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "oppId");
	input1.setAttribute("value", oppId);
	dataForm.appendChild(input1);

	dataForm.submit();
		
	}
}

function upDate(oppId) {
	var dataForm = document.querySelector('#dataForm');
	dataForm.setAttribute("action", "/bPUpdate");

	var input1 = document.createElement("input");
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "oppId");
	input1.setAttribute("value", oppId);
	dataForm.appendChild(input1);

	dataForm.submit();
}
</script>
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>	
	
</body>
</html>