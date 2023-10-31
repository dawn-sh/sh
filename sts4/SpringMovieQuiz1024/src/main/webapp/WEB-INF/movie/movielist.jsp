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
<style type="text/css">
	body{
		background-color: black;
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
	<div>
		<div style="margin: 30px 30px;">
			<button type="button" class="btn btn-outline-secondary"
			onclick="location.href='writeform'">영화 추가</button>
		</div>
		<div>
		<c:forEach var="dto" items="${list }">
			<div style="float: left; margin: 100px 30px;">
				<a href="detail?num=${dto.num }" style="text-decoration: none;">
					<figure>
						<img alt="" src="../moviephoto/${dto.poster }" width="300">
						<figcaption><h4 style="color: white;" align="center"><b>${dto.title }</b></h4></figcaption>
					</figure>
				</a>
			</div>
		</c:forEach>
		</div>
	</div>
</body>
</html>