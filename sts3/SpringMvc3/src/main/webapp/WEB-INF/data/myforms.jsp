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
	<h2>get방식 폼</h2>
	<form action="read1" method="get">
		이름: <input type="text" name="myname" size="6"><br>
		나이: <input type="text" name="myage" size="5"><br>
		<button type="submit">get방식 전송</button>
	</form>
	
	<br><br>
	
	<h2>post방식 폼_dto읽기</h2>
	<form action="read2" method="post">
		상품: <input type="text" name="sang" size="10"><br>
		가격: <input type="text" name="price" size="10"><br>
		<button type="submit">post방식 전송</button>
	</form>
	
	<br><br>
	
	<h2>post방식 폼_map읽기</h2>
	<form action="read3" method="post">
		상품: <input type="text" name="sang" size="10"><br>
		가격: <input type="text" name="price" size="10"><br>
		<button type="submit">post방식 전송</button>
	</form>
</body>
</html>