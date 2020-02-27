<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템 - 예산 목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
<script>
function dtlPage(inp) {
	
// 	var dataForm = document.createElement("form");
// 	dataForm.setAttribute("method", "GET");
// 	dataForm.setAttribute("action", "/businessPlanDtl");
	var dataForm = document.querySelector('#dataForm');

	var input1 = document.createElement("input");
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "oppId");
	input1.setAttribute("value", inp);
	dataForm.appendChild(input1);

	dataForm.submit();

}
</script>
</head>
<body>

<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

	
<section class="ftco-section">
<div class="container">
	<div class="row">
		<div class="col-md-12 heading-title">
		<h2 style="margin-bottom: 2rem;">예산 목록 : ${page.allRowCount }건</h2>
		<form action="/businessPlanDtl" id="dataForm" method="POST">
			<input type="hidden" id="page" name="listPage" value="${listPage}" />
			<table class="table table-light table-hover table-borderless">
			<thead class="thead-dark">
				<tr>
					<th style="width: 50px;">OPPID</th>
					<th style="width: 80px;">구분</th>
					<th>프로젝트명</th>
					<th style="width: 80px;">작성일</th>
					<th style="width: 80px;">상태</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${empty list }">
			<tr><td colspan="4" style="text-align: center;">작성된 예산 목록이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="data" items="${list}">
				<tr onclick="javascript:dtlPage('${data.oppId}')" >
					<td>${data.oppId}</td>
					<td><c:if test="${data.sort1 == 1}">상품</c:if>
					<c:if test="${data.sort1 == 2}">유지보수</c:if>
					<c:if test="${data.sort1 == 3}">개발</c:if></td>
					<c:set var="pName">${data.projectName}</c:set>
					<c:if test="${pName.length() > 30 }">
						<c:set var="pName" value="${fn:substring(pName,0,30) }... "/>
					</c:if>
					<td>${pName}</td>
					<td><jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
					<fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" />
					<fmt:parseNumber value="${data.regDate.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true" />
					<c:set value="${nowDays - regDays }" var="dayDiff" />
					<c:choose>
					<c:when test="${dayDiff == 0 }">
						<fmt:formatDate value="${data.regDate}" pattern="HH:mm:ss"/>
					</c:when>
					<c:otherwise>
						<fmt:formatDate value="${data.regDate}" pattern="yyyy.MM.dd"/>
					</c:otherwise>
					</c:choose></td>
					<td><c:if test="${data.state == 1}">Lead</c:if>
					<c:if test="${data.state == 2}">Opportunity</c:if>
					<c:if test="${data.state == 3}">Negotiation</c:if>
					<c:if test="${data.state == 4}">Win</c:if>
					<c:if test="${data.state == 5}">Lose</c:if></td>
				</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
			</tbody>
			</table>
		<div class="container">
		<div class="pagination pagination-1 mb-4">
			<c:if test="${page.allRowCount gt 0 }">
			
			<c:if test="${page.startPage gt page.pageBlockSize }">
			<a href="/businessPlanList?pageNum=1">1</a><p class="more-page">...</p>
			<a href="/businessPlanList?pageNum=${page.startPage - 1 }">&laquo;</a>
			</c:if>
			
			<c:forEach begin="${page.startPage }" end="${page.endPage }" step="1" varStatus="i" >
			<c:choose>
			<c:when test="${i.current eq page.pageNum }">
				<a class="active" href="">${i.current }</a>
			</c:when>
			<c:otherwise>
				<a href="/businessPlanList?pageNum=${i.current }">${i.current }</a>
			</c:otherwise>
			</c:choose>
			</c:forEach>
           	
           	<c:if test="${page.endPage lt page.maxPage }">
			<a href="/businessPlanList?pageNum=${page.endPage + 1 }&#board">&raquo;</a>
			<p class="more-page">...</p>
			<a href="/businessPlanList?pageNum=${page.maxPage }&#board">${page.maxPage }</a>
			</c:if>
           	
			</c:if>
           </div>
           </div>
			
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>

		<%-- <form action="/bpReport" method="POST">
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
		</form> --%>
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