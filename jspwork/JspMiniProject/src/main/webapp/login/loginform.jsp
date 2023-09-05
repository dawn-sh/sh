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
	String saveok=(String)session.getAttribute("saveok");

	String myid="";
	
	if(saveok!=null)
	{
		myid=(String)session.getAttribute("myid");
	}
%>
<body>
<div style="margin: 100px 200px;">
	<form action="login/loginaction.jsp" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<caption align="top"><b>SESSION LOGIN</b></caption>
			<tr>
				<td colspan="2" align="center">
					<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked" %>>STORE ID
				</td>
			</tr>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="id" class="form-control" required="required"
					style="width: 120px;" value="<%=myid%>">
				</td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td>
					<input type="password" name="pass" class="form-control" required="required"
					style="width: 150px;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;">LOGIN</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>