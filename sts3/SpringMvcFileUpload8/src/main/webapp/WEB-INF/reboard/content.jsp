<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 100px 100px;">
		<table class="table table-bordered" style="width: 600px;">
			<caption align="top"><b>내용보기</b></caption>
			<tr>
				<td>
					<h2><b>${dto.subject }</b></h2>
					<span style="float: right; margin-right: 20px;">
						조회:${dto.readcount }&nbsp;&nbsp;&nbsp;
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					</span>
				</td>
				<br>
				<h5><b>작성자: ${dto.writer }</b></h5>
			</tr>
			
			<tr>
				<td>
					<pre>${dto.content }</pre>
					<br><br>
					<c:if test="${dto.photo!='no' }">
						<c:forTokens var="pho" items="${dto.photo }" delims=",">
							<!-- a태그에 img의 주소를 그대로 적으면 원본 사진으로 나오게 할 수 있다 -->
							<a href="../upload/${pho }">
								<img alt="" src="../upload/${pho }" style="width: 150px;
								border: 1px solid green; border-radius: 20px;">
							</a>
						</c:forTokens>
					</c:if>
				</td>
			</tr>
			
			
			
			<!-- 댓글 -->
			<tr>
				<td>
					<div id="answer">
						<b>댓글: ${acount }</b><br><br>
						<c:forEach var="a" items="${alist }">
							${a.nickname }:${a.content }&nbsp;&nbsp;
							<span style="color: gray; font-size: 0.9em">
								<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
							</span>
							&nbsp;&nbsp;
							<i class="adel bi bi-file-minus" style="cursor: pointer;" idx="${a.idx }"></i>
							<br>
						</c:forEach>
					</div>
					
					<form action="ainsert" method="post" style="width: 600px;">
						<input type="hidden" name="num" value="${dto.num }">
						<input type="hidden" name="currentPage" value="${currentPage }">
						
						<div class="d-inline-flex">
							<b>닉네임: </b>
							<input type="text" name="nickname" class="form-control"
							style="width: 120px;" required="required">
							
							<b>비밀번호: </b>
							<input type="password" name="pass" class="form-control"
							style="width: 120px;" required="required">
						</div>
						<br>
						<div class="d-inline-flex">
							<input type="text" name="content" class="form-control"
							style="width: 500px;" placeholder="댓글내용을 입력해주세요">
							<button type="submit" class="btn btn-outline-info">확인</button>
						</div>
					</form>
				</td>
			</tr>
			
			
			
			
			<tr>
				<td align="right">
					<button class="btn btn-outline-info" onclick="location.href='writeform'">글쓰기</button>
					<button class="btn btn-outline-secondary" onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글달기</button>
																					<!-- 게시물 마다의 비밀번호 입력 폼 띄우기
																						 n페이지에 있는걸 넘겨주고 수정 해야지 그 페이지로 돌아가기 때문에 currentPage도 함께 넘겨줘야함 -->
					<button class="btn btn-outline-warning" onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button class="btn btn-outline-danger" onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					<button class="btn btn-outline-success" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				</td>
			</tr>
		</table>
	</div>
	
	<script type="text/javascript">
	    $("i.adel").click(function() {
	        var idx = $(this).attr("idx");
	        var pass = prompt("비밀번호 입력");
	        
	        if(pass==null)
	        	return;
	        else{
	            $.ajax({
	                type: "get",
	                url: "adelete", //Controller에서 정한 mapping주소 넣어주면 된다
	                data: { "idx": idx,"pass":pass}, //이 값들을 AnswerRestController로 보냄 그 값을 dao의 check로 확인함 Controller에서 json형태로 변환되는건 check변수 하나
	                dataType: "json",
	                success: function(res) {
	                	if(res.check==0)
	                	{
	                		alert("비밀번호가 맞지 않습니다");
	                	}
	                	else{
	                		alert("댓글을 삭제합니다");
	                    	location.reload();
	                	}
	                },
	                error: function() {
	                    alert("오류가 발생했습니다.");
	                }
	            });
	        }
	    });
	</script>
	
</body>
</html>