<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body *{
		font-family: 'Nanum Brush Script';
		font-size: 20px;
	}
</style>
</head>
<body>
	<div style="margin: 30px 30px; width: 400px;">
		<form action="quizaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 400px;">
				<caption align="top"><b>QuizBoard</b></caption>
				<tr>
					<th style="background-color: #1e90ff">Writer</th>
					<td>
						<input type="text" name="writer" class="form-control"
						required="required" style="width: 150px;">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: #1e90ff">Title</th>
					<td>
						<input type="text" name="title" class="form-control"
						required="required" style="width: 150px;">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<textarea style="width: 400px; height: 300px;" required="required"
						class="form-control" name="content"></textarea>
					</td>
				</tr>
				
				<tr>
					<th style="background-color: #1e90ff">File</th>
					<td>
						<input type="file" name="imgname" style="width: 200px;">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="right">
						<input type="image" src="../image/submit.jpeg" style="width: 40px;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>