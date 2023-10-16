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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h3 class="alert alert-warning">${count }</h3>
	
	<br><br>
	<button type="button" class="btn btn-info btn-sm"
	onclick="location.href='addform'">글쓰기</button>
	
	<hr>
	<table class="table table-bordered" style="width: 900px;">
		<tr>
			<th width="60">번호</th>
			<th width="150">이름</th>
			<th width="400">주소</th>
			<th width="200">사진</th>
			<th width="160">운전면허</th>
			<th width="160">가입날짜</th>
			<th width="160">편집</th>
		</tr>
		<c:forEach var="in" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${in.name }</td>
				<td>${in.addr }</td>
				<td>
					<c:if test="${in.photo=='no' }">
						<!-- "/(루트)"바로 다음에 image가 와야하기 때문에 ../로 하나 거슬로 올라가야한다
							 mapping이 info/infolist이기 때문 -->
						<img alt="" src="../photo/no image.jpeg" width="50" height="50"
						class="img-circle">
					</c:if>
					<c:if test="${in.photo!='no' }">
						<img alt="" src="../photo/${in.photo }" width="50" height="50"
						class="img-circle">
					</c:if>
				</td>
				<td>
					${in.driver }
				</td>
				<td>
					<fmt:formatDate value="${in.gaipday }" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<button type="button" class="btn btn-outline-warning btn-sm"
					onclick="location.href='uform?num=${in.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
					onclick="location.href='delete?num=${in.num}'">삭제</button>
					
				</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<!-- 검색기능
		 지금상태에서는 list mapping에 추가해야해서 action이 list -->
	
	<div style="width: 900px; text-align: center;">
		<form action="list" class="d-inline-flex">
			<select name="title" class="form-control" style="width: 120px;">
				<!-- title의 값이 어떤 것이냐에 따라 selected -->
				<option value="name" ${title=='name'?"selected":"" }>이름</option>
				<option value="addr" ${title=='addr'?"selected":"" }>주소</option>
				<option value="driver" ${title=='driver'?"selected":"" }>운전면허</option>
			</select>
			
			<input type="text" name="search" class="form-control"
			placeholder="검색단어" style="width: 150px;" value="${search }">
			
			<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>
	
	
</body>
</html>