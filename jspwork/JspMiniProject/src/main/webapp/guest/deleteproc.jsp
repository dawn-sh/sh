<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
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
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//db로부터 저장된 이미지명 얻기
	GuestDao dao=new GuestDao();
	String photoname=dao.getData(num).getPhotoname();
	
	//db삭제
	dao.deleteMember(num);
	
	//실제경로
	String realPath=getServletContext().getRealPath("/save");
	
	//파일객체 생성
	File file=new File(realPath+"/"+photoname);
	
	//파일삭제
	file.delete();
	
	//보던페이지로 이동
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
%>
</body>
</html>