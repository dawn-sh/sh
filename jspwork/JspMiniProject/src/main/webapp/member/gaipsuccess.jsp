<%@page import="data.dao.MemberDao"%>
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
	String id=request.getParameter("id");
	MemberDao dao=new MemberDao();
	//id에 대한 이름 얻기
	String name=dao.getName(id);
%>

	<div style="margin: 200px 200px;">
		<b>ACCESS</b><br>
		<img alt="" src="image/cognition.avif" style="width: 200px;">
		<b><%=name %><br>
			 SIGN UP SUCCESS!!!<br>
			 WELCOME to JSP & JQuery Mini Project!!!</b>
		<br><br>
		<button type="button" class="btn btn-info"
		onclick="location.href='index.jsp?main=login/loginform.jsp'" style="width: 100px;">Login</button>
		
		<button type="button" class="btn btn-info"
		onclick="location.href='index.jsp'" style="width: 100px;">Main</button>
	</div>
</body>
</html>