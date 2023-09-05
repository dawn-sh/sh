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
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave");
	
	MemberDao dao=new MemberDao();
	
	boolean check=dao.isIdPass(id, pass);
	
	if(check)
	{
		session.setMaxInactiveInterval(60*60*3);//3시간
		
		session.setAttribute("loginok", "key");
		
		session.setAttribute("myid", id);
		
		session.setAttribute("saveok", cbsave==null?null:"yes"); //yes는 큰 의미가 없고 form에서 다시 설정 해줄것임..값을 넘겨주는 역할..체크 안할경우 null
		
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	}
	else
	{%>
		<script type="text/javascript">
			alert("Please check your id and password");
			history.back();
		</script>
	<%}
%>
</body>
</html>