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
	<div class="alert alert-info">
		이름: ${dto.name }<br>
		좋아하는 색상: <div style="background-color: ${dto.color }; width: 30px; height:30px;"></div><br>
		취미:
		<c:if test="${empty dto.hobby}">
			[없음]
		</c:if>
		<c:if test="${!empty dto.hobby}">
			<c:forEach var="s" items="${dto.hobby }">
				[${s }]
			</c:forEach>
		</c:if>
		<br>
		가장 좋아하는 언어: ${dto.lan }
	</div>
</body>
</html>