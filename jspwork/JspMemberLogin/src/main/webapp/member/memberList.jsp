<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.MemberDto"%>
<%@page import="java.util.Vector"%>
<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- modal 하위 위해서 2번째 script도 가져오고 부트스트랩3의 stylesheet css 가져와야한다 --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function funcdel(num)
	{
		//alert(num); 시퀀스 번호 불러오는지 확인
		
		$("#btnmdel").attr("num",num); //탈퇴확인버튼에 num값을 넘겨주면 나중에 다른 이벤트로 num값 넘겨줄 수 있기 때문
		$("#myModal").modal();
		
		//선생님 버전은 밑쪽에 따로 script 주기
		$("#btnmdel").click(function(){
			location.href='deleteMember.jsp?num='+num;
		});
	}
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	Vector<MemberDto> list=dao.getAllDataes();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<button type="button" class="btn btn-info" onclick="location.href='addForm.jsp'">회원가입</button>
<button type="button" class="btn btn-outline-info" onclick="location.href='loginForm.jsp'">로그인</button>
<br><br>


<button type="button" class="btn btn-danger" 
onclick="location.href='logoutAction.jsp'">logout</button>

<br>
<table class="table table-bordered" style="width: 600px;">
	<tr align="center">
		<caption align="top"><b>총 <%=list.size() %>명의 회원이 있습니다</b></caption>
		<th style="width: 50px;">번호</th>
		<th style="width: 90px;">아이디</th>
		<th style="width: 70px;">회원명</th>
		<th style="width: 140px;">핸드폰</th>
		<th style="width: 100px;">가입일</th>
		<th style="width: 100px;">편집</th>
	</tr>
	
	<%
		for(int i=0;i<list.size();i++)
		{	
			MemberDto dto=list.get(i);
			
		%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %>
				<img src="<%=dto.getImage() %>" style="width:50px; height: 50px; border-radius: 50px;"></td>
				<td><%=dto.getHp() %></td>
				<td><%=sdf.format(dto.getGaip()) %></td>
				<td>
				
				<%-- 로그인한 본인만 수정 삭제 가능 하도록 수정 --%>
				<%
					/* 로그인한 본인꺼만 수정/삭제 보이도록... */
					String loginok=(String)session.getAttribute("loginok");
					String id=(String)session.getAttribute("id");
					
					//로그인한 본인꺼만 나오도록
					//loginok가 널값이 아니고 세션에 저장한(db에 저장한)id와 값이 같다면
					if(loginok!=null && dto.getId().equals(id))
					{%>
						<button type="button" class="btn btn-warning btn-sm"
						onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>
						<button type="button" class="btn btn-danger btn-sm"
						onclick="funcdel(<%=dto.getNum()%>)" >삭제</button>
					<%}
					else
					{%>
						<h6>권한없음</h6>
					<%}
					
				%>
				</td>
			</tr>
		<%}
	%>
</table>


  <%-- Modal --%>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <%-- Modal content--%>
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원탈퇴</h4>
        </div>
        <div class="modal-body">
          <p>회원탈퇴를 원하시면 [탈퇴확인]을 눌러주세요</p>
          <button type="button" class="btn btn-danger"
          id="btnmdel" num="">탈퇴확인</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>