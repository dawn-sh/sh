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
	<table style="width: 600px;">
		<tr>
			<td rowspan="5">
				<img alt="" src="../moviephoto/${dto.poster }" width="300">
			</td>
		</tr>
		<tr>
			<td>
				<h3>영화제목: ${dto.title }</h3>
			</td>
		</tr>
		<tr>
			<td>
				<h3>영화감독: ${dto.director }</h3>
			</td>
		</tr>
		<tr>
			<td>
				<h3>개봉일: ${dto.opendate }</h3>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-outline-warning"
				onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-outline-danger"
				onclick="location.href=''">삭제</button>
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='list'">목록</button>
				<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='writeform'">영화추가</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>