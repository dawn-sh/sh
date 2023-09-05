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
<script type="text/javascript">
	$(function(){
		
		$(".btndelete").click(function(){
			
			var num=$(this).attr("num");
			//alert(num);
			
			var ans=confirm("Are you real Withdrawal??");
			
			if(ans)
			{
				location.href="member/deleteme.jsp?num="+num;
			}
		});
	});
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("myid");
%>
<body>
<table class="table table-bordered" style="width: 600px;">
<%
	for(MemberDto dto:list)
	{
		if(loginok != null && dto.getId().equals(id))
		{//loginok!=null은 혹시나 하는 null값 체크%>
		<tr>
			<td style="width: 200px;" align="center" rowspan="5" valign="middle">
				<img src="image/forest.jpeg" style="width: 200px;">
			</td>
			<td align="center" valign="middle">
				<b>NAME.<%=dto.getName() %></b>
			</td>
			<td rowspan="5" align="center" valign="middle">
				<button type="button" class="btn btn-warning btn-sm"
				onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">MODIFY</button>
				<br><br>
				<button type="button" class="btn btn-danger btn-sm btndelete" num=<%=dto.getNum() %>
				onclick="location.href=''">Withdrawal</button>
			</td>
		</tr>
		
		<tr>
			<td align="center" valign="middle">
				<b>ID.<%=dto.getId() %></b>
			</td>
		</tr>
		
		
		<tr>
			<td align="center" valign="middle">
				<b>HP.<%=dto.getHp() %></b>
			</td>
		</tr>
		
		
		<tr>
			<td align="center" valign="middle">
				<b>ADDR.<%=dto.getAddr()%></b>
			</td>
		</tr>
		
		
		<tr>
			<td align="center" valign="middle">
				<b>EMAIL.<%=dto.getEmail() %></b>
			</td>
		</tr>
	<%}
	}
%>
</table>
</body>
</html>