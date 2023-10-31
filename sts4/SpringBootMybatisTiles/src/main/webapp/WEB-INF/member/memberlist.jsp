<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$("#allcheck").click(function(){
			
			var chk=$(this).is(":checked");
			console.log(chk);
			
			$(".del").prop("checked",chk);
		});
		
		$("#btnmemberdel").click(function(){
			
			var cnt=$(".del:checked").length;
			alert(cnt);
			
			if(cnt==0)
			{
				alert("먼저 삭제할 사람을 선택하세요");
				return false;
			}
			
			$(".del:checked").each(function(i,element){
				
				var num=$(this).attr("num");
				console.log(num);
				
				//선택한 체크 삭제
				$.ajax({
					
					//MemberController.java에서 넘겨짐
					type:"get",
					url:"delete",
					dataType:"html", //받을 값이 없기 때문에 html로 실행
					data:{"num":num},
					success:function(){
						
						alert("삭제되었습니다");
						location.reload();
					}
				});
			});
		});
		
	});
</script>
</head>
<body>
	<h2>총 ${totalCount }명의 회원이 있습니다</h2>
	<button type="button" class="btn btn-outline-info btn-sm" style="width: 100px;"
	onclick="location.href='form'">회원가입</button>
	
	<table class="table table-bordered" style="width: 1000px;">
		<tr>
			<th width="60">번호</th>
			<th width="160">이름</th>
			<th width="160">아이디</th>
			<th width="200">사진</th>
			<th width="300">주소</th>
			<th width="200">이메일</th>
			<th width="200">가입일</th>
			<th width="120">
				<input type="checkbox" id="allcheck">삭제
			</th>
			
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.name }</td>
				<td>${dto.id }</td>
				<td>
					<img alt="" src="../memberphoto/${dto.photo }" style="width: 30px;">
				</td>
				<td>${dto.addr }</td>
				<td>${dto.email }</td>
				<td>
					<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/>
				</td>
				<td>				
					<input type="checkbox" num=${dto.num } class="del">		
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<button type="button" class="btn btn-outline-danger" id="btnmemberdel" style="width: 80px;">Delete</button>
</body>
</html>