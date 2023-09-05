<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="db.quiz.QuizBoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	request.setCharacterEncoding("utf-8");

	String realPath=getServletContext().getRealPath("/upload");

	int uploadSize=1024*1024*10;

	MultipartRequest multi=null;

	multi= new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	QuizBoardDao dao=new QuizBoardDao();
	QuizBoardDto dto=new QuizBoardDto();

	dto.setWriter(multi.getParameter("writer"));
	dto.setTitle(multi.getParameter("title"));
	dto.setContent(multi.getParameter("content"));
	
	String imgname=multi.getFilesystemName("imgname");

	dto.setImgname("../upload/"+imgname); //사진 선택한 경우

	dao.insertQuiz(dto);
	
	int view=dao.getMaxnum();
	
	response.sendRedirect("quizlist.jsp?q_num="+view);
%>
</body>
</html>