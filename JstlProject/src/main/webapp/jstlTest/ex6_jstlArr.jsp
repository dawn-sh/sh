<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<c:forEach var="s" begin="1" end="10">
		[${s }]&nbsp;
	</c:forEach>
	<br>
	<%
		String mycolor []={"red","cadetblue","purple","green","orange","lightblue","gray"};
	%>
	
	<c:set var="mycolor" value="<%=mycolor %>"/>
	
	<table class="table table-bordered" style="width: 300px;">
	<caption align="top"><b>전체값 출력</b></caption>
		<tr>
			<th>index</th><th>count</th><th>color</th>
		</tr>
		<c:forEach var="a" items="${mycolor }" varStatus="i">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a}">${a }</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 2~5번 -->
	<table class="table table-bordered" style="width: 300px;">
	<caption align="top"><b>일부값 출력</b></caption>
		<tr>
			<th>index</th><th>count</th><th>color</th>
		</tr>
		<c:forEach var="a" items="${mycolor }" varStatus="i" begin="2" end="5">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a}">${a }</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	<c:set var="msg" value="민규,성신,영환,성경,형준"/>
	${msg }<br>
	
	<h2>msg값을 컴마로 불리해서 출력</h2>
	<c:forTokens var="s" items="${msg }" delims="," varStatus="i">
		<h3>${i.count }: ${s }</h3>
	</c:forTokens>
</body>
</html>