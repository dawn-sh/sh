<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.cart{
		float: right;
		cursor: pointer;
	}
	.count{
		width: 30px;
		height: 30px;
		float: right;
		background-color: red;
		border-radius: 100px;
		text-align: center;
		line-height: 30px;
		z-index: 10;
		position: relative;
		left: -20px;
		top: 10px;
		color: white;
		font-size: 30px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("div.cart").click(function(){
			
			location.href="index.jsp?main=shop/mycart.jsp";
		});
	});
</script>
</head>
<%
	//절대경로잡기 .... /JspMiniProject
	String root=request.getContextPath();

	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("myid");
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
%>
<body>
<a href="<%=root%>" style="color: black; text-decoration: none;"><img alt="" src="<%=root%>/image/title.webp" style="width: 200px;">
JSP & JQuery Mini Project</a>

<%
	if(loginok==null)
	{%>
		<button type="button" class="btn btn-info btn-sm"
		onclick="location.href='<%=root%>/index.jsp?main=login/loginform.jsp'">LOGIN</button>
	<%}
	else
	{%>
		<b><%=name %>님</b>&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-danger btn-sm"
		onclick="location.href='login/logoutaction.jsp'">LOGOUT</button>
	<%}
%>

<div class="cart">
	<%
		ShopDao sdao=new ShopDao();
		int cartSize=sdao.getCartList(id).size();
	%>
	<i class="bi bi-cart carticon" style="font-size: 0.8em;"></i>
	<div class="count"><%=cartSize %></div>
</div>
</body>
</html>