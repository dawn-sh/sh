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
<style type="text/css">
	div.layout{
		border: 0px solid gray;
		position: absolute;
	}
	
	div.title{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 40px;
		font-family: 'Cute Font';
		text-align: center;
	}
	
	div.menu{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 20px;
		font-family: 'Cute Font';
		text-align: center;
		top: 100px;
	}
	
	div.info{
		width: 180px;
		height: 500px;
		line-height: 10px;
		font-family: 'Cute Font';
		left: 150px;
		top: 300px;
		padding: 20px 10px;
		border: 0px groove gray;
		border-radius: 30px;	
	}
	
	div.main{
		width: 1200px;
		height: 1000px;
		font-size: 13pt;
		font-family: 'Cute Font';
		left: 500px;
		top: 300px;
	}
</style>
</head>
<%
	//절대경로잡기 .... /JspMiniProject
	String root=request.getContextPath();
	
	
	String mainPage="layout/main.jsp";//기본 페이지

	//url을 통해 main값을 얻어서 메인웹페이지에 출력한다...모든 것을 메인을 통해서 뿌려줄 것이다
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");
	}
%>
<body>
<div class="layout title">
	<%-- 이곳에서는 절대경로 안 붙임...시작페이지기 때문 --%>
	<jsp:include page="layout/title.jsp"></jsp:include>
</div>

<div class="layout menu">
	<jsp:include page="layout/menu.jsp"></jsp:include>
</div>

<div class="layout info">
	<jsp:include page="layout/info.jsp"></jsp:include>
</div>

<div class="layout main">
	<jsp:include page="<%=mainPage %>"></jsp:include>
</div>
</body>
</html>