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
	<h2>학생점수</h2>
	<div class="alert alert-info">
		이름: ${name }<br>
		자바점수: ${java }<br>
		스프링점수: ${spring }<br>
		제이쿼리점수: ${jquery }<br>
		<!-- model.addObject("",map.get(""))으로 받은 값은 Integer.parseInt 안해도 됨 -->
		<%-- 총합점수:${java+spring+jquery }<br>
		평균:${(java+spring+jquery)/3 } --%>
		<c:set var="tot" value="${java+spring+jquery }"/>
		<c:set var="avg" value="${tot/3 }"/>
		총합계:${tot }<br>
		평균:${avg }
	</div>
</body>
</html>