<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	span.day{
		color: gray;
		font-size: 0.8em;
	}
	
	div.alist{
		margin-left: 20px;
	}
	
	span.aday{
		color: gray;
		font-size: 0.8em;
		margin-left: 20px;
	}
	
	
</style>
<script type="text/javascript">
	function fundel(num,currentPage)
	{
		//alert(num+","+currentPage);
		
		var a=confirm("Do you want to delete? Then click yes");
		
		if(a)
		{
			location.href="board/deleteaction.jsp?num="+num+"&currentPage="+currentPage;
		}
	}
	
	
	
	$(function(){
		
		//시작할때 list 호출
		list();
		

		//댓글부분 ajax insert
		//num alert 테스트
		var num=$("#num").val();
		//alert(num);
		
		$("#btnadd").click(function(){
			
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nickname.trim().length==0)
			{
				swal("no!!!","PLEASE WRITE NICKNAME","error");
				return;
			}
			
			if(content.trim().length==0)
			{
				swal("WAIT!!!","PLEASE WRITE CONTENT","error");
				return;
			}
			
			$.ajax({
				
				type:"get",
				url:"board/insertanswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					
					
					//기존입력값 지우기
					$("#nickname").val("");
					$("#content").val("");
					//리스트
					list();
				},
					statusCode:{
						404:function(){
							alert("Don't find json file");
						},
						500:function(){
							alert("Server Error, please check CODE");
						}
				}
				
			});
		});
		
		
		$(document).on("click","i.adel",function(){
			
			var idx=$(this).attr("idx");
			
			$.ajax({
				
				type:"get",
				dataType:"html",
				url:"board/deleteanswer.jsp",
				data:{"idx":idx},
				success:function(){
					
					location.reload();
				}
			});
		});
	});
	
	
	function list()
	{
		//alert("list num="+$("#num").val());
		
		$.ajax({
			
			type:"get",
			url:"board/listanswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(res){
				
				//댓글갯수출력
				$("b.acount>span").text(res.length);
				
				//출력
				var s="";
				$.each(res,function(idx,item){
					s+="<div>"+item.nickname+":"+item.content;
					s+="<span class='aday'>"+item.writeday+"</span>";
					s+="<i class='bi bi-trash3-fill adel' idx="+item.idx+"></i>";
					s+="</div>";
				});
				
				$("div.alist").html(s);
				
			}
		});
	}
</script>
</head>
<jsp:useBean id="dao" class="data.dao.SmartDao"/>
<body>
<%
	String num=request.getParameter("num");

	String currentPage=request.getParameter("currentPage");
	dao.updateReadCount(num);
	
	SmartDto dto=dao.getData(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<div style="margin: 30px 30px; width: 500px;">

<input type="hidden" id="num" value="<%=num%>">
	<table class="table table-bordered">
		<caption align="top">
			<b><h2><%=dto.getSubject() %></h2></b>
		</caption>
	<tr>
		<td>
			<b>WRITER: <%=dto.getWriter() %></b><br>
			<span class="day"><%=dto.getWriteday() %>
			&nbsp;&nbsp; VIEWS: <%=dto.getReadcount() %></span>
		</td>
	</tr>
	<tr>
		<td>
			<%=dto.getContent() %>
		</td>
	</tr>

	<%-- 댓글 --%>
	<tr>
		<td>
			<b class="acount" id="alist">댓글<span>0</span></b>
			<div class="alist">
				댓글목록
			</div>
			<div class="aform input-group">
				<input type="text" id="nickname" class="form-control" style="width: 130px;"
				placeholder="닉네임입력">
				<input type="text" id="content" class="form-control" style="width: 300px;"
				placeholder="댓글메세지">
				<button type="button" id="btnadd" class="btn btn-outline-info">SAVE</button>
			</div>
		</td>
	</tr>
	
	
	
	
	<tr>
		<td align="right">
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='index.jsp?main=board/smartform.jsp'"><i class="bi bi-pen"></i>WRITE</button>
			<button type="button" class="btn btn-outline-success"
			onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'"><i class="bi bi-list"></i>LIST</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'"><i class="bi bi-pencil-square"></i>MODIFY</button>
			<button type="button" class="btn btn-outline-danger"
			onclick="fundel(<%=num%>,<%=currentPage%>)"><i class="bi bi-trash"></i>DELETE</button>
		</td>
	</tr>
	</table>
</div>
</body>
</html>