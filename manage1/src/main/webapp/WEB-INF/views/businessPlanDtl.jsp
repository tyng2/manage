<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
</script>
<title>상세 페이지</title>
</head>
<body>
	<form action="/businessPlanDtl" id="dataForm" method="POST">
		<input type="button" value="수정하기" />
		<input type="button" value="삭제하기" />
		
		<a href="#" onclick="history.back();" style="float: right;">돌아가기</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>