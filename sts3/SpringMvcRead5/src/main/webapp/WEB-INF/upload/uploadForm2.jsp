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
	<form action="upload2" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 400px;">
			<caption align="top"><b>스프링 업로드(파일 여러개)</b></caption>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" class="form-control">
				</td>
			</tr>
			
			<tr>
				<th>업로드</th>
				<td>
					<!-- multipart controller에서 name="photo" 가져와야한다
						 파일 업로드시 mvnrepository에 들어가서 pom.xml depdencies에 라이브러리 추가해줘야함
						 servlet-context.xml에도 추가 엔코딩과 파일크기 설정을 해줘야함
						 여러개 사진은 multiple="multiple" 추가하면됨 -->
					<input type="file" name="photo" class="form-control" multiple="multiple">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">업로드#2</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>