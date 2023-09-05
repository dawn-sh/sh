<%@page import="db.simpleboard.SimpleBoardDao"%>
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
	String pass=request.getParameter("pass");
	
	SimpleBoardDao dao=new SimpleBoardDao();
	
	//passCheck 호출
	boolean check=dao.passCheck(num, pass);
	
	//true면 updateform으로,false면 경고창
	if(check)
	{
		dao.deleteBoard(num);
		
		response.sendRedirect("boardlist.jsp");
	}
	else
	{%>
		<script type="text/javascript">
			alert("Don't match the Password");
			history.back();
		</script>
	<%}
%>
</body>
</html>