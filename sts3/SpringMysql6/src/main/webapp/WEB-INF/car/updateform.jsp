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
<div style="margin: 100px 50px;">
	<form action="update" method="post">
	<!-- hidden -->
	<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered" style="width: 350px;">
			<tr>
				<th>자동차명</th>
				<td>
					<input type="text" name="carname" required="required"
					class="form-control" value="${dto.carname }">
				</td>
			</tr>
			<tr>
				<th>자동차가격</th>
				<td>
					<input type="text" name="carprice" required="required"
					class="form-control" value="${dto.carprice }">
				</td>
			</tr>
			<tr>
				<th>자동차색상</th>
				<td>
					<input type="color" name="carcolor" required="required"
					class="form-control" value="${dto.carcolor }">
				</td>
			</tr>
			<tr>
				<th>구입일</th>
				<td>
					<input type="date" name="carguip" required="required"
					class="form-control" value="${dto.carguip }">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-warning">DB수정</button>
					<button type="button" class="btn btn-success"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>