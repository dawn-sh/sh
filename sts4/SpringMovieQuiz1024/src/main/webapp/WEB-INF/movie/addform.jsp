<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body{
		background-color: black;
		width: 100%;
		height: 100%;
		color: white;
	}
</style>
</head>
<body>
	<div style="margin: 100px 100px;">
		<form action="insert" method="post" enctype="multipart/form-data">
			<table style="width: 400px;">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" class="form-control" required="required" style="width: 200px;">
					</td>
				</tr>
				<tr>
					<th>포스터</th>
					<td>
						<input type="file" name="photo" class="form-control" required="required" style="width: 200px;">
					</td>
				</tr>
				<tr>
					<th>영화감독</th>
					<td>
						<input type="text" name="director" class="form-control" required="required" style="width: 200px;">
					</td>
				</tr>
				<tr>
					<th>개봉날짜</th>
					<td>
						<input type="date" name="opendate" class="form-control" required="required" style="width: 200px;" value="2023-10-24">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-secondary">저장</button>
						<button type="button" class="btn btn-outline-success"
						onclick="location.href='list'">영화목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>