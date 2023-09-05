<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	span.day{
		float: right;
		font-size: 11pt;
		color: gray;
	}
	
	img.photo{
		border-radius: 20px;
		border: 1px solid gray;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("span.likes").click(function(){
			var num=$(this).attr("num");
			//alert(num);
			var tag=$(this);
			
			
			$.ajax({
						
				type:"get",
				dataType:"json",
				url:"guest/ajaxlikes.jsp",
				data:{"num":num},
				success:function(data){
					
					//alert(data.chu); //ajaxlikes.jsp에서 넘겨준 chu 값
					tag.next().text(data.chu);
					
					
					//추천클릭시 하트 커지고 끝나면 다시 0px;
					tag.next().next().animate({"font-size":"20px"},1000,function(){
						$(this).css("font-size","0px");
					});
				}
			})
		});
		
		//댓글부분 무조건 안보이게 처리
		$("div.answer").hide();
		
		//댓글클릭시 댓글부분이 보였다 안보였다 하기
		$("span.answer").click(function(){
			
			//$(this).prev().slideToggle();
			$(this).parent().find("div.answer").slideToggle();
		});	
		
		

		$("i.adel").click(function(){
			
			var a=confirm("if you want to delete it, please click confirm");
			
			if(a)
			{
				var idx=$(this).attr("idx");
							
				//alert(idx);
					
				$.ajax({
				
						type:"get",
						dataType:"html",
						url:"guest/answerdelete.jsp",
						data:{"idx":idx},
						success:function(){
						
							location.reload();//새로고침
						}
				});
			}
		});
		

		$("i.aedit").click(function(){
			
			var idx=$(this).attr("idx");
			var content=$(this).parent().parent().find("span.acontents").text();
			$("#content").text(content);
			$("#modalidx").val(idx);
		});
		
		$(".saveans").click(function(){
			var content=$("#content").val();
			var idx=$("#modalidx").val();
			
			$.ajax({
					
				type:"get",
				//서버로부터 받은 데이터를 HTML 문자열로 처리합니다.
				//이 경우, 받은 HTML 코드를 그대로 사용할 수 있습니다.
				//이 데이터를 DOM에 삽입하거나 다른 HTML 요소와 결합하는 등의 작업을 수행할 수 있습니다.
				dataType:"html",
				url:"guest/answerupdate.jsp",
				/* String값인 "idx"는 action에서 받는 getParameter값
				-> 값을 action으로 보내고 action에서 실행시키고 html로 그 값을 받아온다
				(그곳에서 실행하고 값을 받아오는게 success됐으면 밑으로 이동해서 코드 실행하기 때문)
				-> success는 html로 값을 받아왔을때
				/ idx 위에서 대입 받는 값 */
				data:{"idx":idx,"content":content},
				success:function(data){
						
					location.reload();
				}
			});
		});  
	});
	



	function del(num,currentPage)
	{
		var check=confirm("Do you want to delete this Writing");
		
		if(check)
		{
			location.href='guest/deleteproc.jsp?num='+num+'&currentPage='+currentPage;
		}
	}
</script>
</head>
<%
	//로그인 상태 확인 후 입력 폼 나타낼것_회원만 보이게
	String loginok=(String)session.getAttribute("loginok");

	GuestDao dao=new GuestDao();
	
	int totalCount=dao.getTotalCount(); // 전체개수
	int totalPage; // 총 페이지 수
	int startPage; // 각 블럭에서 보여질 시작페이지
	int endPage; // 각 블럭에서 보여질 끝페이지
	int startNum; // db에서 가져올 글의 시작번호(mysql은 첫 글 번호가 0, oracle은 1)
	int perPage=2; // 1페이지당 보여질 글의 갯수
	int perBlock=5; // 1블럭당 보여질 페이지 갯수
	int currentPage; // 현재페이지

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
  	
  	//각페이지 필요한 게시글 가져오기
  	List<GuestDto> list=dao.getList(startNum, perPage);
  	
  	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
  	
  	//마지막 방명록 삭제시 빈 공간이 나오기 때문에 예외처리
  	//마지막 페이지 남은 1개 글 지우면 빈페이만 남는다.(해결책)이전페이지로 간다
  	if(list.size()==0&&currentPage!=1)
  	{%>
  		<script type="text/javascript">
  			location.href="index.jsp?main=guest/guestlist.jsp?currenPage=<%=currentPage-1%>"
  		</script>
  	<%}
