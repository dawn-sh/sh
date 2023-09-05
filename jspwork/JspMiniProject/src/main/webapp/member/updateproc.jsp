<%@page import="data.dao.MemberDao"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="data.dto.MemberDto"%>
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

	String num=request.getParameter("num");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	
	MemberDto dto=new MemberDto();
	dto.setNum(num);
	dto.setId(id);
	dto.setName(name);
	dto.setPass(pass);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setEmail(email);
	
	MemberDao dao=new MemberDao();
	dao.updateMember(dto);
	
	response.sendRedirect("../index.jsp?main=member/myinfo.jsp?num="+num);
	
%>
</body>
</html>