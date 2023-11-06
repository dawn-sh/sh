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
	<div style="margin: 50px 100px; width: 600px;">
		<form action="insert" method="post" enctype="multipart/form-data">
			<!-- hidden 5개 -->
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="regroup" value="${regroup }">
			<input type="hidden" name="restep" value="${restep }">
			<input type="hidden" name="relevel" value="${relevel }">
			<input type="hidden" name="currentPage" value="${currentPage }">
			<!-- hidden 2개 id,name session으로 받아오기 때문 -->
			<input type="hidden" name="id" value="${sessionScope.myid }">
			<input type="hidden" name="name" value="${sessionScope.loginname }">
			
			<table class="table table-bordered">
				<tr>
					<th width="100">Subject</th>
					<td>
						<input type="text" name="subject" class="form-control" required="required"
						value="${subject }"> <!-- 답글일 경우 controller에서 원글을 가져오기로 했기 때문에 value값에 넣어줌 / 새글일 경우 새글 제목 들어감 -->
					</td>
				</tr>
				<tr>
					<th width="100">Upload File</th>
					<td>
						<input type="file" name="upload" class="form-control" multiple="multiple">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea style="width: 600px; height: 150px;" name="content" class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">Write</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>