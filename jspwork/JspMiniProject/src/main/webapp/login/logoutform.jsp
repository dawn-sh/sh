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
<div style="margin: 100px 200px;">
	<img alt="" src="image/cognition.avif" width="800" align="left">
	
	<%
		//세션으로부터 아이디를 얻는다
		String id=(String)session.getAttribute("myid");
		
		//db에 있는 이름 가져오기 위해서
		MemberDao dao=new MemberDao();
		String name=dao.getName(id);
	%>
	
	<br><br><br><br><br>
	<h3><b>LOGIN SUCCESS</b><br></h3>
	<h3><b><%=name %>,WELCOME!!</b><br></h3>
	<button type="button" class="btn btn-danger btn-sm"
	onclick="location.href='login/logoutaction.jsp'">LOGOUT</button>
</div>
</body>
</html>