<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.CartDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
	div.sangpum{
		cursor: pointer;
	}
	div.sangpum img{
		width: 50px;
		height: 70px;
		border: 1px solid gray;
	}
	i.del{
		cursor: pointer;
	}
	
</style>
</head>
<%
	//로그인 id
	String id=(String)session.getAttribute("myid");
	ShopDao dao=new ShopDao();
	//장바구니 목록
	List<HashMap<String,String>> list=dao.getCartList(id);
	
	MemberDao mdao=new MemberDao();
	String name=mdao.getName(id);
%>
<body>
	<h4 class="alert alert-warning"><%=name	%>'s Shopping Cart</h4>
	<table class="table table-striped" style="width: 1200px;">
		<tr>
			<th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
			<th style="width: 200px;">Product Information</th>
			<th style="width: 200px;">Product Price</th>
		</tr>
		
		<%
			int allmoney=0;
			NumberFormat nf=NumberFormat.getCurrencyInstance();
			
			for(int i=0;i<list.size();i++)
			{
				HashMap<String,String> map=list.get(i);
				
				//사진
				String photo=map.get("photo");

				int cnt=Integer.parseInt(map.get("cnt"));
				int price=Integer.parseInt(map.get("price"));
				%>
				<tr>
					<td valign="middle">
						<input type="checkbox" idx="<%=map.get("idx")%>" class="idx">
					</td>
					<td>
						<div class="sangpum" shopnum="<%=map.get("shopnum")%>">
							<img src="shopsave/<%=photo%>" align="left" hspace="20">
							<h6>Product: <%=map.get("sangpum") %></h6>
							<h6>Count: <%=cnt %></h6>
							<h6>Date: <%=map.get("cartday") %></h6>
						</div>
					</td>
					<td valign="middle">
						<%
							price*=cnt;
						
							allmoney+=price;
						%>
						<h5><%=nf.format(price) %>
							<i class="bi bi-trash del" idx="<%=map.get("idx")%>"></i>
						</h5>
					</td>
				</tr>
			<%}
		%>
		
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-danger"
				id="btncartdel">Select Delete</button>
				<span style="font-size: 1.8em; float: right;">
					Total price: <b style="color: cadetblue">
						<%=nf.format(allmoney) %>
					</b>
				</span>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">

		//전체선택시 체크박스 선택 해제
		$("#allcheck").click(function(){
			
			var chk=$(this).is(":checked");
			console.log(chk);
			
			//전체 체크값을 글 앞의 체크에 일괄적으로 전달
			$(".idx").prop("checked",chk);
		});
		
		//상품 클릭시 디테일로
		$("div.sangpum").click(function(){
			
			var shopnum=$(this).attr("shopnum");
			
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
			
		});
	
		$("#btncartdel").click(function(){
			
			//체크한 갯수
			var cnt=$(".idx:checked").length;
			//alert(cnt);
			
			if(cnt==0)
			{
				alert("Please check, you want to delete what it is");
				return;
			}
		});
	</script>
</body>
</html>