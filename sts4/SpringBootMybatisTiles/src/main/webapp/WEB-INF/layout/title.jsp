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
</head>
<body>
<!-- root경로 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<a href="/"><img alt="" src="${root }/image/title.png" width="300">
	<b>SpringBoot+Mybatis+Tiles</b></a>
	&nbsp;&nbsp;
	
	<c:if test="${sessionScope.loginok==null }">
		<button type="button" class="btn btn-success"
		onclick="location.href='${root}/login/main'">Login</button>
	</c:if>
	<c:if test="${sessionScope.loginok!=null }">
		<b>${sessionScope.myid }님 로그인 중...</b>
		<button type="button" class="btn btn-danger"
		onclick="location.href='${root}/login/logoutprocess'">Logout</button>
	</c:if>
</body>
</html>