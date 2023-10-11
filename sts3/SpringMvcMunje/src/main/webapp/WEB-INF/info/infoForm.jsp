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
	<form action="process" method="post">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th>좋아하는 색상</th>
				<td>
					<input type="color" name="color" class="form-control" style="width: 50px;">
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="영화보기">영화보기
					<input type="checkbox" name="hobby" value="음악감상">음악감상
					<input type="checkbox" name="hobby" value="운동">운동
					<input type="checkbox" name="hobby" value="공부">공부
					<input type="checkbox" name="hobby" value="코딩">코딩
				</td>
			</tr>
			<tr>
				<th>가장 좋아하는 언어</th>
				<td>
					<select name="lan">
						<option value="java">java</option>
						<option value="html">html</option>
						<option value="oracle">oracle</option>
						<option value="jsp">jsp</option>
						<option value="spring">spring</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info" style="width: 100px;">출력</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>