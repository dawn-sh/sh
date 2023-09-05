<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
<script type="text/javascript">
	$(function(){
		
		//id중복체크
		$("#btncheck").click(function(){
			
			//id읽기
			var id=$("#id").val();
			//alert(id); id 잘 가져오는지 확인
			
			$.ajax({
			
				type:"get",
				url:"member/idsearch.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(data){
					
					//alert(data.check); 0,1 반환확인
					if(data.check==1)
					{
						//alert("already using this ID\nplease write it again");
						$("span.idsuccess").text("fail"); //중복체크 옆에 빈 span태그로 fail 출력
						$("#id").val(""); //id 확인 후 빈 칸으로 변경
						$("#id").focus();
					}
					/* else if($("#id").val("")) //id칸이 빈칸이라면
					{
						$("span.idsuccess").text("please fill out ID");
						$("#id").val("");
						$("#id").focus();
					} */
					else //입력한 id가 db에 없어서 사용할 수 있는 id라면
					{
						//alert("You can use this ID")
						$("span.idsuccess").text("success");
					}
				}
			})
		});
		
		//선택 이메일 주소 넣기..혹은 직접입력
		$("#selemail").change(function(){
			
			var sel=$(this).val();
			if(sel=="-")
			{
				$("#email2").val("");
				$("#email2").focus();
			}
			else
			{
				$("#email2").val(sel);
			}
		});
	});
	
	
	function check(f)
	{
		if(f.pass.value!=f.pass2.value)
		{
			alert("not match password");
			f.pass.value="";
			f.pass2.value="";
			
			return false; //submit이 실행되지 않아서 action으로 넘어갈 수 없게 해주는(action이 호출되지 않음) 역할
		}
	}
</script>
</head>
<%
	String num=request.getParameter("num");
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getMember(num);
	
	//email 구분(@기준) #1 ...확장자 구할 때 많이 쓰는 방법
	/* int idx=dto.getEmail().indexOf('@');
	String email1=dto.getEmail().substring(0, idx); //==0~(idx-1) @앞까지 값 구하는 법
	String email2=dto.getEmail().substring(idx+1); //idx+1번지부터 끝까지 */
	
	//@을 구분자로 분리 #2
	StringTokenizer st=new StringTokenizer(dto.getEmail(),"@"); //"@"는 구분자
	String email1=st.nextToken();
	String email2=st.nextToken();
	
%>
<body>
<form action="member/updateproc.jsp" method="post" onsubmit="return check(this)"> <%-- submit을 할때 함수 check를 해야지 넘어갈 수 있다
																				확인하기 위해선 form에 필수 값들을 다 채워야 작동유무 확인가능 --%>
	<table class="table table-bordered" style="width: 500px;">
	<input type="hidden" name="num" value="<%=num%>">
		<caption align="top"><b>MODIFY</b></caption>
			<tr>
				<th style="width: 100px; background-color: #00ced1">ID</th>
				<td>
					<input type="text" name="id" id="id" value="<%=dto.getId() %>"
					class="form-group" required="required" style="width: 120px;">
					<button type="button" class="btn btn-danger btn-sm"
					id="btncheck">Id Check</button>
					
					<span class="idsuccess"></span>
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #00ced1">PASSWORD</th>
				<td>
					<input type="password" name="pass" class="form-group"
					required="required" style="width: 120px;" placeholder="password">
					<input type="password" name="pass2" placeholder="password check"
					required="required" style="width: 120px;">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #00ced1">NAME</th>
				<td>
					<input type="text" name="name"
					required="required" style="width: 150px;" placeholder="name" value="<%=dto.getName()%>">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #00ced1">TELEPHONE</th>
				<td>
					<input type="text" name="hp"
					required="required" style="width: 200px;" placeholder="HP number" value="<%=dto.getHp()%>">
				</td>
			</tr>
			
			
			<tr>
				<th style="width: 100px; background-color: #00ced1">ADDRESS</th>
				<td>
					<input type="text" name="addr"
					required="required" style="width: 350px;" placeholder="address" value="<%=dto.getAddr()%>">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #00ced1">E-MAIL</th>
				<td>
					<input type="text" name="email1" class="form-group"
					required="required" style="width: 120px;" value="<%=email1%>">
					<b>@</b>
					<input type="text" name="email2" id="email2"
					required="required" style="width: 120px;" value="<%=email2%>">
					<select id="selemail">
						<option value="-">WRITE MYSELF</option>
						<option value="naver.com">NAVER</option>
						<option value="gmail.com">GOOGLE</option>
						<option value="hanmail.net">DAUM</option>
						<option value="nate.com">NATE</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info"
					style="width: 120px;">MODIFY</button>
					<button type="submit" class="btn btn-outline-warning"
					style="width: 120px;">RESET</button>
				</td>
			</tr>
	</table>
</form>
</body>
</html>