%>
<body>
<%
	if(loginok!=null)
	{%>
		<jsp:include page="addform.jsp"/>
		<hr align="left" width="700">
	<%}
%>
<div>
	<b>총 <%=totalCount %>개의 방명록 글이 있습니다</b>
	
	
	<%
		MemberDao mdao=new MemberDao();
		for(GuestDto dto:list)
		{
			//이름 얻기
			String name=mdao.getName(dto.getMyid());
			%>
			<table class="table" style="width: 600px;">
				<tr>
					<td>
						<b><i class="bi bi-person-square"></i><%=name %>(<%=dto.getMyid() %>)</b>
						
						<%
							//로그인한 아이디
							String myid=(String)session.getAttribute("myid");
						
							//로그인한 아이디와 글쓴아이디가 같을 경우에만 수정,삭제
							if(loginok!=null && dto.getMyid().equals(myid))
							{%>
								|<a href="index.jsp?main=guest/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: green;"><i class="bi bi-pencil-square"></i>수정</a>
								|<a href="#" onclick="del(<%=dto.getNum()%>,<%=currentPage %>)" style="color: red;"><i class="bi bi-trash3"></i>삭제</a>
							<%}
						%>
						<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					</td>
				</tr>
				
				<tr height="120">
					<td>
						<%-- 이미지가 null이 아닌경우만 출력 --%>
						<%
							if(dto.getPhotoname()!=null)
							{%>
								<a href="save/<%=dto.getPhotoname()%>" target="_blank"> <%-- a태그 누를경우 실제 사이즈가 보이게 이동 --%>
								<img src="save/<%=dto.getPhotoname()%>" align="left"
								style="width: 100px;" hspace="20" class="photo">
								</a>
							<%}
						%>
						
						<%=dto.getContent().replace("\n", "<br>") %>
					</td>
				</tr>
				
				<%-- 댓글,추천 --%>
				<tr>
					<td>
					
					<%
						//각 방명록에 달린 댓글 목록 가져오기
						AnswerDao adao=new AnswerDao();
						List<AnswerDto> alist=adao.getAllAnswers(dto.getNum());
					%>
					
					
					
					<div class="answer">
						<%
							if(loginok!=null)
							{%>
								<div class="answerform">
									<form action="guest/answerinsert.jsp" method="post">
										<table class="table table-bordered" style="width: 500px;">
											<tr>
												<td>
													<textarea style="width: 500px; height: 80px;"
													name="content" required="required"
													class="form-control"></textarea>
												</td>
												<td>
													<button type="submit" class="btn btn-outline-info"
													style="width: 80px; height: 80px;">등록</button>
													<%-- hidden값 3개 db에 들어갈거 2개 현재페이지에 들어갈거 1개
														 폼에 있는 값은 content뿐으로 db에 넘길 값을 추가적으로 넘겨줘야함 --%>
													<input type="hidden" name="num" value="<%=dto.getNum()%>">
													<input type="hidden" name="myid" value="<%=myid%>">
													<input type="hidden" name="currentPage" value="<%=currentPage%>">
												</td>
											</tr>
										</table>
									</form>
								</div>
							<%}
						%>
						
						<div class="answerlist">
							<table class="table" style="width: 480px;">
								<%
									for(AnswerDto adto:alist)
									{%>
										<tr>
											<td width="60">
												<i class="bi bi-person-lines-fill"></i>
											</td>
											<td>
												<%
													//작성자명
													String aname=mdao.getName(adto.getMyid());
												%>
												<br>
												<b><%=aname %></b>
												&nbsp;
												<%
													//글쓴이와 댓글쓴이가 같을 경우 [작성자]
													if(dto.getMyid().equals(adto.getMyid()))
													{%>
														<span style="color: red; border: 1px solid red; padding: 2px; border-radius: 10px;">작성자</span>
													<%}
												%>
												
												<span style="font-size: 12pt; color: gray; margin-left: 30px;"><%=sdf.format(adto.getWriteday()) %></span>
												<br>
												<span class="acontents"><%=adto.getContent().replace("\n","<br>") %></span>
												<%
													//수정 삭제는 로그인중이면서 로그인한 아이디와 같은 경우만 보이게
													if(loginok!=null && adto.getMyid().equals(myid))
													{%>
														<span style="float: right;">
														<i class="bi bi-pencil-square aedit" style="cursor: pointer;"
														idx=<%=adto.getIdx() %> data-bs-toggle="modal" data-bs-target="#myModal"></i> &nbsp;
														<i class="bi bi-trash-fill adel" style="cursor: pointer;"
														idx=<%=adto.getIdx() %>></i>
														</span>
													<%}
												%>
											</td>
										</tr>
									<%}
								%>
								
								<!-- The Modal은 ajax로만 가능 -->
								<div class="modal" id="myModal">
								  <div class="modal-dialog">
								    <div class="modal-content">
								
								      <!-- Modal Header -->
								      <div class="modal-header">
								        <h4 class="modal-title">Edit</h4>
								        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								      </div>
								
								      <!-- Modal body -->
								      <div class="modal-body">
								        <textarea style="width: 470px; height: 80px;" id="content"></textarea>
								      </div>
								
								      <!-- Modal footer -->
								      <div class="modal-footer">
								        <button type="button" class="btn btn-warning saveans" data-bs-dismiss="modal">SAVE</button>
								        <input type="hidden" id="modalidx" value="">
								      </div>
								
								    </div>
								  </div>
								</div>
							</table>
						</div>
					</div>
					
						<span class="answer" style="cursor: pointer;"
						num=<%=dto.getNum() %>>댓글<%=alist.size() %></span>
						<%-- 추천을 누르면 chu가 증가하는 구조 --%>
						<span class="likes" style="margin-left: 20px; cursor: pointer;"
						num=<%=dto.getNum() %>>추천</span>
						<span class="chu"><%=dto.getChu() %></span>
						<%-- 추천수 클릭시 추천 숫자 옆에 하트 커졌다 사라지게//눌렀을때만 나타나게 하기 위해서 font-size:0 --%>
						<i class="bi bi-heart-fill" style="color: red; font-size: 0px;"></i>
					</td>
				</tr>
			</table>
		<%}%>
	
			<%-- 페이지번호 출력 --%>
		<div style="width: 600px; text-align: center;">
			<ul class="pagination justify-content-center">
				<%
					//이전버튼
					if(startPage>1)
					{%>
						<li class="page-item">
      						<a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1 %>" tabindex="-1" aria-disabled="true">Previous</a>
   						</li>
					<%}
				
					for(int pp=startPage;pp<=endPage;pp++)
					{
						//현재페이지에 css추가를 위한 조건
						if(pp==currentPage)
						{%>
							<li class="page-item active">
								<a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
							</li>
						<%}
						else //선택 안한 페이지는 색이 다른 색이기 때문에 똑같이 적어도 괜찮다
						{%>
							<li class="page-item">
								<a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
							</li>
						<%}
					}
					
					//다음버튼
					if(endPage<totalPage)
					{%>
						<li class="page-item">
     						<a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1%>">Next</a>
    					</li>
					<%}
				%>
			</ul>
		</div>
</div>
</body>
</html>