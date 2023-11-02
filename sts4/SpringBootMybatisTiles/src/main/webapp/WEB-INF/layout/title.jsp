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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$("#btnloginok").click(function(){
			
			//아이디 비번읽기
			var id=$("#loginid").val();
			var pass=$("#loginpass").val();
			
			//alert(id+","+pass);
			//url 포함시 root 포함
			//var root='${root}';
			//console.log("root"+root);
			
			$.ajax({
				
				type:"get", //ajax는 화면전환이 없기 때문에 get/post 상관없이 사용
				url:"/member/login", //로그인시 루트에서 시작하기 때문에 root/중간경로/login으로 맵핑 되기때문에 중간경로를 무조건 써줘야한다
									 // 원래는 root+"/member/login" 해줘야 했지만 없어도 /member/login에서 member 앞 "/"을 루트로 볼 수 있다
				dataType:"json",
				data:{"id":id,"pass":pass},
				success:function(res){
					
					if(res.result=='fail')
					{
						alert("아이디 혹은 비밀번호를 확인해주세요");
					}
					else
					{
						location.reload();
					}
				}
			});
		});
		
		
		$("#btnlogout").click(function(){
			
			$.ajax({
				
				type:"get",
				url:"/member/logout",
				dataType:"html",
				success:function(){
					
					location.reload();
				}
			});
		});
	});
</script>
</head>
<body>
<!-- root경로 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<a href="/"><img alt="" src="${root }/image/title.png" width="300"></a>
	&nbsp;&nbsp;
	
	<c:if test="${sessionScope.loginok==null }">
		<button type="button" class="btn btn-success"
		onclick="location.href='${root}/login/main'">Login</button>


		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#myModal" id="btnlogin">AjaxLogin</button>
	</c:if>
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">AjaxLogin</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="Enter Username" id="loginid"><br><br>
						<input type="password" class="form-control" placeholder="Enter Password" id="loginpass"><br>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-info" id="btnloginok" data-bs-dismiss="modal">Login</button>
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

	<c:if test="${sessionScope.loginok!=null }">
		<b>${sessionScope.myid }님 로그인 중...</b>
		<button type="button" class="btn btn-danger"
		onclick="location.href='${root}/login/logoutprocess'">Logout</button>
		<button type="button" class="btn btn-outline-danger" id="btnlogout">AjaxLogout</button>
	</c:if>
</body>
</html>