<%@page import="data.dto.MemberDto"%>
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
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setId(id);
	dto.setPass(pass);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setEmail(email);
	
	//dao선언 후 insert 호출
	MemberDao dao=new MemberDao();
	dao.insertMember(dto);
	
	//기본적으로 링크는 앞에 ../이 안들어가고 직접적으로 화면 이동은 ../를 붙여서 사용
	//id값을 넘기는 이유는 id를 통해서 name값을 받기 위해서...직접 name으로 넘기면 한글이 다 깨져서 나옴(어떠한 처리를 해줘도)
	response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);
	
%>
</body>
</html>