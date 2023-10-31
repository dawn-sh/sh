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
</head>
<body>
	<div style="margin: 100px 100px;">
		<form action="insert" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 500px;">
			<caption align="top"><b>상품 정보 입력</b></caption>
				<tr>
					<th bgcolor="#ddd">상품명</th>
					<td>
						<input type="text" name="sangpum" class="form-control" style="width: 200px;"
						required="required">
					</td>
				</tr>
				<tr>
					<th bgcolor="#ddd">가격</th>
					<td>
						<input type="text" name="price" class="form-control" style="width: 200px;"
						required="required">
					</td>
				</tr>
				<tr>
					<th bgcolor="#ddd">사진</th>
					<td>
						<input type="file" name="photo" class="form-control" style="width: 200px;" multiple="multiple">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">저장</button>
						<button type="button" class="btn btn-outline-success"
						onclick="location.href='list'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>