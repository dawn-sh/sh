<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	img.photo{
		width: 200px;
		height: 230px;
		border: 1px solid gray;
		border-radius: 20px;
		margin-bottom: 10px;
	}
	
	tr{
		padding: 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("a.godetail").click(function(){
			var shopnum=$(this).attr("shopnum");
			//alert(num);
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		});
	});
</script>
</head>
<%
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllDataes();
%>
<body>
<div class="container mt-3">
  <h2>Toggleable Tabs</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-1">All</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-2">Outer</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-3">Top</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-4">Bottom</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-5">Accessories</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-6">Set</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="tabs-1" class="container tab-pane active"><br>
    	<p>
    		<table class="table table-bordered" style="width: 700px;">
    			<caption align="top"><b>ALL PRODUCT LIST</b></caption>
    			<tr>
    				<%
    					NumberFormat nf=NumberFormat.getCurrencyInstance();
    					int i=0;
    					for(ShopDto dto:list)
    					{
    						String photo=dto.getPhoto();
    						
    						//20~50까지 랜덤 할인율
    						int sale=(int)(Math.random()*31)+20;
    						%>
    						<td>
    							<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
    							<img alt="" src="shopsave/<%=photo%>" class="photo"></a>
    							<br>
    							<%=dto.getSangpum() %><br>
    							<b style="color:red; font-size: 1.2em;"><%=sale %>%</b>
    							<span style="float: right;">
    								<div style="color: gray; font-size: 12px;">
    									<%
    										int price=(int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
    									%>
    									<strike><%=nf.format(dto.getPrice()) %></strike>
    								</div>
    								<div style="color: black; font-size: 16px;">
    									<%=nf.format(price) %>
    								</div>
    							</span>
    						</td>
    						<%
    						if((i+1)%4==0)
    						{%>
    							</tr>
    							<tr>
    						<%}
    						i++;
    						%>
    					<%}
    				%>
    			</tr>
    		</table>
    	</p>
    </div>
    <div id="tabs-2" class="container tab-pane"><br>
    	<p>
    		<table class="table table-bordered" style="width: 700px;">
    			<caption align="top"><b>Outer</b></caption>
    			<tr>
    				<%
    					int i1=0;
    					for(ShopDto dto:list)
    					{
    						if(dto.getCategory().equals("Outer"))
    						{
    						String photo=dto.getPhoto();
    						
    						//20~50까지 랜덤 할인율
    						int sale=(int)(Math.random()*31)+20;
    						%>
    						<td>
    							<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail"><img alt="" src="shopsave/<%=photo%>" class="photo"></a>
    							<br>
    							<%=dto.getSangpum() %><br>
    							<b style="color:red; font-size: 1.2em;"><%=sale %>%</b>
    							<span style="float: right;">
    								<div style="color: gray; font-size: 12px;">
    									<%
    										int price=(int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
    									%>
    									<strike><%=nf.format(dto.getPrice()) %></strike>
    								</div>
    								<div style="color: black; font-size: 16px;">
    									<%=nf.format(price) %>
    								</div>
    							</span>
    						</td>
    						<%
    						if((i1+1)%4==0)
    						{%>
    							</tr>
    							<tr>
    						<%}
    						i1++;
    						%>
    					<%}
    					}
    				%>
    			</tr>
    		</table>
    	</p>
    </div>
    <div id="tabs-3" class="container tab-pane"><br>
    	<p>
    		<table class="table table-bordered" style="width: 700px;">
    			<caption align="top"><b>Top</b></caption>
    			<tr>
    				<%
    					int i2=0;
    					for(ShopDto dto:list)
    					{
    						if(dto.getCategory().equals("Top"))
    						{
    						String photo=dto.getPhoto();
    						
    						//20~50까지 랜덤 할인율
    						int sale=(int)(Math.random()*31)+20;
    						%>
    						<td>
    							<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail"><img alt="" src="shopsave/<%=photo%>" class="photo"></a>
    							<br>
    							<%=dto.getSangpum() %><br>
    							<b style="color:red; font-size: 1.2em;"><%=sale %>%</b>
    							<span style="float: right;">
    								<div style="color: gray; font-size: 12px;">
    									<%
    										int price=(int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
    									%>
    									<strike><%=nf.format(dto.getPrice()) %></strike>
    								</div>
    								<div style="color: black; font-size: 16px;">
    									<%=nf.format(price) %>
    								</div>
    							</span>
    						</td>
    						<%
    						if((i2+1)%4==0)
    						{%>
    							</tr>
    							<tr>
    						<%}
    						i2++;
    						%>
    					<%}
    					}
    				%>
    			</tr>
    		</table>
    	</p>
    </div>
    <div id="tabs-4" class="container tab-pane"><br>
    	<p>
    		<table class="table table-bordered" style="width: 700px;">
    			<caption align="top"><b>Bottom</b></caption>
    			<tr>
    				<%
    					int i3=0;
    					for(ShopDto dto:list)
    					{
    						if(dto.getCategory().equals("Bottom"))
    						{
    						String photo=dto.getPhoto();
    						
    						//20~50까지 랜덤 할인율
    						int sale=(int)(Math.random()*31)+20;
    						%>
    						<td>
    							<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail"><img alt="" src="shopsave/<%=photo%>" class="photo"></a>
    							<br>
    							<%=dto.getSangpum() %><br>
    							<b style="color:red; font-size: 1.2em;"><%=sale %>%</b>
    							<span style="float: right;">
    								<div style="color: gray; font-size: 12px;">
    									<%
    										int price=(int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
    									%>
    									<strike><%=nf.format(dto.getPrice()) %></strike>
    								</div>
    								<div style="color: black; font-size: 16px;">
    									<%=nf.format(price) %>
    								</div>
    							</span>
    						</td>
    						<%
    						if((i3+1)%4==0)
    						{%>
    							</tr>
    							<tr>
    						<%}
    						i3++;
    						%>
    					<%}
    					}
    				%>
    			</tr>
    		</table>
    	</p>
    </div>
    <div id="tabs-5" class="container tab-pane"><br>
    	<p>
    		<table class="table table-bordered" style="width: 700px;">
    			<caption align="top"><b>Accessories</b></caption>
    			<tr>
    				<%
    					int i4=0;
    					for(ShopDto dto:list)
    					{
    						if(dto.getCategory().equals("Accessories"))
    						{
    						String photo=dto.getPhoto();
    						
    						//20~50까지 랜덤 할인율
    						int sale=(int)(Math.random()*31)+20;
    						%>
    						<td>
    							<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
    							<img alt="" src="shopsave/<%=photo%>" class="photo"></a>
    							<br>
    							<%=dto.getSangpum() %><br>
    							<b style="color:red; font-size: 1.2em;"><%=sale %>%</b>
    							<span style="float: right;">
    								<div style="color: gray; font-size: 12px;">
    									<%
    										int price=(int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
    									%>
    									<strike><%=nf.format(dto.getPrice()) %></strike>
    								</div>
    								<div style="color: black; font-size: 16px;">
    									<%=nf.format(price) %>
    								</div>
    							</span>
    						</td>
    						<%
    						if((i4+1)%4==0)
    						{%>
    							</tr>
    							<tr>
    						<%}
    						i4++;
    						%>
    					<%}
    					}
    				%>
    			</tr>
    		</table>
    	</p>
    </div>
    <div id="tabs-6" class="container tab-pane"><br>
    	<p>
    		<table class="table table-bordered" style="width: 700px;">
    			<caption align="top"><b>Set</b></caption>
    			<tr>
    				<%
    					int i5=0;
    					for(ShopDto dto:list)
    					{
    						if(dto.getCategory().equals("Set"))
    						{
    						String photo=dto.getPhoto();
    						
    						//20~50까지 랜덤 할인율
    						int sale=(int)(Math.random()*31)+20;
    						%>
    						<td>
    							<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail"><img alt="" src="shopsave/<%=photo%>" class="photo"></a>
    							<br>
    							<%=dto.getSangpum() %><br>
    							<b style="color:red; font-size: 1.2em;"><%=sale %>%</b>
    							<span style="float: right;">
    								<div style="color: gray; font-size: 12px;">
    									<%
    										int price=(int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
    									%>
    									<strike><%=nf.format(dto.getPrice()) %></strike>
    								</div>
    								<div style="color: black; font-size: 16px;">
    									<%=nf.format(price) %>
    								</div>
    							</span>
    						</td>
    						<%
    						if((i5+1)%4==0)
    						{%>
    							</tr>
    							<tr>
    						<%}
    						i5++;
    						%>
    					<%}
    					}
    				%>
    			</tr>
    		</table>
    	</p>
    </div>
  </div>
</div>
</body>
</html>