<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
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
	a:link,a:visited{
		text-decoration: none;
		color: black;
	}
	a:hover{
		text-decoration: underline;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//allcheck 클릭시 체크값 얻어서 모든 체크값 전달하기
		$(".alldelcheck").click(function(){
			
			//전체 체크값 얻기
			var check=$(this).is(":checked");
			console.log(check);
			
			//전체체크값을 글 앞의 체크에 일괄 전달
			//prop 이벤트 속성 전달 해주는 메서드
			$(".delcheck").prop("checked",check);
			
		});
		
		$("#btndel").click(function(){
			
			//체크된 길이값 구하기
			var len=$(".delcheck:checked").length;
			//alert(len);
			
			if(len==0)
			{
				alert("please click checkbox at least 1");
			}
			else
			{
				var a=confirm("Do you want to delete total "+len+"? please check yes");
				
				//체크된 곳의 value값 얻기(num)
				var n="";
				
				$(".delcheck:checked").each(function(idx){
					
					n+=$(this).val()+",";
				});
				
				//마지막 컴마 제거
				n=n.substring(0,n.length-1);
				
				console.log(n);
				
				//삭제파일로 전송
				location.href="board/alldelete.jsp?nums="+n;
			}
		});
	});
</script>
</head>
<body>
<%
	SmartDao dao=new SmartDao();
	
	int totalCount=dao.getTotalCount(); 
	int totalPage; 
	int startPage; 
	int endPage; 
	int startNum; 
	int perPage=10; 
	int perBlock=5; 
	int currentPage;
	int no;

	if(request.getParameter("currentPage")==null||request.getParameter("currentPage").equals("null"))
    	currentPage=1;
 	else
    	currentPage=Integer.parseInt(request.getParameter("currentPage"));
    
  	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
  	startPage=(currentPage-1)/perBlock*perBlock+1;
     
  	endPage=startPage+perBlock-1;
    
	if(endPage>totalPage)
    	endPage=totalPage;

  	startNum=(currentPage-1)*perPage;
  	
  	no=totalCount-(currentPage-1)*perPage;
  	
  	List<SmartDto> list=dao.getPagingList(startNum, perPage);
  	
  	
  	
  	//댓글 dao
  	SmartAnswerDao adao=new SmartAnswerDao();
  	for(SmartDto dto:list)
  	{
  		//댓글 변수에 댓글 총 갯수 넣기
  		int acount=adao.getAllSmartAnswers(dto.getNum()).size();
  		dto.setAnswercount(acount);
  	}
%>

<div>
	<table class="table table-bordered" style="width: 1000px;">
		<caption align="top">SMART LIST</caption>
		<tr align="center">
			<th style="width: 80px; background-color: #4682b4;">NO</th>
			<th style="width: 500px; background-color: #4682b4;">Title</th>
			<th style="width: 100px; background-color: #4682b4;">Writer</th>
			<th style="width: 200px; background-color: #4682b4;">Writeday</th>
			<th style="width: 80px; background-color: #4682b4;">Views</th>
		</tr>
		
	<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="5" align="center">
					<h3><b>Don't have list</b></h3>
				</td>
			</tr>
		<%}
		else
		{
			for(SmartDto dto:list)
			{	
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
			%>
				<tr>
					<td align="center" valign="middle">
						<input type="checkbox" value="<%=dto.getNum()%>" class="delcheck">
						&nbsp;&nbsp;
						<%=no-- %>
					</td>
					<td align="center">
					<a href="index.jsp?main=board/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>">
					<%=dto.getSubject() %></a>
					
					<%-- 댓글 갯수 출력 --%>
					<%
						if(dto.getAnswercount()>0)
						{%>
							<a href="index.jsp?main=board/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>#alist" <%-- #id : contentview에 b태그 댓글에 준 id로 바로 이동 --%>
							style="color: red;">[<%=dto.getAnswercount() %>]</a>
						<%}
					%>
					</td>
					<td align="center"><%=dto.getWriter() %></td>
					<td align="center"><%=sdf.format(dto.getWriteday()) %></td>
					<td align="center"><%=dto.getReadcount() %></td>
				</tr>
			<%}
		}
		%>
		<tr valign="middle">
			<td colspan="5">
				<input type="checkbox" class="alldelcheck">&nbsp;ALL CHECK
				<span style="float: right;">
					<button type="button" class="btn btn-outline-info btn-sm"
					onclick="location.href='index.jsp?main=board/smartform.jsp'"><i class="bi bi-pen"></i>WRITE</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
					id="btndel"><i class="bi bi-trash">DELETE</button>
				</span>
			</td>
		</tr>
	</table>
	
	<%-- 페이지번호 출력 --%>
		<div>
			<ul class="pagination">
				<%
					//이전버튼
					if(startPage>1)
					{%>
						<li class="page-item">
      						<a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1 %>" tabindex="-1" aria-disabled="true">Previous</a>
   						</li>
					<%}
				
					for(int pp=startPage;pp<=endPage;pp++)
					{
						//현재페이지에 css추가를 위한 조건
						if(pp==currentPage)
						{%>
							<li class="page-item active">
								<a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
							</li>
						<%}
						else //선택 안한 페이지는 색이 다른 색이기 때문에 똑같이 적어도 괜찮다
						{%>
							<li class="page-item">
								<a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
							</li>
						<%}
					}
					
					//다음버튼
					if(endPage<totalPage)
					{%>
						<li class="page-item">
     						<a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1%>">Next</a>
    					</li>
					<%}
				%>
			</ul>
		</div>
</div>
</body>
</html>