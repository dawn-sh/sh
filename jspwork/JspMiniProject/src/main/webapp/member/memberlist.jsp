<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<script>
	function del(num)
	{
		var con=confirm("Do you want to drop this member?");
		if(con)
		{
			location.href='member/memberdelete.jsp?num='+num;
		}
		else
		{
			alert("You don't drop this member");
		}
	}
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<table class="table table-bordered" style="width: 1000px;">
	<caption align="top">ALL MEMBERS</caption>
	<tr align="center">
		<th style="width: 70px; background-color: #20b2aa;">NO</th>
		<th style="width: 80px; background-color: #20b2aa;">NAME</th>
		<th style="width: 120px; background-color: #20b2aa;">ID</th>
		<th style="width: 260px; background-color: #20b2aa;">HP</th>
		<th style="width: 300px; background-color: #20b2aa;">ADDRESS</th>
		<th style="width: 200px; background-color: #20b2aa;">E-MAIL</th>
		<th style="width: 200px; background-color: #20b2aa;">SIGNUP DAY</th>
		<th style="width: 70px; background-color: #20b2aa;">EDIT</th>
	</tr>
	<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="8" align="center">
					<h4><b>NO MEMBER</b></h4>
				</td>
			</tr>
		<%}
		else
		{
			for(int i=0;i<list.size();i++)
			{
				MemberDto dto=list.get(i);%>
				<tr>
					<td align="center" valign="middle">Number.<%=i+1 %></td>
					<td align="center" valign="middle"><%=dto.getName() %></td>
					<td align="center" valign="middle"><%=dto.getId() %></td>
					<td align="center" valign="middle"><%=dto.getHp() %></td>
					<td align="center" valign="middle"><%=dto.getAddr() %></td>
					<td align="center" valign="middle"><%=dto.getEmail() %></td>
					<td align="center" valign="middle"><%=sdf.format(dto.getGaipday()) %></td>
					<td align="center" valign="middle">
						<button type="button" class="btn btn-danger btn-sm"
						onclick="del(<%=dto.getNum()%>)">DROP</button>
					</td>
				</tr>
			<%}
		}
	%>
</table>
</body>
</html>