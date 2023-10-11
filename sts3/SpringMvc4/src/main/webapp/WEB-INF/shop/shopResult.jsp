<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>상품정보 출력_dto</h2>
	<div style="color: ${dto.color};">
		상품명:${dto.sang }<br>
		수량: <fmt:formatNumber value="${dto.su }" pattern="#,##0"/><br>
		단가: <fmt:formatNumber value="${dto.dan }" type="currency"/><br>
		총금액: <fmt:formatNumber value="${dto.su*dto.dan }" type="currency"/>
	</div>
</body>
</html>