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
	<form action="ipgo/ipgoresult" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th valign="middle">상품명</th>
				<td>
					<input type="text" name="product" class="form-control" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th valign="middle">카테고리</th>
				<td>
					<input type="text" name="category" class="form-control" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th valign="middle">색상</th>
				<td>
					<input type="text" name="color" class="form-control" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th valign="middle">가격</th>
				<td>
					<input type="text" name="price" class="form-control" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<td	colspan="2" align="center">
					<button type="submit" class="btn btn-outline-danger">submit</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>