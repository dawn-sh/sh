<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.eclipse.jdt.internal.compiler.util.SimpleLookupTable"%>
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
	<div class="inputform" style="width: 600px;">
		<form action="shop/addaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<caption align="top"><b>Product ADD</b></caption>
					<tr>
						<td style="width: 150px;" class="table-success">
							<b>Category</b></td>
							<td>
							<select class="form-control" name="category" required="required"
							style="width: 200px;">
								<option value="Outer">Outer</option>
								<option value="Top">Top</option>
								<option value="Bottom">Bottom</option>
								<option value="Accessories">Accessories</option>
								<option value="Set">Set</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td style="width: 150px;" class="table-success">
							<b>Product's Name</b>
						</td>
						<td>
							<input type="text" name="sangpum" class="form-control"
							required="required" style="width: 200px;" placeholder="write product' name">
						</td>
					</tr>
					
					<tr>
						<td style="width: 150px;" class="table-success">
							<b>Product's Image</b>
						</td>
						<td>
							<input type="file" name="photo" class="form-control"
							required="required" style="width: 400px;">
						</td>
					</tr>
					
					
					<tr>
						<td style="width: 150px;" class="table-success">
							<b>Product's Price</b>
						</td>
						<td>
							<input type="text" name="price" class="form-control"
							required="required" style="width: 200px;" placeholder="write product's price">
						</td>
					</tr>
					
					
					<tr>
						<td style="width: 150px;" class="table-success">
							<b>Ipgoday</b>
						</td>
						<td>
						<%
							//현재날짜 구하기
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
							String day=sdf.format(new Date()); //오늘 날짜
						%>
							<input type="date" name="ipgoday" class="form-control"
							required="required" value="<%=day%>" style="width: 300px;">
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-outline-info"
							style="width: 100px;">Save Product</button>
							<button type="button" class="btn btn-outline-success"
							style="width: 100px;" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">Product List</button>
						</td>
					</tr>
					
					
			</table>
		</form>
	</div>
</body>
</html>