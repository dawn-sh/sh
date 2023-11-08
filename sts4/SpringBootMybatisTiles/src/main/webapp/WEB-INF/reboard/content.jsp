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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
	
		$("div.likes").click(function(){
			
			var star=$(this).find("i").attr("class");
			
			//속성 변경 방법
			if(star=='bi bi-star-fill')
			{
				$(this).find("i").attr("class","bi bi-star").css("color","lightblue");
			}
			else
			{
				$(this).find("i").attr("class","bi bi-star-fill").css("color","gold");
			}
			
			var num=${dto.num};
			//alert(num);
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"likes",
				data:{"num":num},
				success:function(res){
					
					//올라가는 숫자에 직접 숫자를 올려줘서 location.reload()를 안해줘도 된다
					//map으로 json타입으로 보냈기 때문에 가능
					//받아오는 값 없이 html로 받게 된다면 location.reload() 필수
					//$(".likesnum").html(res.likes);
					$("div.likes").find("b").html(res.likes);
				}
			})
		});
	});
</script>
</head>
<body>

	<div style="width: 600px; margin: 50px 100px;">
		<table class="table table-bordered">
			<tr>
				<td>
					<h2>${dto.subject }</h2>
					<b>${dto.name }(${dto.id })</b><br>
					<span style="color: gray; font-size: 0.8em;">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
						조회:${dto.readcount }
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<pre>${dto.content }</pre><br><br>
					<c:if test="${dto.photo!=null }">
						<c:forEach var="photo" items="${dto.photo }">
							<img alt="" src="../rephoto/${photo }" width="100" class="img-thumbnail">
						</c:forEach>
					</c:if>
					<br><br>
					<div class="likes" num=${dto.num }>
						<i class="bi bi-star-fill" style="color: gold; cursor: pointer;"></i>
						추천 <b class="likesnum">${dto.likes }</b>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">REWRITE</button>
					
					<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">
						<button type="button" class="btn btn-outline-warning"
							onclick="location.href=''">MODIFY</button>
						<button type="button" class="btn btn-outline-danger"
							onclick="location.href=''">DELETE</button>
					</c:if>

					<button type="button" class="btn btn-outline-success"
					onclick="location.href='list?currentPage=${currentPage}'">LIST</button>
					
					
					<c:if test="${sessionScope.loginok!=null}">
						<button type="button" class="btn btn-outline-info"
						onclick="location.href='form'">WRITE</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>


</body>
</html>