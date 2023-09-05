<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.quiz.QuizBoardDao"%>
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
</head>
<body>
<%
	QuizBoardDao dao=new QuizBoardDao();
	List<QuizBoardDto> list=dao.getAllDataes();
%>
<table style="width: 600px;">
	<%
		for(int i=0;i<list.size();i++)
		{
			QuizBoardDto dto=list.get(i);%>
			
			<div style="float: left; margin-left: 50px;">
				<img src="<%=dto.getImgname() %>" style="width: 150px;">
				<h6>작성자 - <%=dto.getWriter() %></h6>
				<h6>제목 - <%=dto.getTitle() %></h6>
			</div>
		<%}
	%>
</table>
</body>
</html>