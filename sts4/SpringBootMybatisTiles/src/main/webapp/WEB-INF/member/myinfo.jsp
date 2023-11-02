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
		
		$(".btnnewphoto").click(function(){
			
			$("#newphoto").trigger("click");
		});
		
		
		$("#newphoto").change(function(){
			
			var num=$(this).attr("num");
			console.log(num);
			
			/* ajax update시 FormData생성 */
			var form=new FormData();
			form.append("photo",$(this)[0].files[0]); //선택한 1개만 추가하겠다..배열이 아니어도 형식상 배열의 0번째로 작성
			form.append("num",num); //num값을 form에 넘겨줘야함
			
			console.dir(form); //FormData 값 확인 후 ajax
			
			$.ajax({
				
				//정보 보안으로 post
				type:"post",
				//MemberController.java에서 넘어오지 않고 처리만 했기 때문에 html
				dataType:"html",
				url:"updatephoto",
				processData:false, //Jquery 내부적으로 쿼리 스트링을 만들어 data 파라미터를 전송하는데, 파일 전송에서는 이를 피해야 한다고 한다
				contentType:false, //이 줄이 enctype으로 해주겠다는 의미
								   //일반적으로 폼에 enctype 올 벌도로 지정하지 않을 경우
								   //default 값이 앞서 이야기한 application/x-www-form-urlencoded 이므로 false를 설정해 주는 것이 맞다.
				data:form, //위에서 만든 FormData변수 넘기기
				success:function(){
					
					location.reload();
				}
			});
		});
		
		//나의 정보 삭제(탈퇴)
		$(".btndelete").click(function(){
			
			var num=$(this).attr("num");
			//alert(num);
			
			var ans=confirm("삭제하시겠습니까?");
			
			if(ans)
			{
				$.ajax({
					
					type:"get",
					dataType:"html",
					url:"deleteme",
					data:{"num":num},
					success:function(){
						
						alert("삭제 완료");
						location.href="/";
					}
				});
			}
		});
		
		
		$(".btnmodify").click(function() {
		    var num = $(this).attr("num");
			
			//alert(name+addr+email+num);
		    $("#modalmodify").modal("show");
		    
		    $("#btnajaxmodify").click(function(){
		    	
		    	var name=$("#ajaxname").val();
				var addr=$("#ajaxaddr").val();
				var email=$("#ajaxemail").val();
				
		    	$.ajax({
		    		
		    		type:"get",
		    		dataType:"html",
		    		url:"ajaxupdate",
		    		data:{"num":num,"name":name,"addr":addr,"email":email},
		    		success:function(){
		    			
		    			location.reload();
		    		}
		    	});
		    });
		});
		
		
	});
</script>
</head>
<body>
	<c:forEach var="dto" items="${list }">
		<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">
			<table style="width: 600px;">
				<caption align="top">
					<h3 style="margin-left: 300px;">나의 정보</h3>
				</caption>
				<tr>
					<td rowspan="6" align="center">
						<figure>
							<img alt="" src="../memberphoto/${dto.photo }" width="300">
							<br>
							<input type="file" style="display: none;" num="${dto.num }" id="newphoto"> <!-- for문에 여러개 있을때 각 정보에 해당하는 num값이 필요하기 때문에 num값 부여 -->
							<!-- 사진 수정시 호출 -->
							<button type="button" class="btn btn-outline-warning btnnewphoto">사진수정</button>
						</figure>
					</td>
					<td>이름: ${dto.name }</td>
				</tr>
				<tr>
					<td>아이디: ${dto.id }</td>
				</tr>
				<tr>
					<td>주소: ${dto.addr }</td>
				</tr>
				<tr>
					<td>이메일: ${dto.email }</td>
				</tr>
				<tr>
					<td>가입일: <fmt:formatDate value="${dto.gaipday }"
							pattern="yyyy-MM-dd" />
					</td>
				</tr>
				<tr align="center">
					<td>
						<button type="button" class="btn btn-warning btn-sm btnmodify" num="${dto.num }" data-bs-dismiss="modal" data-bs-target="#modalmodify">수정</button>
						<button type="button" class="btn btn-danger btn-sm btndelete" num="${dto.num }">삭제</button>
						<!-- 버튼에 이벤트가 2가지면 충돌날 수 있다 (onclick,$(".btndelete")) -->
					</td>
				</tr>
			</table>

			<!-- The Modal -->
			<div class="modal" id="modalmodify">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">AjaxModify</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<table class="table table-bordered">
								<tr>
									<td>
										<input type="text" class="form-control" id="ajaxname" value="${dto.name }">
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" class="form-control" id="ajaxaddr" value="${dto.addr }">
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" class="form-control" id="ajaxemail" value="${dto.email }">
									</td>
								</tr>
							</table>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-info" id="btnajaxmodify"
								data-bs-dismiss="modal">Modify</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
			</div>


		</c:if>
	</c:forEach>


</body>
</html>