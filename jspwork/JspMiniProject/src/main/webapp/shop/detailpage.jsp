<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
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
	img.large{
		width: 400px;
		height: 480px;
	}
</style>
</head>
<%
	String shopnum=request.getParameter("shopnum");
	
	//로그인상태
	String loginok=(String)session.getAttribute("loginok");
	//로그인한 아이디
	String myid=(String)session.getAttribute("myid");
	//아이디에 해당하는 멤버의 시퀀스
	MemberDao mdao=new MemberDao();
	String num=mdao.getNum(myid);

	ShopDao dao=new ShopDao();
	ShopDto dto=dao.getData(shopnum);
%>

<body>
	<form id="frm">
		<%-- hidden --%>
		<input type="hidden" name="shopnum" value="<%=shopnum%>">
		<input type="hidden" name="num" value="<%=num%>">
		
		<table style="width: 800px;">
			<tr>
				<td style="width: 500px;">
					<div id="photo">
						<img src="shopsave/<%=dto.getPhoto()%>" class="img-thumbnail large">
					</div>
				</td>
				<td>
					<h3>Category: <%=dto.getCategory() %></h3>
					<h3>Product: <%=dto.getSangpum() %></h3>
					<%
						NumberFormat nf=NumberFormat.getCurrencyInstance();
					%>
					<h3>Price: <%=nf.format(dto.getPrice()) %></h3>
					<h3>
						Count:
							<input type="number" min="1" max="10" value="1" step="1" name="cnt">
					</h3>
					<div style="margin-top: 100px; margin-left: 10px;">
						<button type="button" class="btn btn-warning"
						id="btncart">Shopping Basket</button>
						
						<button type="button" class="btn btn-success"
						onclick="location.href='index.jsp?main=shop/shoplist.jsp'">Shopping List</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		
		$("#btncart").click(function(){
			
			var login="<%=loginok%>";
			if(login=="null")
			{
				alert("먼저 로그인을 해주세요");
				return;
			}
			
			//form tag의 모든 값 가져오기
			var formdata=$("#frm").serialize();
			//alert(formdata);
			
			//ajax insert
			$.ajax({
				
				type:"post",
				dataType:"html",
				data:formdata,
				url:"shop/detailcartinsertprocess.jsp",
				success:function(){
					
					//alert("success");
					var a=confirm("Product into your shopping cart,\nIf you want to go to cart, please check yes");
					
					if(a)
					{
						location.href="index.jsp?main=shop/mycart.jsp";
					}
				}
			});
		});
	</script>
</body>
</html>