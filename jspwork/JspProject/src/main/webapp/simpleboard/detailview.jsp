<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.SimpleBoardDto"%>
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
	span.day{
		color: #ccc;
		font-size: 0.8em;
		float: right;
	}
</style>
</head>
<body>
<%-- using useBean calls dao --%>
<jsp:useBean id="dao" class="db.simpleboard.SimpleBoardDao"></jsp:useBean>
<%
	//num을 읽는다
	String num=request.getParameter("num");

	//dao선언
	//조회수 1증가..증가메소드 선언
	dao.updateReadCount(num);
	
	//dto
	SimpleBoardDto dto=dao.getBoard(num);
	
	//날짜형식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top"><b><%=dto.getSubject() %></b></caption>
		<tr>
			<td>
				<b>writer: <%=dto.getWriter() %></b>
				<span class="day"><%=sdf.format(dto.getWriteday()) %>
					&nbsp;&nbsp;&nbsp;views: <%=dto.getReadcount() %>
				</span>
			</td>
		</tr>
		
		<tr height="150">
			<td>
				<%-- pre태그안에 쓰거나 replace("\n", "<br>")이용 : db저장시 br태그가 \n으로 저장된다
					 ...즉 출력시 다시 br로 변환--%>
				<%=dto.getStory().replace("\n", "<br>") %>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<button type="button" class="btn btn-outline-info btn-sm"
				onclick="location.href='addform.jsp'"><i class="bi bi-pencil-square"></i>Writing</button>
				<button type="button" class="btn btn-outline-success btn-sm"
				onclick="location.href='boardlist.jsp'"><i class="bi bi-list"></i>List</button>
				<button type="button" class="btn btn-outline-warning btn-sm"
				onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-wrench"></i>Modify</button>
				<button type="button" class="btn btn-outline-danger btn-sm"
				onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-x-circle"></i>Delete</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>