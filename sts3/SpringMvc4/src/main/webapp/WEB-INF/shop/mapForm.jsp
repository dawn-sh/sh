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
	<form action="process3" method="post">
		<table class="table table-bordered" style="width: 300px;">
		<caption align="top"><b>학생시험점수</b></caption>
			<tr>
				<th>학생명</th>
				<td>
					<input type="text" name="name" class="form-control"
					style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th>자바점수</th>
				<td>
					<input type="text" name="java" class="form-control"
					style="width: 100px;">
				</td>
			</tr>
			<tr>
				<th>스프링점수</th>
				<td>
					<input type="text" name="spring" class="form-control"
					style="width: 100px;">
				</td>
			</tr>
			<tr>
				<th>제이쿼리 점수</th>
				<td>
					<input type="text" name="jquery" class="form-control"
					style="width: 100px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>