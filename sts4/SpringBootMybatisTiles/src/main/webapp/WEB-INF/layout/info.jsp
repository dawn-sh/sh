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
<c:set var="root" value="<%=request.getContextPath() %>"/>

	<c:if test="${sessionScope.loginok==null }">
		<img alt="" src="${root }/image/233.jpg" width="180"><br>
	</c:if>
	<c:if test="${sessionScope.loginok!=null }">
		<img alt="" src="${root }/memberphoto/${sessionScope.loginphoto}" width="180"><br>
	</c:if>
	각종 정보 나타내게 해올 것!!!
</body>
</html>