<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>손익 분석 목록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
</head>
<body>

	<div class="main-section">
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

		<section class="ftco-section pb-0">
			<div class="container">
				<div class="row">
					<div class="col-md-12 heading-title">
						<h2 class="heading-section">손익 분석 목록 : 총 ${page.allRowCount }건</h2>
						<form action="/costBenefitAnalysisList" id="dataForm" method="POST">
							<input type="hidden" id="page" name="listPage"
								value="${listPage}" />
							<table class="table table-light table-hover table-borderless">
								<thead class="thead-dark">
									<tr>
										<th>OPPID</th>
										<th>프로젝트명</th>
										<th>담당자</th>
										<th>최종사용자</th>
										<th>납품처</th>
										<th>계약시작</th>
										<th>계약종료</th>
										<th>자동연장기한</th>
										<th>수익인식</th>
										<th>예상매출액</th>
										<th>예상매입금</th>
										<th>예상이익</th>
										<th>내외자</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="13" style="text-align: center;">손익 분석
												목록이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="data" items="${list}">
											<tr>
												<td onclick="location.href='/costBenefitAnalysisUpdate?oppId=${data.oppId}'">${data.oppId}</td>
												<td>${data.projectName}</td>
												<td>${data.userNum}</td>
												<td>${data.endUser}"</td>
												<td>${data.customer}</td>
												<td>${data.contractDate}"</td>
												<td>${data.expiredDate}"</td>
												<td>${data.autoExtension}"</td>
												<td>${data.profitSort}"></td>
												<td>${data.expectedSales}"</td>
												<td>${data.expectedPurchase}"</td>
												<td>${data.expectedProfit}"</td>
												<td>${data.exchangeRate}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>

							<div class="container">
								<div class="pagination pagination-1 mb-4">
									<c:if test="${page.allRowCount > 0 }">

										<c:if test="${page.startPage > page.pageBlockSize }">
											<a href="/businessPlanList?pageNum=1&search=${search }">1</a>
											<span class="more-page">...</span>
											<a
												href="/businessPlanList?pageNum=${page.startPage - 1 }&search=${search }">
												&laquo;</a>
										</c:if>

										<c:forEach begin="${page.startPage }" end="${page.endPage }"
											step="1" varStatus="i">
											<c:choose>
												<c:when test="${i.current eq page.pageNum }">
													<a class="active" href="">${i.current }</a>
												</c:when>
												<c:otherwise>
													<a
														href="/businessPlanList?pageNum=${i.current }&search=${search }">${i.current }</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:if test="${page.endPage < page.maxSize }">
											<a
												href="/businessPlanList?pageNum=${page.endPage + 1 }&search=${search }&#board">
												&raquo;</a>
											<span class="more-page">...</span>
											<a
												href="/businessPlanList?pageNum=${page.maxPage }&search=${search }&#board">${page.maxPage }</a>
										</c:if>

									</c:if>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>

	</div>

	<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>

</body>
</html>