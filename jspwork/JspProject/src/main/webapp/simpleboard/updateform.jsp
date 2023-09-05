<%@page import="db.simpleboard.SimpleBoardDto"%>
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
<%
	String num=request.getParameter("num");
	SimpleBoardDao dao=new SimpleBoardDao();
	SimpleBoardDto dto=dao.getBoard(num);
%>
<body>
<div style="margin: 30px 30px; width: 400px;">
		<form action="updateaction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
			<table class="table table-bordered">
				<caption align="top"><b><i class="bi bi-pencil-fill"></i>Writing</b></caption>
				<tr>
					<th style="background-color: #40e0d0">Writer</th>
					<td>
						<input type="text" name="writer" class="form-control"
						required="required" autofocus="autofocus" style="width: 150px;"
						value="<%=dto.getWriter()%>">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: #40e0d0">Title</th>
					<td>
						<input type="text" name="subject" class="form-control"
						required="required" style="width: 270px;" value="<%=dto.getSubject()%>">
					</td>
				</tr>
				
				<tr>
					<%-- story don't have to use th tag --%>
					<td colspan="2">
						<textarea style="width: 390px; height: 150px;"
						class="form-control;" required="required" name="story"><%=dto.getStory() %></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<%-- when submit and image basic type is submit --%>
						<%-- type이 image이거나 submit이면 기본이 submit --%>
						<input type="image" src="../image/submit button.jpeg" style="width: 70px;">
						<input type="image" src="../image/list image2.jpeg" style="width: 70px;"
						<%-- return false을 줌으로써 onclick 우선 적용해주는 역할 --%>
						onclick="location.href='boardlist.jsp'; return false;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>