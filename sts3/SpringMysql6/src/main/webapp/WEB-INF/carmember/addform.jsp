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
	<form action="add" method="post">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control" required="required">
				</td>
			</tr>
			
			<tr>
				<th>휴대폰 번호</th>
				<td>
					<input type="text" name="hp" class="form-control" required="required">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="addr" class="form-control" required="required">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info">정보 입력</button>
					<button type="button" class="btn btn-outline-success"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>