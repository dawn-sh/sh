<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<fmt:requestEncoding value="utf-8"/>
	<form action="" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control"
					style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age" class="form-control"
					style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th>급여</th>
				<td>
					<input type="text" name="pay" class="form-control"
					style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th>가고싶은나라</th>
				<td>
					<input type="text" name="nara" class="form-control"
					style="width: 120px;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">결과확인</button>
				</td>
			</tr>
		</table>
		
		<!-- 이름을 입력했을 경우에만 출력 div 출력
		
			이름: 김영환
			나이: 19세(미성년자)..조건-20살 이상이면 성년 아니면 미성년
			월급여: 180만원..화폐단위와 천단위 구분기
			가고싶은나라: choose이용해서 출력은 맘대로 할것!!!
		 -->
		<c:if test="${!empty param.name }">
			<div class="alert alert-info" style="width: 400px;">
			<h2>이름: ${param.name }</h2>
			<h2>나이: ${param.age }세
			<c:if test="${param.age>=20}">
				(성년)
			</c:if>
			<c:if test="${param.age<20 }">
				(미성년)
			</c:if>
			</h2>
			<h2><fmt:formatNumber value="${param.pay }" type="currency"/></h2>
			
			<c:choose>
				<c:when test="${param.nara=='미국' }">
					<h2>미국 배낭여행 가보고 싶다</h2>
				</c:when>
				<c:when test="${param.nara=='캐나다' }">
					<h2>캐나다 워홀 가보고 싶다</h2>
				</c:when>
				<c:when test="${param.nara=='한국' }">
					<h2>한국에서 취업하고 싶다</h2>
				</c:when>
				<c:when test="${param.nara=='일본' }">
					<h2>일본 온천여행 가고 싶다</h2>
				</c:when>
			</c:choose>
			</div>
		</c:if>
	</form>
</body>
</html>