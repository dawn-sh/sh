<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.quiz.QuizBoardDao"%>
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
</head>
<%
	QuizBoardDao dao=new QuizBoardDao();
	
	
	int totalCount=dao.getTotalCount(); // 전체개수
	int totalPage; // 총 페이지 수
	int startPage; // 각 블럭에서 보여질 시작페이지
	int endPage; // 각 블럭에서 보여질 끝페이지
	int startNum; // db에서 가져올 글의 시작번호(mysql은 첫 글 번호가 0, oracle은 1)
	int perPage=5; // 1페이지당 보여질 글의 갯수
	int perBlock=5; // 1블럭당 보여질 페이지 갯수
	int currentPage; // 현재페이지
	int no; //각 페이지당 출력할 시작번호...해도안해도 상관없지만 미리 처리해줌

	//현재페이지 읽기(단 null일 경우는 1페이지로 준다)		계산을 해야하므로 int로 형변환해줌
	if(request.getParameter("currentPage")==null) //현재 페이지가 없다
    	currentPage=1; //현재 페이지를 1로 하겠다
 	else //현재 페이지가 있다
    	currentPage=Integer.parseInt(request.getParameter("currentPage")); //받은 페이지로 현재 페이지를 하겠다
    
    //총 페이지 수 구하기
    //총 글의 개수/한 페이지당 보여질 개수로 나눔(7/5=1)
    //나머지가 1이라도 있으면 무조건 1페이지 추가한다는 의미(1+1=2 페이지가 필요)
  	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
    //각 블럭당 보여야할 시작페이지
    //perBlock=5일 경우는 현재페이지 1~5 시작:1 끝:5
    //현재페이지 13일 경우 시작:11 끝:15
  	startPage=(currentPage-1)/perBlock*perBlock+1;
     
  	endPage=startPage+perBlock-1;
    
  	//perBlock=5일 경우 맨 마지막 페이지가 23이라면 마지막 블록은 25가 아니라 23이 마지막 페이지이기 때문에 예외처리
  	//총 페이지가 23일 경우 마지막 블럭은 25가 아니라 23이다
	if(endPage>totalPage)
    	endPage=totalPage;

  	//각 페이지에서 보여질 시작번호
  	//1페이지:0, 2페이지:5, 3페이지:10.....
  	//=(현재페이지-1)*각 페이지마다
  	startNum=(currentPage-1)*perPage;
  	
  	
  	//각 페이지당 출력할 시작번호 구하기...no(넘버링)
  	//총 글 개수가 23이면 1페이지 시작번호:23, 2페이지는 18, 3페이지는 13......
  	no=totalCount-(currentPage-1)*perPage;
  	
  	
  	
  	//페이지에서 보여질 글만 가져오기
  	List<QuizBoardDto> list=dao.getPagingList(startNum, perPage);
	
%>
<body>
<div>
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<th><h4><b>전체글보기</b></h4>
			<%=totalCount %>개의 글
			<span style="float: right;">
			<button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='quizlist.jsp'">
			<i class="bi bi-list-columns"></i></button>
			<button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='quizimagelist.jsp'">
			<i class="bi bi-view-list"></i></button>
			</span>
			</th>
		</tr>
		<%
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");	
		
			for(int i=0;i<list.size();i++)
			{
				QuizBoardDto dto=list.get(i);%>
				<tr>
					<td>
						<%=no-- %>
						<span style="margin-left: 20px;"><%=dto.getTitle() %></span>
						<img style="width: 30px;" src="<%=dto.getImgname() %>">
						<span style="float: right;"><%=dto.getReadcount() %></span>
						<span style="float: right; margin-left: 50px; margin-right: 30px;"><%=sdf.format(dto.getWriteday()) %></span>
						<span style="float: right; margin-left: 50px;"><%=dto.getWriter() %></span>
					</td>
				</tr>
			<%}
		%>
	</table>
		<div>
			<ul class="pagination">
				<%
					//이전버튼
					if(startPage>=1)
					{%>
						<li class="page-item">
      						<a class="page-link" href="boardlist.jsp?currentPage=<%=startPage-1 %>" aria-label="Previous">
        					<span aria-hidden="true">&laquo;</span></a>
   						</li>
					<%}
				
					for(int pp=startPage;pp<=endPage;pp++)
					{
						//현재페이지에 css추가를 위한 조건
						if(pp==currentPage)
						{%>
							<li class="page-item active">
								<a class="page-link" href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
							</li>
						<%}
						else //선택 안한 페이지는 색이 다른 색이기 때문에 똑같이 적어도 괜찮다
						{%>
							<li class="page-item">
								<a class="page-link" href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
							</li>
						<%}
					}
					
					//다음버튼
					if(endPage<=totalPage)
					{%>
						<li class="page-item">
     						<a class="page-link" href="boardlist.jsp?currentPage=<%=endPage+1%>" aria-label="Next">
      						<span aria-hidden="true">&raquo;</span></a>
    					</li>
					<%}
				%>
			</ul>
		</div>
	</div>
</body>
</html>