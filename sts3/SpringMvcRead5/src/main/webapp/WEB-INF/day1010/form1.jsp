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
	<form action="read1" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control" style="width: 150px;">
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="남자" checked="checked">남자
					<input type="radio" name="gender" value="여자">여자
				</td>
			</tr>
			
			<tr>
				<th>주거지역</th>
				<td>
					<select name="addr" class="form-control">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="제주">제주</option>
						<option value="세종">세종</option>
						<option value="부산">부산</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="데이터 전송" class="btn btn-warning">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>