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
<!-- href에 mapping 경로 적어줘야한다 -->
<link rel="stylesheet" href="../css/style.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2 class="alert alert-info">${title }</h2>
	<img alt="" src="${myimg1 }">
	<hr>
	
	<h2 class="alert alert-info">css적용 확인</h2>
	<table style="width: 200px;">
		<tr>
			<th>이름</th>
			<th>핸드폰</th>
		</tr>
		<tr>
			<td>최성현</td>
			<td>010-9773-7503</td>
		</tr>
	</table>
	
</body>
</html>